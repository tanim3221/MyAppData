import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, Snackbar, FormControl,InputLabel,MenuItem,Select, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check } from '@mui/icons-material'
import { fetchData, updateData, addData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function Education() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedVisible, setSelectedVisibility] = useState('');


  const TABLE_NAME = 'education';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
  }, [dataChanged]);

  const resetMainDataState = () => {
    setMainData({});
  }

  const handleVisibilityChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      visibility: selectedValue,
    }));
    setSelectedVisibility(selectedValue);
  };
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
    resetMainDataState();
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Education' : mainData.title}</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr', // Create a two-column layout
              gap: '16px', // Adjust the gap between columns
            }}
          >
            <TextField
              label="Rank"
              name='rank'
              value={mainData.rank}
              onChange={handleChange}
            />
            <TextField
              label="Degree"
              name='title'
              value={mainData.title}
              onChange={handleChange}
            />
            <TextField
              label="Institution"
              name='institution'
              value={mainData.institution}
              onChange={handleChange}
              sx={{ gridColumn: 'span 2' }}
            />
            <TextField
              label="Time-Period"
              name='period'
              value={mainData.period}
              onChange={handleChange}
            />

           <TextField
              label="Passing Year"
              name='passing'
              value={mainData.passing}
              onChange={handleChange}
            />

            <TextField
              label="Department"
              name='department'
              value={mainData.department || ''}
              onChange={handleChange}
              sx={{ gridColumn: 'span 2' }}

            />
            <TextField
              label="Grade"
              name='grade'
              value={mainData.grade || ''}
              onChange={handleChange}
            />
            <TextField
              label="Group"
              name='stream'
              value={mainData.stream || ''}
              onChange={handleChange}
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
          resetMainDataState();
          setIsAdding(true);
          setOpen(true);
        }}
        style={{ marginBottom: '1.3rem' }}
      >
        Add New
      </Button>
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
                <TableCell>Degree</TableCell>
                <TableCell>Time-Period</TableCell>
                <TableCell>Institution</TableCell>
                <TableCell>Department</TableCell>
                <TableCell>Grade</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.period}</TableCell>
                  <TableCell>{item.institution}</TableCell>
                  <TableCell>{item.department}</TableCell>
                  <TableCell>{item.grade}</TableCell>
                  <TableCell>
                    <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setIsAdding(false);
                        setSelectedVisibility(item.visibility);

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
        onClose={() => setSnackbarOpen(false)}
        message={snackbarMessage}
      />
      {renderDialog()}
    </Container>
  );
}

export default Education;
