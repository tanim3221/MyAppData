import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Dialog, DialogTitle, DialogContent, Box, TextField, Stack, Snackbar, Typography, Paper, Grid, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Divider } from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData, updateData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function About() {
  const [about, setAbout] = useState([]);
  const [personal, setPersonal] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setAbout(responseData.saklayen.aboutme);
        setPersonal(responseData.saklayen.personalinfo[0]);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, []);

  const paperStyle = {
    padding: '20px',
    position: 'relative',
  };

  const buttonStyle = {
    position: 'absolute',
    top: '5px',
    right: '5px',
  };

  const textStyles = {
    textAlign: 'left',
    whiteSpace: 'normal',
  };

  const TABLE_NAME_ABOUT = 'aboutme';

  const resetMainDataState = () => {
    setMainData({});
  }

  const handleClose = () => {
    setOpen(false)
    resetMainDataState();
  };

  const handleSave = () => {

    const existingData = about.find(item => item.id === mainData.id);
    const isDataChanged = JSON.stringify(mainData) !== JSON.stringify(existingData);

    if (!isDataChanged) {
      setSnackbarMessage("No changes to save.");
      setSnackbarOpen(true);
      setOpen(false);
      return;
    }
    const requestData = {
      table: TABLE_NAME_ABOUT,
      data: mainData
    };

    updateData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const updatedData = about.map(item => {
          if (item.id === mainData.id) {
            return { ...item, ...mainData };
          }
          return item;
        });

        setAbout(updatedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevEdu) => ({
      ...prevEdu,
      [name]: value
    }));
  };

  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{mainData.title}</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr', // Create a two-column layout
              gap: '16px', // Adjust the gap between columns
            }}
          >
            <TextField
              label="Rank"
              name='rank'
              value={mainData.rank}
              onChange={handleChange}
            />
            <TextField
              label="Title"
              name='title'
              value={mainData.title}
              onChange={handleChange}
            />
            <TextField
              label="Description"
              name='description'
              value={mainData.description}
              sx={{ gridColumn: 'span 2' }}
              multiline
              rows={10}
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
    <Container maxWidth="lg" className={extStyles.container}>

      <Grid container spacing={2}>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={1} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Name
            </Typography>
            <Typography style={textStyles}>{personal.name}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Mobile
            </Typography>
            <Typography style={textStyles}>{personal.mobile}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Email
            </Typography>
            <Typography style={textStyles}>{personal.email}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Birthday
            </Typography>
            <Typography style={textStyles}>{personal.birthday}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Religion
            </Typography>
            <Typography style={textStyles}>{personal.religion}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Nationality
            </Typography>
            <Typography style={textStyles}>{personal.nationality}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Address
            </Typography>
            <Typography style={textStyles}>{personal.permanent_address}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Tags
            </Typography>
            <Typography style={textStyles}>{personal.tag}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Button size="small" style={buttonStyle}>
              <Edit />
            </Button>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Social Links
            </Typography>
            <Typography style={textStyles}>{personal.linkedin_profile}</Typography>
          </Paper>
        </Grid>
      </Grid>

      <Divider style={{ margin: '2rem' }} />

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
              {about.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.description}</TableCell>
                  <TableCell><Button onClick={() => {
                    setMainData(item);
                    setOpen(true);
                  }}><Edit /></Button></TableCell>
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

export default About;
