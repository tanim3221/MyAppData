import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, IconButton,Snackbar, Box,  DialogContent, TextField, TableContainer, Paper,FormControl,InputLabel,MenuItem,Select, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check, Close } from '@mui/icons-material'
import { fetchData, updateData, addData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';
// eslint-disable-next-line
import {properCase} from '../utils/commonFunction';


function Skill() {
  const [data, setData] = useState([]);
  const [techcat, setTechCat] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('');
  const [selectedTechCategory, setSelectedTechCategory] = useState('');
  const [selectedVisible, setSelectedVisibility] = useState('');

  const TABLE_NAME = 'skills';
  const TABLE_NAME_CAT = 'categories';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setTechCat(responseData.saklayen[TABLE_NAME_CAT]);
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

  const handleTechCategoryChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      cat_id: selectedValue,
    }));
    setSelectedTechCategory(selectedValue);
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  const skillCategory = [
    { id: 1, name: 'Finance Accounting', value: 'finance_accounting' },
    { id: 2, name: 'Human Resource', value: 'human_resource' },
    { id: 3, name: 'Technology', value: 'technology' },
    { id: 4, name: 'Marketing', value: 'marketing' },
    { id: 5, name: 'Operations', value: 'operations' },
    { id: 6, name: 'Coding', value: 'coding' },
    { id: 7, name: 'Design', value: 'design' },
  ]

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Skill' : mainData.skill}</DialogTitle>
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
              <InputLabel id="Skill_Category">Skill Category</InputLabel>
              <Select
                labelId="Skill_Category"
                label="Skill Category"
                // value={mainData.category}
                // onChange={handleChange}
                value={selectedCategory}
                onChange={handleCategoryChange}
                name='category'
              >
                {
                  skillCategory.map(item => (
                    <MenuItem key={item.id} value={item.value}>{item.name}</MenuItem>
                  ))
                }

              </Select>
            </FormControl>
            <FormControl sx={{gridColumn: 'span 2' }}>
              <InputLabel id="Tech_Skill_Category">Tech Skill Area</InputLabel>
              <Select
                labelId="Tech_Skill_Category"
                label="Tech Skill Area"
                value={selectedTechCategory}
                onChange={handleTechCategoryChange}
                sx={{ gridColumn: 'span 2' }}
                name='cat_id'
              >
                {
                  techcat.map(item => (
                    <MenuItem key={item.id} value={item.id}>{item.category_name}</MenuItem>
                  ))
                }

              </Select>
            </FormControl>
            <TextField
              label="Skill Name"
              name='skill'
              value={mainData.skill}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Skill Level"
              name='level'
              value={mainData.level}
              sx={{ gridColumn: 'span 2' }}
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
                <TableCell>Skill Name</TableCell>
                <TableCell>Category</TableCell>
                <TableCell>Level</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.skill}</TableCell>
                  <TableCell>{properCase(item.category)}</TableCell>
                  <TableCell>{item.level}</TableCell>
                  <TableCell><Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setIsAdding(false)
                        setSelectedCategory(item.category);
                        setSelectedVisibility(item.visibility);

                        setSelectedTechCategory(item.cat_id);
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

export default Skill;
