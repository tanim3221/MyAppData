import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress} from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Others() {
  const [languages, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.languages);
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
                <TableCell>Title</TableCell>
                <TableCell>Description</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {languages.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.description}</TableCell>
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

export default Others;
