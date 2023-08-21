import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Box, Stack, Typography, Dialog, DialogContent, DialogTitle, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress } from '@mui/material';
import { Visibility } from '@mui/icons-material'
import { styled } from '@mui/material/styles';

import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Contact() {
  const [contact, setData] = useState([]);
  const [mainData, setMainData] = useState({});
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(false);
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
          <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
            <Button variant="outlined" onClick={handleClose}>Close</Button>
            {/* <Button variant="contained" onClick={handleReply}>Reply</Button> */}
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
      {renderDialog()}
    </Container>
  );
}
export default Contact;
