import React, { useState, useEffect } from 'react';
import { Container, Button, Dialog, DialogTitle, Link, Snackbar, Box, DialogContent, TextField, TableContainer, Paper, Table, TableHead, TableRow, Select, FormControl, MenuItem, InputLabel,  TableCell, TableBody, CircularProgress, Stack } from '@mui/material';
import { Edit, Delete, Check, Image} from '@mui/icons-material'
import { useNavigate } from 'react-router-dom';


import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers';
import dayjs from 'dayjs';
// import moment from 'moment';

import { fetchData, updateData, addData, deleteData } from '../auth/api';
import extStyles from '../utils/styles.module.css';

function Certificate() {
  const [data, setData] = useState([]);
  const [issuerList, setIssuerList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  // const [imageOpen, setImageOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('');
  const [viewInCv, setAddCvValue] = useState('');
  const [selectedFile, setSelectedFile] = useState(null);
  const [mediaList, setMediaList] = useState([]);
  const [skillList, setSkillList] = useState([]);
  const [selectedSkills, setSelectedSkills] = useState([]);

  const navigate = useNavigate();


  const TABLE_NAME = 'certifications';

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setIssuerList(responseData.saklayen.issuer_list);
        setMediaList(responseData.saklayen.media);
        setSkillList(responseData.saklayen.skills);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
  }, [dataChanged]);

  const resetMainDataState = () => {
    setMainData({});
  }

  const handleAdd = () => {
    const requestData = {
      table: TABLE_NAME,
      data: mainData
    };

    addData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const addData = [...data, mainData];
        setData(addData);
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

  const handleSkillsChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      skills: JSON.stringify(selectedValue),
    }));
    setSelectedSkills(selectedValue);
  };
  const handleDelete = (id) => {
    const requestData = {
      table: TABLE_NAME,
      id,
      action: 'delete',
    };

    deleteData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        const deletedData = data.filter(item => item.id !== id);
        setData(deletedData);
        setOpen(false);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const handleSave = () => {

    try {
      const existingData = data.find(item => item.id === mainData.id);
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
          const updatedData = data.map(item => {
            if (item.id === mainData.id) {
              return { ...item, ...mainData };
            }
            return item;
          });

          setData(updatedData);
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

  const handleClose = () => {
    setOpen(false)
    // setImageOpen(false);
    // resetMainDataState();
  };

  const handleCategoryChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      issuer: selectedValue,
    }));
    setSelectedCategory(selectedValue);
  };
  const handleViewInCV = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      for_cv: selectedValue,
    }));
    setAddCvValue(selectedValue);
  };

  const handleFileChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      icon: selectedValue,
    }));
    setSelectedFile(selectedValue);
  };

  // const handleFileChange = (event) => {
  //   const file = event.target.files[0];
  //   setSelectedFile(file);
  // };

  // const handleFileUpload = () => {
  //   if (selectedFile) {
  //     console.log('Uploading:', selectedFile);
  //   }
  // };


  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  };

  const handleDateSelect = (newDate) => {
    setMainData((prevData) => ({
      ...prevData,
      date: dayjs(newDate).format('YYYY-MM-DD'),
    }));
  };

  const navigatePage = (url) => {
    navigate(url, { replace: true });
  }

  const cvOption = [
    {
        id: '1',
        value: '1',
        name: 'Add In CV'
    },
    {
        id: '2',
        value: '0',
        name: 'Not Neccessary'
    }
];


  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Certificates' : mainData.title}</DialogTitle>
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
           <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="issuer_label">Issued By</InputLabel>
              <Select
                labelId="issuer_label"
                label="Issued By"
                value={selectedCategory}
                onChange={handleCategoryChange}
                name='issuer'
              >
                {
                  issuerList.map(item => (
                    <MenuItem key={item.id} value={item.name}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="for_cv">View In CV</InputLabel>
              <Select
                labelId="for_cv"
                label="View In CV"
                value={viewInCv}
                onChange={handleViewInCV}
                name='for_cv'
              >
                {
                  cvOption.map(item => (
                    <MenuItem key={item.id} value={item.value}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <TextField
              label="Course Category"
              name='course_category'
              value={mainData.course_category}
              onChange={handleChange}
            />
            
            <TextField
              label="Certificate Title"
              name='title'
              value={mainData.title}
              multiline
              rows={3}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Certificate Link"
              name='link'
              value={mainData.link}
              type='url'
              multiline
              rows={3}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <FormControl sx={{minWidth: 120, gridColumn: 'span 2' }}>
              <InputLabel id="tag_id">Skills</InputLabel>
              <Select
                labelId='tag_id'
                label="Skills"
                multiple
                name='skills'
                value={selectedSkills}
                onChange={handleSkillsChange}
                renderValue={(selected) => selected.join(', ')}
              >
                
                {
                  skillList.map(item => (
                    <MenuItem key={item.id} value={item.skill}>{item.skill}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DatePicker
                label="Date Issued"
                name='date'
                value={dayjs(mainData.date)}
                renderInput={(params) => <TextField {...params} />}
                // sx={{ gridColumn: 'span 2' }}
                onChange={handleDateSelect}
              />
            </LocalizationProvider>
            
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="issuer_label">Issuer Logo</InputLabel>
              <Select
                labelId="issuer_label"
                label="Issuer Logo"
                value={selectedFile}
                onChange={handleFileChange}
                name='icon'
              >
                {
                  mediaList.map(item => (
                    <MenuItem key={item.id} value={item.file_name}>{item.file_text}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>

            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-start">
              {isAdding ? null : <Button style={{ backgroundColor: 'maroon', color: 'white' }} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete /></Button>}
            </Stack>
            <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={() =>navigatePage('/media-list')}><Image/></Button>
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={isAdding ? handleAdd : handleSave}>{isAdding ? 'Add' : <Check />}</Button>
            </Stack>

          </Box>

        </DialogContent>

      </Dialog>
    );
  };


  // const imageDialog = () => {
  //   return (
  //     <Dialog open={imageOpen} onClose={handleClose}>
  //       <DialogTitle>{mainData.issuer}</DialogTitle>
  //       <DialogContent>
  //         <Box
  //           component="form"
  //           sx={{
  //             marginTop: '1rem',
  //             display: 'grid',
  //             // gridTemplateColumns: '1fr 1fr', // Create a two-column layout
  //             gap: '1rem', // Adjust the gap between columns
  //           }}
  //         >
  //           <Input
  //             type='file'
  //             onChange={handleFileChange}
  //           />

  //           <Stack spacing={2} direction="row" style={{ marginTop: '1rem' }} justifyContent="flex-end">
  //             <Button variant="outlined" onClick={handleClose}>Close</Button>
  //             <Button variant="contained" onClick={handleFileUpload}><Check /></Button>
  //           </Stack>
  //         </Box>

  //       </DialogContent>
  //     </Dialog>
  //   );
  // }

  return (
    <Container maxWidth="lg" style={{ marginTop: '.3rem' }}>
      <Button
        variant="contained"
        onClick={() => {
          resetMainDataState();
          setIsAdding(true);
          setOpen(true);
        }}
        style={{ marginBottom: '1.3rem' }}
      >
        Add New
      </Button>
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
                <TableCell>Issuer</TableCell>
                <TableCell>Date</TableCell>
                <TableCell>Link</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map(item => (
                <TableRow key={item.id}>
                  <TableCell>{item.rank}</TableCell>
                  <TableCell>{item.title}</TableCell>
                  <TableCell>{item.issuer}</TableCell>
                  <TableCell>{item.date}</TableCell>
                  <TableCell><Link href={item.link} target="_blank" underline="none">Certificate</Link></TableCell>
                  <TableCell>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <Button
                        variant="outlined"
                        onClick={() => {
                          setMainData(item);
                          setOpen(true);
                          setSelectedCategory(item.issuer);
                          setAddCvValue(item.for_cv);
                          setSelectedFile(item.icon);
                          setIsAdding(false)
                        }}
                      >
                        <Edit />
                      </Button>

                      {/* <Button
                        variant="outlined"
                        onClick={() => {
                          setMainData(item);
                          setImageOpen(true);
                        }}
                      >
                        <Image />
                      </Button> */}
                    </div>

                  </TableCell>
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
      {/* {imageDialog()} */}
    </Container>
  );
}

export default Certificate;
