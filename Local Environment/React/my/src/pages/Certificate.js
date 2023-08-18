import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, Link, Snackbar, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, TableRow, Select, FormControl, MenuItem, InputLabel, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check } from '@mui/icons-material'
import { fetchData, updateData, addData, deleteData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Certificate() {
  const [data, setData] = useState([]);
  const [issuerList, setIssuerList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);

  const TABLE_NAME = 'certifications';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setIssuerList(responseData.saklayen.issuer_list);
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
            <FormControl sx={{minWidth: 120 }}>
              <InputLabel id="issuer_label">Issued By</InputLabel>
              <Select
                labelId="issuer_label"
                label="Issued By"
                value={mainData.issuer}
                onChange={handleChange}
                name='issuer'
              >
                {
                  issuerList.map(item => (
                    <MenuItem key={item.id} value={item.name}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>

            <TextField
              label="Certificate Title"
              name='title'
              value={mainData.title}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Certificate Link"
              name='link'
              value={mainData.link}
              type='url'
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />

            <TextField
              label="Date Issued"
              name='date'
              value={(!mainData.date) ? new Date() : mainData.date}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />

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
                <TableCell>Title</TableCell>
                <TableCell>Issuer</TableCell>
                <TableCell>Date</TableCell>
                <TableCell>Link</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.issuer}</TableCell>
                  <TableCell>{item.date}</TableCell>
                  <TableCell><Link /></TableCell>
                  <TableCell>                    <Button
                    onClick={() => {
                      setMainData(item);
                      setOpen(true);
                      setIsAdding(false)
                    }}
                  >
                    <Edit />
                  </Button></TableCell>
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

export default Certificate;
