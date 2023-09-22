import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Table, TableHead,FormControl,InputLabel,MenuItem,Select, TableRow, TableCell, TableBody, Dialog, DialogContent, TextField, Autocomplete, CircularProgress, Snackbar, DialogTitle, Box, Stack } from '@mui/material';
import { Edit, Delete, Check} from '@mui/icons-material'
import { fetchData, addData, deleteData, updateData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function Languages() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [lnrIcon, setLnrIcon] = useState([]);
  const [selectedIcon, setSelectedIcon] = useState(null);
  const [selectedVisible, setSelectedVisibility] = useState('');



  const TABLE_NAME = "languages";
  const ICON_TABLE_NAME = "lnr_icon";


  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setLnrIcon(responseData.saklayen[ICON_TABLE_NAME]);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, [dataChanged]);

  const handleVisibilityChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      visibility: selectedValue,
    }));
    setSelectedVisibility(selectedValue);
  };

  const resetMainDataState = () => {
    setMainData({});
  }

  const handleAdd = () => {
    const requestData = {
      table: TABLE_NAME,
      data: mainData
    };
    addData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const addData = [...data, mainData];
        setData(addData);
        setOpen(false);
        setIsAdding(false);
        setMainData({});
        setDataChanged(!dataChanged);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleDelete = (id) => {
    const requestData = {
      table: TABLE_NAME,
      id,
      action: 'delete',
    };

    deleteData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const deletedData = data.filter(item => item.id !== id);
        setData(deletedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleSave = () => {

    const existingData = data.find(item => item.id === mainData.id);
    const isDataChanged = JSON.stringify(mainData) !== JSON.stringify(existingData);

    if (!isDataChanged) {
      setSnackbarMessage("No changes to save.");
      setSnackbarOpen(true);
      setOpen(false);
      return;
    }
    const requestData = {
      table: TABLE_NAME,
      data: mainData
    };

    updateData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const updatedData = data.map(item => {
          if (item.id === mainData.id) {
            return { ...item, ...mainData };
          }
          return item;
        });

        setData(updatedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleClose = () => {
    setOpen(false)
    // resetMainDataState();
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  }
  const handleIconChange = (event, newValue) => {
    const selectedValue = newValue ? newValue.icon_code : ''; // Extract icon_code
    setMainData((prevData) => ({
      ...prevData,
      icon: selectedValue,
    }));
    setSelectedIcon(selectedValue);
  };

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Languages' : mainData.title}</DialogTitle>
        <DialogContent>
          <Box 
            component="form"
            sx={{
              marginTop: '1rem',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr',
              gap: '1rem'
            }}
          >
            <TextField
            label="Rank"
            name="rank"
            value={mainData.rank}
            onChange={handleChange}
            />
            <Autocomplete
              options={lnrIcon}
              name="icon"
              value={lnrIcon.find((icon) => icon.icon_code === selectedIcon)} // Find option by icon_code
              onChange={handleIconChange}
              getOptionLabel={(icon) => icon.icon_code}
              renderInput={(params) => (
                <TextField {...params} label="Icon" variant="outlined" />
              )}
            />
             <TextField
            label="Title"
            name="title"
            value={mainData.title}
            sx={{ gridColumn: 'span 2' }}
            onChange={handleChange}
            />
             <TextField
            label="Description"
            name="description"
            multiline
            rows={10}
            value={mainData.description}
            onChange={handleChange}
            sx={{ gridColumn: 'span 2' }}
            />
                        <FormControl  sx={{ gridColumn: 'span 2' }}>
              <InputLabel id="Visibility">Visibility</InputLabel>
              <Select
                labelId="Visibility"
                label="Visibility"
                value={selectedVisible}
                onChange={handleVisibilityChange}
                name='visibility'
              >
                <MenuItem key={1} value={1}>Show</MenuItem>
                <MenuItem key={2} value={0}>Hide</MenuItem>
              </Select>
            </FormControl>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-start">
            {isAdding ? null : <Button style={{backgroundColor:'maroon', color:'white'}} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete/></Button>}
            </Stack>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={isAdding ? handleAdd : handleSave}>{isAdding ? 'Add' : <Check/> }</Button>
            </Stack>
            </Box>
        </DialogContent>
      </Dialog>
    );
  };

  return (
    <Container maxWidth="lg" style={{ marginTop: '.3rem' }}>
      <Button
        variant="contained"
        onClick={() => {
          setOpen(true);
          setIsAdding(true);
          resetMainDataState();
        }}
        style={{ marginBottom: '1.3rem' }}>Add New</Button>
      <TableContainer component={Paper}>
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>SL</TableCell>
                <TableCell>Title</TableCell>
                <TableCell>Description</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.description}</TableCell>
                  <TableCell>
                    <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setSelectedIcon(item.icon);
                        setSelectedVisibility(item.visibility);

                        setIsAdding(false)
                      }}
                    >
                      <Edit />
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </TableContainer>
      <Snackbar
        anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
        open={snackbarOpen}
        autoHideDuration={3000}
        onclose={() => setSnackbarOpen(false)}
        message={snackbarMessage} />
      {renderDialog()}
    </Container>
  );
}

export default Languages;
