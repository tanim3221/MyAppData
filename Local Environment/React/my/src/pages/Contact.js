import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress} from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Contact() {
  const [contact, setData] = useState([]);
  const [loading, setLoading] = useState(true);

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
              {contact.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.id}</TableCell>
                  <TableCell>{item.name}</TableCell>
                  <TableCell>{item.mobile}</TableCell>
                  <TableCell>{item.email}</TableCell>
                  <TableCell>{item.subject}</TableCell>
                  <TableCell>{item.date_added}</TableCell>
                  <TableCell><Button><Edit /></Button></TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </TableContainer>
    </Container>
  );
}

export default Contact;
