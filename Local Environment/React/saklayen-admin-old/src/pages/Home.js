// import { useTheme } from '@mui/material/styles';
import React, { useState, useEffect } from 'react';
import { Container, Grid, Stack, Box, Snackbar, IconButton, Typography, FormControl, InputLabel, Select, MenuItem, TextField, Dialog, Button, DialogContent, DialogTitle, Card, CircularProgress, CardHeader } from '@mui/material';
import { Edit, Delete, Check, Close } from '@mui/icons-material'

import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { useNavigate } from 'react-router-dom';

// eslint-disable-next-line
import { DatePicker, DateTimePicker } from '@mui/x-date-pickers';
import dayjs from 'dayjs';

import { fetchData, updateData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

import { fToNow } from '../utils/formatTime';

import {
  AppWidgetSummary,
} from '../sections/home';

export default function Home() {

  // const theme = useTheme();
  const [personal, setPersonal] = useState([{}]);
  const [visitor, setVisit] = useState([]);
  const [message, setMsg] = useState([]);
  const [portfolio, setPort] = useState([]);
  const [mainData, setMainData] = useState({});
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(false);
  const [selectedStatus, setSelectedStatus] = useState('0');
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  // const [dataChanged, setDataChanged] = useState(false);
  const navigate = useNavigate();


  const subjectStyle = {
    fontWeight: 'bold',
    fontSize: '1rem',
  }
  const msgStyle = {
    fontSize: '.9rem',
    marginTop: '.5rem',
    textTransform: 'justify',
  }
  const dateStyle = {
    color: 'gray',
    fontSize: '.7rem',
    marginTop: '1rem',
  }

  const stackStyle = {
    marginBottom: '1rem',
    paddingLeft: '1.5rem',
    paddingRight: '1.5rem',
    paddingBottom: '1rem',
    borderBottom: '1px solid #eee',
  }

  const HeaderStyle = {
    marginBottom: '1.5rem',
    padding: '1.5rem',
    backgroundColor: '#eee',
  }

  const gridCardStyle = {
    cursor: 'pointer'
  };

  const TABLE_NAME = 'personalinfo';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setVisit(responseData.saklayen.visitors);
        setMsg(responseData.saklayen.contact_messages);
        setPort(responseData.saklayen.portfolio);
        setPersonal(responseData.saklayen[TABLE_NAME][0]);
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

  const handleDateSelect = (newDate) => {
    setMainData((prevData) => ({
      ...prevData,
      expiry_date: dayjs(newDate).format('YYYY-MM-DD HH:mm:ss'),
    }));
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

  const showContactPage = () => {
    navigate('/messages');
  }

  const showPortfolioPage = () => {
    navigate('/portfolios');
  }

  const showVisitorPage = () => {
    navigate('/visitors');
  }

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
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DateTimePicker
                label="Expiration Date"
                name='date'
                value={dayjs(mainData.expiry_date)}
                // renderInput={(params) => <TextField {...params} />}
                textField={(props) => <TextField {...props} />}
                onChange={handleDateSelect}
              />
            </LocalizationProvider>
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
          <Grid container spacing={3}>

            <Grid item xs={12} sm={6} md={3}>
              <AppWidgetSummary style={gridCardStyle} onClick={showContactPage} title="Contact Messages" total={message.length} icon={'ant-design:message'} />
            </Grid>

            <Grid item xs={12} sm={6} md={3}>
              <AppWidgetSummary style={gridCardStyle} onClick={showVisitorPage} title="Website Visitors" total={visitor.length} color="info" icon={'ant-design:global-outlined'} />
            </Grid>

            <Grid item xs={12} sm={6} md={3}>
              <AppWidgetSummary style={gridCardStyle} onClick={showPortfolioPage} title="Portfolio" total={portfolio.length} color="info" icon={'ant-design:rise-outlined'} />
            </Grid>

            <Grid item xs={12} sm={6} md={3}>
              <AppWidgetSummary
                title="Maintenance"
                style={gridCardStyle}
                onClick={() => {
                  setOpen(true);
                  setMainData(personal)
                  setSelectedStatus(personal.shutdown);
                }}
                total={((personal.shutdown === '1') ? "Activated" : "Deactivated").toString()}
                color="info"
                icon={'ant-design:check-circle-outlined'}
              />
            </Grid>

            {
              message && message.length > 0 && (
                <Grid item xs={12} md={12} lg={12}>
                  <Card>
                    <CardHeader title="Contact Messages" style={HeaderStyle} />
                    {message.map((item) => (
                      <Stack direction="row" alignItems="center" spacing={2} style={stackStyle} key={item.id}>
                        <Grid item md={12} lg={12}>
                          <Grid item md={12} lg={12}>
                            <Box sx={{ minWidth: 240, flexGrow: 1 }}>
                              <Typography style={subjectStyle}>
                                {item.subject}
                              </Typography>
                              <Typography style={msgStyle}>
                                {item.message}
                              </Typography>
                            </Box>
                          </Grid>

                          <Grid item md={12} lg={12}>
                            <Typography style={dateStyle}>
                              {fToNow(item.date_added)}
                            </Typography>
                          </Grid>
                        </Grid>
                      </Stack>
                    ))}
                  </Card>
                </Grid>
              )
            }

          </Grid>
        )}

        <Snackbar
          anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
          open={snackbarOpen}
          autoHideDuration={3000}
          onClose={() => setSnackbarOpen(false)}
          message={snackbarMessage.toString()}
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
    </>
  );
}
