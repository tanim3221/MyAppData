import React, { useState, useEffect } from 'react';
import { Container, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress} from '@mui/material';
// import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function Visitors() {
  const [visitor, setVisit] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setVisit(responseData.saklayen.visitors);
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
                <TableCell>IP</TableCell>
                <TableCell>ISP</TableCell>
                <TableCell>Date</TableCell>
                <TableCell>Country</TableCell>
                {/* <TableCell>Action</TableCell> */}
              </TableRow>
            </TableHead>
            <TableBody>
              {visitor.map((item, index) => (
                <TableRow key={item.id}>
                  <TableCell>{index+1}</TableCell>
                  <TableCell>{item.ip}</TableCell>
                  <TableCell>{item.isp}</TableCell>
                  <TableCell>{item.visit_date}</TableCell>
                  <TableCell>{item.country}</TableCell>
                  {/* <TableCell><Button><Edit /></Button></TableCell> */}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </TableContainer>
    </Container>
  );
}

export default Visitors;
