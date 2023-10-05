import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Table, FormControl, InputLabel, MenuItem, Select, TableHead, TableRow, TableCell, TableBody, Dialog, DialogContent, TextField, CircularProgress, Snackbar, DialogTitle, Box, Stack, IconButton } from '@mui/material';
import { Edit, Delete, Check, Close } from '@mui/icons-material'
import { fetchData, addData, deleteData, updateData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function AuditType() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedVisible, setSelectedVisibility] = useState('');
  const [selectedForCV, setSelectedForCV] = useState('');

  const TABLE_NAME = "audit_type";

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

    // Update mainData state
    setMainData((prevData) => {
        let newCategory = prevData.category;
        if (name === "name") {
            newCategory = value.replace(/\s+/g, "_").toLowerCase();
        }
        return {
            ...prevData,
            [name]: value,
            key_name: newCategory,
        };
    });

    // Additionally, update visibility or for_cv states
    if (name === "visibility") {
        setSelectedVisibility(value);
    } else if (name === "for_cv") {
        setSelectedForCV(value);
    }
};

  // console.log('mainData',mainData);
  // console.log('data',data);

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add Audit Type' : mainData.name}</DialogTitle>
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
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Full Name"
              name="name"
              value={mainData.name}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <FormControl sx={{ gridColumn: 'span 2' }}>
              <InputLabel id="Visibility">Visibility</InputLabel>
              <Select
                labelId="Visibility"
                label="Visibility"
                value={mainData.visibility}
                onChange={handleChange}
                name='visibility'
              >
                <MenuItem key={1} value={1}>Show</MenuItem>
                <MenuItem key={2} value={0}>Hide</MenuItem>
              </Select>
            </FormControl>
            <FormControl sx={{ gridColumn: 'span 2' }}>
              <InputLabel id="for_cv">For CV</InputLabel>
              <Select
                labelId="for_cv"
                label="For CV"
                value={mainData.for_cv}
                onChange={handleChange}
                name='for_cv'
              >
                <MenuItem key={1} value={1}>Show</MenuItem>
                <MenuItem key={2} value={0}>Hide</MenuItem>
              </Select>
            </FormControl>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-start">
              {isAdding ? null : <Button style={{ backgroundColor: 'maroon', color: 'white' }} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete /></Button>}
            </Stack>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={isAdding ? handleAdd : handleSave}>{isAdding ? 'Add' : <Check />}</Button>
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
        style={{ marginBottom: '1rem' }}>Add New</Button>
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
                <TableCell>Audit Type</TableCell>
                <TableCell>Visibility</TableCell>
                <TableCell>For CV</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((item, index) => (
                <TableRow key={item.id}>
                  <TableCell>{index + 1}</TableCell>
                  <TableCell>{item.name}</TableCell>
                  <TableCell>
                    {Number(item.visibility) === 1 ? "Visible" : "Invisible"}
                  </TableCell>
                  <TableCell>
                    {Number(item.for_cv) === 1 ? "Visible" : "Invisible"}
                  </TableCell>
                  <TableCell>
                    <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setSelectedVisibility(item.visibility);
                        setSelectedForCV(item.for_cv);
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
        onClose={() => setSnackbarOpen(false)}
        message={snackbarMessage}
        action={
          <>
            <IconButton size="small" aria-label="close" color="inherit" onClick={() => setSnackbarOpen(false)}>
              <Close fontSize="small" />
            </IconButton>
          </>
        }
      />
      {renderDialog()}
    </Container>
  );
}

export default AuditType;
