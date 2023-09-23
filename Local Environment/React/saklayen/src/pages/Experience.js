import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle,IconButton, Snackbar, Box, FormControl,InputLabel,MenuItem,Select, DialogContent, TextField, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check, Close } from '@mui/icons-material'
import { fetchData,addData, updateData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function Experience() {
  const [data, setData] = useState([]);
  const [extraData, setExtraData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [forExp, setForExp] = useState(true);
  const [selectedVisible, setSelectedVisibility] = useState('');


  const TABLE_NAME = 'experience';
  const TABLE_NAME_EXTRA = 'extra_curr';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setExtraData(responseData.saklayen[TABLE_NAME_EXTRA]);
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
      table: forExp ? TABLE_NAME : TABLE_NAME_EXTRA,
      data: mainData
    };
    addData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        if (forExp) {
          const addData = [...data, mainData];
          setData(addData);
        } else {
          const addData = [...extraData, mainData];
          setExtraData(addData);
        }

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
      table: forExp ? TABLE_NAME : TABLE_NAME_EXTRA,
      id,
      action: 'delete',
    };

    deleteData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        if (forExp) {
          const deletedData = data.filter(item => item.id !== id);
          setData(deletedData);
        } else {
          const deletedData = extraData.filter(item => item.id !== id);
          setExtraData(deletedData);
        }
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleSave = () => {

    const existingData = forExp ? data.find(item => item.id === mainData.id) : extraData.find(item => item.id === mainData.id);
    const isDataChanged = JSON.stringify(mainData) !== JSON.stringify(existingData);

    if (!isDataChanged) {
      setSnackbarMessage("No changes to save.");
      setSnackbarOpen(true);
      setOpen(false);
      return;
    }
    const requestData = {
      table: forExp ? TABLE_NAME : TABLE_NAME_EXTRA,
      data: mainData
    };

    updateData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        if (forExp) {
          const updatedData = data.map(item => {
            if (item.id === mainData.id) {
              return { ...item, ...mainData };
            }
            return item;
          });
          setData(updatedData);
        } else {
          const updatedData = extraData.map(item => {
            if (item.id === mainData.id) {
              return { ...item, ...mainData };
            }
            return item;
          });
          setExtraData(updatedData);
        }

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
        <DialogTitle>{isAdding ? forExp ? 'Add New Experience' : 'Add New Curricular Activities' : mainData.position}</DialogTitle>
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
              label="Time-Period"
              name='period'
              value={mainData.period}
              onChange={handleChange}
            />
            <TextField
              label="Position"
              name='position'
              value={mainData.position}
              onChange={handleChange}
            />

            <TextField
              label="Company"
              name='company'
              value={mainData.company}
              onChange={handleChange}
            />
            
            <TextField
              label="Department"
              name='department'
              value={mainData.department}
              sx={{ gridColumn: 'span 2' }}

              onChange={handleChange}
            />
            
            <TextField
              label="Company Address"
              name='address'
              value={mainData.address}
              sx={{ gridColumn: 'span 2' }}
              multiline
              rows={3}
              onChange={handleChange}
            />
            <TextField
              label="Job Responsibility"
              name='job_res'
              value={mainData.job_res || ''}
              sx={{ gridColumn: 'span 2' }}
              multiline
              rows={8}
              onChange={handleChange}
            />
            <TextField
              label="Description"
              name='description'
              value={mainData.description || ''}
              sx={{ gridColumn: 'span 2' }}
              multiline
              rows={10}
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
          setForExp(true);
          setOpen(true);
        }}
        style={{ marginBottom: '1rem', marginRight:'1rem' }}
      >
        Add New Experience
      </Button>
      <Button
        variant="contained"
        onClick={() => {
          resetMainDataState();
          setIsAdding(true);
          setForExp(false);
          setOpen(true);
        }}
        style={{ marginBottom: '1rem' }}
      >
        Add New Curricular Activities
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
                <TableCell>Company</TableCell>
                <TableCell>Position</TableCell>
                <TableCell>Time-Period</TableCell>
                <TableCell>Description</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.company}</TableCell>
                  <TableCell>{item.position}</TableCell>
                  <TableCell>{item.period}</TableCell>
                  <TableCell>{item.description}</TableCell>
                  <TableCell>
                  <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setForExp(true);
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
            <TableBody>
              {extraData.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.company}</TableCell>
                  <TableCell>{item.position}</TableCell>
                  <TableCell>{item.period}</TableCell>
                  <TableCell>{item.description}</TableCell>
                  <TableCell>
                  <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setForExp(false);
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

export default Experience;
