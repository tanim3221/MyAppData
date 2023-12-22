import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Box, IconButton, Stack, Typography, Dialog, DialogContent, DialogTitle, Table, TableHead,Snackbar, TableRow, TableCell, TableBody, CircularProgress } from '@mui/material';
import { Visibility, Delete, Close } from '@mui/icons-material'
import { styled } from '@mui/material/styles';

import { fetchData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function Contact() {
  const [contact, setData] = useState([]);
  const [mainData, setMainData] = useState({});
  const [loading, setLoading] = useState(true);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [open, setOpen] = useState(false);
  const TABLE_NAME = 'contact_messages';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.contact_messages);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
  }, []);
  // const handleReply = () => {
  // }

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
        const deletedData = contact.filter(item => item.id !== id);
        setData(deletedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleClose = () => {
    setOpen(false);
    setMainData({});
  };
  const StyledContainer = styled(Box)(({ theme }) => ({
    marginTop: theme.spacing(2),
    gap: theme.spacing(2),
    padding: theme.spacing(2),
    backgroundColor: theme.palette.background.paper,
    border: `1px solid ${theme.palette.divider}`,
    borderRadius: theme.spacing(1),
  }));

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{mainData.subject}</DialogTitle>
        <DialogContent>
          <Typography variant="body1"><strong>Recipient:</strong> {mainData.email}</Typography>
          <StyledContainer>
            <Typography variant="body1">{mainData.message}</Typography>
          </StyledContainer>
          <Typography variant="body1" style={{ marginTop: '1rem' }} ><strong>Date Send:</strong> {mainData.date_added}</Typography>
          <Stack spacing={2} direction="row" style={{ marginTop: '2rem' }} justifyContent="space-between">
              <Button style={{backgroundColor:'maroon', color:'white'}} variant="outlined" onClick={() => handleDelete(mainData.id)}><Delete/></Button>
              <Button variant="outlined" onClick={handleClose}>Close</Button>
          </Stack>

        </DialogContent>
      </Dialog>

    );
  };
  return (
    <Container maxWidth="lg" className={extStyles.container}>
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
                <TableCell>Mobile</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Subject</TableCell>
                <TableCell>Date</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {contact.map((item, index) => (
                <TableRow key={item.id}>
                  <TableCell>{index + 1}</TableCell>
                  <TableCell>{item.name}</TableCell>
                  <TableCell>{item.mobile}</TableCell>
                  <TableCell>{item.email}</TableCell>
                  <TableCell>{item.subject}</TableCell>
                  <TableCell>{item.date_added}</TableCell>
                  <TableCell>
                    <Button onClick={() => {
                      setMainData(item);
                      setOpen(true);
                    }}>
                      <Visibility />
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
export default Contact;
