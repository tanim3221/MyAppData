import React, { useState, useEffect } from 'react';
import { Container, Stack, Box, Snackbar, Typography, FormControl, InputLabel, Select, MenuItem, Dialog, Button, DialogContent, DialogTitle, CircularProgress } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import { fetchData, updateData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

export default function Home() {

  // const theme = useTheme();
  const [personal, setPersonal] = useState([{}]);
  const [mainData, setMainData] = useState({});
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(false);
  const [selectedStatus, setSelectedStatus] = useState('0');
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  // eslint-disable-next-line
  const navigate = useNavigate();

  const TABLE_NAME = 'personalinfo';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setPersonal(responseData.project_cv[TABLE_NAME][0]);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, []);

  const handleSave = () => {

    try {
      const existingData = (personal.id === mainData.id);
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
          const updatedData = { ...existingData, ...mainData };
          setPersonal(updatedData);
          setOpen(false);
        })
        .catch(error => {
          console.error(error);
          setSnackbarMessage(error);
          setSnackbarOpen(true);
        });
    } catch (error) {
      console.error(error);
      setSnackbarMessage(error);
      setSnackbarOpen(true);
    }
  }

  const resetMainDataState = () => {
    setMainData({});
  }

  const handleClose = () => {
    setOpen(false);
    resetMainDataState();
  };

  const handleStatusChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      shutdown: selectedValue,
    }));
    setSelectedStatus(selectedValue);
  };

  const statusMain = [
    { id: 1, name: 'Activate', value: '1' },
    { id: 2, name: 'Deactivate', value: '0' },
  ]


  // console.log(mainData);

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose} fullWidth>
        <DialogTitle>Maintenance View</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              // gridTemplateColumns: '1fr 1fr',
              gap: '16px', // Adjust the gap between columns
            }}
          >
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="issuer_label">Maintenance Status</InputLabel>
              <Select
                labelId="issuer_label"
                label="Maintenance Status"
                value={selectedStatus}
                onChange={handleStatusChange}
                name='issuer'
              >
                {
                  statusMain.map(item => (
                    <MenuItem key={item.id} value={item.value}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
           
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={handleSave}>Save</Button>
            </Stack>
          </Box>
        </DialogContent>
      </Dialog>
    )
  }


  return (
    <>
      <Container maxWidth="xl">
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (
          <Typography>
            My Home
          </Typography>
        )}

        <Snackbar
          anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
          open={snackbarOpen}
          autoHideDuration={3000}
          onClose={() => setSnackbarOpen(false)}
          message={snackbarMessage.toString()}
        />
        {renderDialog()}
      </Container>
    </>
  );
}
