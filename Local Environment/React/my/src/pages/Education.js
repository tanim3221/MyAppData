import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Button, Dialog, DialogTitle, Snackbar, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';


function Education({ education, onClose, onChange }) {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [edu, setEducation] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.education);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
  }, []);


  const handleOpen = () => {
    setOpen(true);
  };

  const handleSave = () => {
    axios.post('http://localhost:8080/saklayen/assets/api/update.php', edu)
    .then(response => {
      setSnackbarMessage('Changes saved successfully!');
      setSnackbarOpen(true);
      const updatedData = data.map(item => {
        if (item.id === edu.id) {
          return { ...item, ...edu };
        }
        return item;
      });

      setData(updatedData);
      setOpen(false);
    })
    .catch(error => {
      console.error(error);
      setSnackbarMessage('Something went wrong!');
      setSnackbarOpen(true);
    });
  }

  const handleClose = () => {
    setOpen(false);
  };


  const handleChange = (event) => {
    const { name, value } = event.target;
    setEducation((prevEdu) => ({
      ...prevEdu,
      [name]: value
    }));
  };

  const renderDialog = () => {

    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{edu.title}</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              '& .MuiTextField-root': { my: 1, mr: 2, width: '25ch' }
            }}
          >
            <TextField
              label="Rank"
              name='rank'
              value={edu.rank}
              onChange={handleChange}
            />
            <TextField
              label="Degree"
              name='title'
              value={edu.title}
              onChange={handleChange}
            />
            <TextField
              label="Time-Period"
              name='period'
              value={edu.period}
              onChange={handleChange}
            />
            <TextField
              label="Institution"
              name='institution'
              value={edu.institution}
              onChange={handleChange}
            />
            <TextField
              label="Department"
              name='department'
              value={edu.department || ''}
              onChange={handleChange}
            />
            <TextField
              label="Grade"
              name='grade'
              value={edu.grade || ''}
              onChange={handleChange}
            />
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-start">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={handleSave}>Save</Button>
            </Stack>
          </Box>

        </DialogContent>

      </Dialog>
    );
  };

  return (
    <Container maxWidth="lg" style={{ marginTop: '2rem' }}>
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
                        setEducation(item);
                        setOpen(true);
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
