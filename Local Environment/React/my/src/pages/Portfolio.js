import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, Link, CircularProgress } from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Portfolio() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.portfolio);
        setLoading(false);

      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, []);

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
                  <TableCell>{item.category}</TableCell>
                  <TableCell><Link target={'_blank'} href={item.link}>URL</Link></TableCell>
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

export default Portfolio;
