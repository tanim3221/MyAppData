import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Typography, Paper, Grid, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, Divider } from '@mui/material';
import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

function About() {
  const [about, setAbout] = useState([]);
  const [personal, setPersonal] = useState([]);
  const [loading, setLoading] = useState(true);

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

export default About;
