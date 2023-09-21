import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, Button, TableContainer, Dialog, InputAdornment, DialogTitle, DialogContent, Box, TextField, Stack, Snackbar, Typography, Paper, Grid, IconButton, Table, TableHead, TableRow, TableCell, TableBody, CircularProgress, FormControl, InputLabel, Select, MenuItem } from '@mui/material';
import { useNavigate } from 'react-router-dom';

import { Edit, Delete, Check, Image } from '@mui/icons-material'
import { fetchData, updateData, addData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function About() {
  const [about, setAbout] = useState([]);
  const [personal, setPersonal] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({tag:[]});
  const [open, setOpen] = useState(false);
  const [editOpen, setEditOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [mediaList, setMediaList] = useState([]);
  const [tagList, setTagList] = useState([]);
  const [socialMedia, setSocialMedia] = useState([]);
  const [selectedFile, setSelectedFile] = useState(null);
  const [selectedTags, setSelectedTags] = useState([]);
  const [selectedSocial, setSelectedSocial] = useState([]);
  const navigate = useNavigate();


  useEffect(() => {
    fetchData()
      .then(responseData => {
        setAbout(responseData.saklayen.aboutme);
        setPersonal(responseData.saklayen.personalinfo[0]);
        setMediaList(responseData.saklayen.media);
        setTagList(responseData.saklayen.my_tags);
        setSocialMedia(responseData.saklayen.social_links);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, [dataChanged]);

  const paperStyle = {
    padding: '20px',
    position: 'relative',
  };

  // eslint-disable-next-line
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

  const handleDelete = (id) => {
    const requestData = {
      table: TABLE_NAME_ABOUT,
      id,
      action: 'delete',
    };

    deleteData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const deletedData = about.filter(item => item.id !== id);
        setAbout(deletedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleClose = () => {
    setOpen(false)
    setEditOpen(false);
    resetMainDataState();
  };

  const handleAdd = () => {
    const requestData = {
      table: TABLE_NAME_ABOUT,
      data: mainData
    };
    addData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const addData = [...about, mainData];
        setAbout(addData);
        setOpen(false);
        setIsAdding(false);
        setMainData({});
        setDataChanged(!dataChanged);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleSave = (TABLE_NAME) => {

    const existingData = about.find(item => item.id === mainData.id);
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
        const updatedData = about.map(item => {
          if (item.id === mainData.id) {
            return { ...item, ...mainData };
          }
          return item;
        });

        setAbout(updatedData);
        setPersonal(updatedData[0]);
        setOpen(false);
        setEditOpen(false);
        // setTimeout(() => {
        //   window.location.reload();
        // }, 2000);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleFileChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      photo: selectedValue,
    }));
    setSelectedFile(selectedValue);
  };
  const handleTagChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      tag: JSON.stringify(selectedValue),
    }));
    setSelectedTags(selectedValue);
  };
  const handleSocialChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      linkedin_profile: JSON.stringify(selectedValue),
    }));
    setSelectedSocial(selectedValue);
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevEdu) => ({
      ...prevEdu,
      [name]: value
    }));
  };

  const navigatePage = (url) => {
    navigate(url, { replace: true });
  }


  // eslint-disable-next-line
  const renderEditDialog = () => {
    return (
      <Dialog open={editOpen} onClose={handleClose}>
        <DialogTitle>Personal Info</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr', // Create a two-column layout
              gap: '1.5rem', // Adjust the gap between columns
            }}
          >
            <TextField
              label="Name"
              name='name'
              value={mainData.name}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
             <TextField
              label="Father Name"
              name='father_name'
              value={mainData.father_name}
              onChange={handleChange}
            />
             <TextField
              label="Mother Name"
              name='mother_name'
              value={mainData.mother_name}
              onChange={handleChange}
            />
             <TextField
              label="Career Objective"
              name='car_obj'
              multiline
              rows={8}
              value={mainData.car_obj}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Birthday"
              name='birthday'
              value={mainData.birthday}
              onChange={handleChange}
            />
            <TextField
              label="Gender"
              name='gender'
              value={mainData.gender}
              onChange={handleChange}
            />
             <TextField
              label="Marital Status"
              name='marital'
              value={mainData.marital}
              onChange={handleChange}
            />
            <TextField
              label="Nationality"
              name='nationality'
              value={mainData.nationality}
              onChange={handleChange}
            />
            <TextField
              label="Religion"
              name='religion'
              value={mainData.religion}
              onChange={handleChange}
            />
            <TextField
              label="Mobile"
              name='mobile'
              value={mainData.mobile}
              onChange={handleChange}
            />
            <TextField
              label="Email"
              name='email'
              value={mainData.email}
              onChange={handleChange}
            />
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="issuer_label">Profile Photo</InputLabel>
              <Select
                labelId="issuer_label"
                label="Profile Photo"
                value={selectedFile}
                onChange={handleFileChange}
                name='photo'
              >
                {
                  mediaList.map(item => (
                    <MenuItem key={item.id} value={item.file_name}>{item.file_text}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <FormControl sx={{minWidth: 120, gridColumn: 'span 2' }}>
              <InputLabel id="tag_id">My Tags</InputLabel>
              <Select
                labelId='tag_id'
                label="My Tags"
                multiple
                name='tag'
                value={selectedTags}
                onChange={handleTagChange}
                renderValue={(selected) => selected.join(', ')}
              >
                
                {
                  tagList.map(item => (
                    <MenuItem key={item.id} value={item.tag_name}>{item.tag_name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <FormControl sx={{minWidth: 120, gridColumn: 'span 2' }}>
              <InputLabel id="social_id">Social Media Link</InputLabel>
              <Select
                labelId="social_id"
                label="Social Media Link"
                multiple
                name='social_links'
                value={selectedSocial}
                onChange={handleSocialChange}
                renderValue={(selected) => selected.join(', ')}
              >
                
                {
                  socialMedia.map(item => (
                    <MenuItem key={item.id} value={item.link}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <TextField
              label="Present Address"
              name='present_address'
              multiline
              rows={3}
              value={mainData.present_address}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />

            <TextField
              label="Permanent Address"
              name='permanent_address'
              multiline
              rows={6}
              value={mainData.permanent_address}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />


            <Stack sx={{ gridColumn: 'span 2' }} spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
            <Button variant="outlined" onClick={() =>navigatePage('/media-list')}><Image/></Button>

              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={() => handleSave('personalinfo')}><Check /></Button>
            </Stack>
          </Box>
        </DialogContent>
      </Dialog>
    );
  };


  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add About Info' : mainData.title}</DialogTitle>
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
              {isAdding ? null : <Button style={{ backgroundColor: 'maroon', color: 'white' }} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete /></Button>}
            </Stack>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={isAdding ? handleAdd : () => handleSave('aboutme')}>{isAdding ? 'Add' : <Check />}</Button>
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
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Name
            </Typography>
            <Typography style={textStyles}>{personal.name}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Mobile
            </Typography>
            <Typography style={textStyles}>{personal.mobile}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Email
            </Typography>
            <Typography style={textStyles}>{personal.email}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Birthday
            </Typography>
            <Typography style={textStyles}>{personal.birthday}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Religion
            </Typography>
            <Typography style={textStyles}>{personal.religion}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={6} lg={4} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Nationality
            </Typography>
            <Typography style={textStyles}>{personal.nationality}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Address
            </Typography>
            <Typography style={textStyles}>{personal.permanent_address}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Tags
            </Typography>
            <Typography style={textStyles}>{personal.tag}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            {/* <Button size="small" style={buttonStyle}>
              <Edit />
            </Button> */}
            <Typography variant="h6" gutterBottom style={textStyles}>
              Social Links
            </Typography>
            <Typography style={textStyles}>{personal.linkedin_profile}</Typography>
          </Paper>
        </Grid>
      <Grid item xs={12} md={12} lg={12} sm={12}>
          <Paper elevation={3} style={paperStyle}>
            <Typography variant="h6" gutterBottom style={textStyles}>
              Career Objective
            </Typography>
            <Typography style={textStyles}>{personal.car_obj}</Typography>
          </Paper>
        </Grid>
      </Grid>

      <Stack
          spacing={2}
          direction="row"
          justifyContent="center"
          flexWrap="wrap"
          sx={{ margin: '1rem 0 2rem 0' }}
        >
          <Button
            variant="contained"
            style={{
              marginTop: '1rem'
            }}
            onClick={() => {
              resetMainDataState();
              setIsAdding(true);
              setOpen(true);
            }}
          >
            Add About Info
          </Button>
          <Button
            style={{
              marginTop: '1rem'
            }}
            variant="outlined"
            onClick={() => {navigatePage('/profile-role')}}>
            Profile Role
          </Button>
         <Button
           style={{
            marginTop: '1rem'
          }}
            variant="contained"
            onClick={() => {navigatePage('/references')}}>
            References
          </Button>
        <Button
          style={{
            marginTop: '1rem'
          }}
            variant="outlined"
            onClick={() => {
              setEditOpen(true);
              resetMainDataState();
              setMainData(personal);
              setSelectedFile(personal.photo);
              setSelectedTags(JSON.parse(personal.tag));
              setSelectedSocial(JSON.parse(personal.linkedin_profile));
            }}>
            Edit Personal Info
          </Button>
        </Stack>


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
      {renderEditDialog()}
    </Container>
  );
}

export default About;
