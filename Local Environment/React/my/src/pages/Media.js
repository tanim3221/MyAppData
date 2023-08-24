import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, Snackbar, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, Input, TableRow, Select, FormControl, MenuItem, InputLabel, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check } from '@mui/icons-material'

import { fetchData, updateData, deleteData, addMedia } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Media() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('');
  const [selectedFile, setSelectedFile] = useState(null);

  const TABLE_NAME = 'media';

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

  const handleAdd = (event) => {
    event.preventDefault();
    const formData = new FormData();
    formData.append('file_text', mainData.file_text);
    formData.append('file_category', mainData.file_category);
    formData.append('file_name', selectedFile);

    const formDataArray = [...formData.entries()];

    const requestData = {
      table: TABLE_NAME,
      data: formDataArray.reduce((obj, [key, value]) => {
        obj[key] = value;
        return obj;
      }, {})
    };

    console.log('requestData', requestData);

    addMedia(requestData)
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

    try {
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
    } catch (error) {
      console.error(error);
      setSnackbarMessage(error);
      setSnackbarOpen(true);
    }
  }

  const handleClose = () => {
    setOpen(false)
    // resetMainDataState();
  };

  const fileCategory = [
    { id: 1, name: 'Portfolio', value: 'portfolio' },
    { id: 2, name: 'Profile', value: 'profile' },
    { id: 3, name: 'Logo', value: 'logo' },
    { id: 4, name: 'Blog', value: 'blog' },
    { id: 5, name: 'Certificate', value: 'certificate' },
  ]

  const handleCategoryChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      file_category: selectedValue,
    }));
    setSelectedCategory(selectedValue);
  };

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    setMainData((prevData) => ({
      ...prevData,
      file_name: file,
    }));
    setSelectedFile(file);
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
        <DialogTitle>Add new Media</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr',
              gap: '16px',
            }}
          >
            <TextField
              label="File Name"
              name='file_text'
              value={mainData.file_text}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="file_cat">File Category</InputLabel>
              <Select
                labelId="file_cat"
                label="File Category"
                value={selectedCategory}
                onChange={handleCategoryChange}
                name='file_category'
              >
                {
                  fileCategory.map(item => (
                    <MenuItem key={item.id} value={item.value}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>

            <Input
              type='file'
              name='file_name'
              onChange={handleFileChange}
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
                <TableCell>File Name</TableCell>
                <TableCell>File Category</TableCell>
                <TableCell>Extention</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((item, index) => (
                <TableRow key={item.id}>
                  <TableCell>{index + 1}</TableCell>
                  <TableCell>{item.file_text}</TableCell>
                  <TableCell>{item.file_category}</TableCell>
                  <TableCell>{item.file_ext}</TableCell>
                  <TableCell>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <Button
                        variant="outlined"
                        onClick={() => {
                          setMainData(item);
                          setOpen(true);
                          setSelectedCategory(item.file_category);
                          setIsAdding(false)
                        }}
                      >
                        <Edit />
                      </Button>
                    </div>
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

export default Media;
