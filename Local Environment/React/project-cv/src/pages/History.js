import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, TableBody, TableRow, Snackbar, Table, TableContainer, TableCell, TableHead, List, ListItem, ListItemText, TextField, InputAdornment, Paper, Grid, FormControl, InputLabel, Input, Select, MenuItem, Dialog, Button, DialogContent, DialogTitle, CircularProgress, Divider } from '@mui/material';
import { Search } from '@mui/icons-material';

import { getSearchLog } from '../auth/api';
import extStyles from '../utils/styles.module.css';


export default function History() {

  const [loading, setLoading] = useState(true);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [searchLog, setSearchLog] = useState([]);

  useEffect(() => {
    getSearchLog()
      .then(responseData => {
        setSearchLog(responseData.result || []); // Ensure searchLog is always an array
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
        setSearchLog([]); // Set searchLog to an empty array in case of an error
        setSnackbarOpen(true);
        setSnackbarMessage('Error fetching data.'); // Display a message in case of an error.
      });
  }, []);
  
  console.log("dataLength:",searchLog.length);

  return (
    <Container maxWidth="xl">
      {loading ? (
        <div className={extStyles.spinnerarea}>
          <CircularProgress />
        </div>
      ) : (
        <>
         {searchLog.length === 0 ? (
            <div>No history log found</div>
          ) : (
            <TableContainer>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>SL</TableCell>
                    <TableCell>Keywords</TableCell>
                    <TableCell>Search By</TableCell>
                    <TableCell>Found</TableCell>
                    <TableCell>Date Search</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {searchLog.map((item, index) => (
                    <TableRow key={item.id}>
                      <TableCell>{index + 1}</TableCell>
                      <TableCell>{item.keywords}</TableCell>
                      <TableCell>{item.username}</TableCell>
                      <TableCell>{item.found}</TableCell>
                      <TableCell>{item.date_search}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          )}
        </>
      )}

      <Snackbar
        anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
        open={snackbarOpen}
        autoHideDuration={3000}
        onClose={() => setSnackbarOpen(false)}
        message={snackbarMessage.toString()}
      />
    </Container>

  );
}