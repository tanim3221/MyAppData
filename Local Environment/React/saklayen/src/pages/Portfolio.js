import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, Snackbar, Link, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, FormControl, Select, InputLabel, MenuItem, TableRow, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check, Image } from '@mui/icons-material'
import { useNavigate } from 'react-router-dom';

import { fetchData, updateData, addData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';
import { properCase } from '../utils/commonFunction';

function Portfolio() {
  const [data, setData] = useState([]);
  const [portCategory, setPortCategory] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('');
  const [selectedFile, setSelectedFile] = useState(null);
  const [mediaList, setMediaList] = useState([]);
  const [selectedVisible, setSelectedVisibility] = useState('');


  const navigate = useNavigate();


  const TABLE_NAME = 'portfolio';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setPortCategory(responseData.saklayen.portfolio_filter);
        setMediaList(responseData.saklayen.media);
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
    // resetMainDataState();
  };

  const handleCategoryChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      category: selectedValue,
    }));
    setSelectedCategory(selectedValue);
  };

  const handleFileChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      imageLink: selectedValue,
    }));
    setSelectedFile(selectedValue);
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  const navigatePage = (url) => {
    navigate(url, { replace: true });
  }

  // const ITEM_HEIGHT = 48;
  // const ITEM_PADDING_TOP = 8;
  // const MenuProps = {
  //   PaperProps: {
  //     style: {
  //       maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
  //       width: 250,
  //     },
  //   },
  // };


  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Portfolio' : mainData.name}</DialogTitle>
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
            <FormControl>
              <InputLabel id="category">Category</InputLabel>
              <Select
                labelId="category"
                label="Category"
                value={selectedCategory}
                onChange={handleCategoryChange}
                name='category'
              >
                {
                  portCategory.map(item => (
                    <MenuItem key={item.id} value={item.category}>{item.text}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <TextField
              label="Name"
              name='name'
              value={mainData.name}
              onChange={handleChange}
              sx={{ gridColumn: 'span 2' }}
            />
            
            <TextField
              label="Link"
              name='link'
              value={mainData.link}
              onChange={handleChange}
              // sx={{ gridColumn: 'span 2' }}
            />
            <FormControl>
              <InputLabel id="issuer_label">Logo</InputLabel>
              <Select
                labelId="issuer_label"
                label="Logo"
                value={selectedFile}
                onChange={handleFileChange}
                name='imageLink'
              >
                {
                  mediaList.map(item => (
                    <MenuItem key={item.id} value={item.file_name}>{item.file_text}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
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
              {isAdding ? null : <Button style={{ backgroundColor: 'maroon', color: 'white' }} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete /></Button>}
            </Stack>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
            <Button variant="outlined" onClick={() =>navigatePage('/media-list')}><Image/></Button>
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
                <TableCell>Name</TableCell>
                <TableCell>Category</TableCell>
                <TableCell>Link</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.name}</TableCell>
                  <TableCell>{properCase(item.category)}</TableCell>
                  <TableCell><Link target={'_blank'} href={item.link}>URL</Link></TableCell>
                  <TableCell>
                    <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setSelectedCategory(item.category);
                        setSelectedFile(item.imageLink);
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
        onClose={() => setSnackbarOpen(false)}
        message={snackbarMessage}
      />
      {renderDialog()}
    </Container>
  );
}

export default Portfolio;
