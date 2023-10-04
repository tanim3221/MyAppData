import React, { useState, useEffect } from 'react';
import { Container, Button, TableContainer, Paper, IconButton, FormControl, InputLabel, Select, MenuItem, Table, TableHead, TableRow, TableCell, TableBody, Dialog, DialogContent, TextField, CircularProgress, Snackbar, DialogTitle, Box, Stack, useMediaQuery} from '@mui/material';
import { Edit, Delete, Check, Close } from '@mui/icons-material'
import { CKEditor } from '@ckeditor/ckeditor5-react';
import  ClassicEditor  from '@ckeditor/ckeditor5-build-classic';
import { fetchData, addData, deleteData, updateData } from '../auth/api';
import extStyles from '../utils/styles.module.css';



function JobResponsibility() {
  const [data, setData] = useState([]);
  const [auditType, setAuditType] = useState([]);
  const [clientType, setClientType] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState({});
  const [open, setOpen] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");
  const [selectedVisible, setSelectedVisibility] = useState('');
  const [isAdding, setIsAdding] = useState(false);
  const [dataChanged, setDataChanged] = useState(false);
  const [selectedType, setSelectedType] = useState([]);
  const [selectedClientType, setSelectedClientType] = useState([]);


  const isMobile = useMediaQuery(theme => theme.breakpoints.only('xs'));
  const isSm = useMediaQuery(theme => theme.breakpoints.only('sm'));
  const isMd = useMediaQuery(theme => theme.breakpoints.only('md'));
  const isLg = useMediaQuery(theme => theme.breakpoints.only('lg'));
  const isXl = useMediaQuery(theme => theme.breakpoints.up('xl'));
 
  let dialogMinWidth;
  
  if (isMobile) {
    dialogMinWidth = '95%';
  } else if (isSm) {
    dialogMinWidth = '90%';
  }  else if (isMd) {
    dialogMinWidth = '80%';
  } else if (isLg) {
    dialogMinWidth = '50rem';
  } else if (isXl) {
    dialogMinWidth = '60rem';
  } else {
    dialogMinWidth = '70rem';
  }
  const TABLE_NAME = "job_res";
  const TABLE_NAME_TYPE = "audit_type";
  const TABLE_NAME_CLIENT_TYPE = "client_types";


  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen[TABLE_NAME]);
        setAuditType(responseData.saklayen[TABLE_NAME_TYPE]);
        setClientType(responseData.saklayen[TABLE_NAME_CLIENT_TYPE]);
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

  const handleVisibilityChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      visibility: selectedValue,
    }));
    setSelectedVisibility(selectedValue);
  };

  const handleTypeChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      audit_type: selectedValue,
    }));
    setSelectedType(selectedValue);
  };

  const handleClientTypeChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      client_type: selectedValue,
    }));
    setSelectedClientType(selectedValue);
  };

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
  }

  const handleClose = () => {
    setOpen(false)
    resetMainDataState();
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevData) => ({
      ...prevData,
      [name]: value
    }));
  }

  const handleEditorChange = (event, editor) => {
    const data = editor.getData();
    setMainData(prevState => ({ ...prevState, res_details: data }));
};
const editorConfig = {
  toolbar: [
    'undo', 'redo', '|',
    'heading', '|', 
    'bold', 'italic','|',
    'bulletedList', 'numberedList', 'blockQuote', '|',
  ],
};

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog PaperProps={{
        sx: {
          minWidth: dialogMinWidth,
        },
      }} open={open} onClose={handleClose}>
        <DialogTitle>{isAdding ? 'Add New Job Responsibility' : mainData.client_name}</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '1rem',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr',
              gap: '1rem'
            }}
          >
            <TextField
              label="Rank"
              name="rank"
              value={mainData.rank}
              onChange={handleChange}
              sx={{ gridColumn: isMobile ? 'span 2' : '' }}
            />
            <FormControl  sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
              <InputLabel id="Visibility">Visibility</InputLabel>
              <Select
                labelId="Visibility"
                label="Visibility"
                value={selectedVisible}
                onChange={handleVisibilityChange}
                name='visibility'
              >
                <MenuItem key={1} value={1}>Show</MenuItem>
                <MenuItem key={2} value={0}>Hide</MenuItem>
              </Select>
            </FormControl>
            <TextField
              label="Client Name"
              name="client_name"
              value={mainData.client_name}
              onChange={handleChange}
              sx={{ gridColumn: isMobile ? 'span 2' : '' }}
            />
            {/* <TextField
              label="Client Type"
              name="client_type"
              value={mainData.client_type}
              onChange={handleChange}
              sx={{ gridColumn: isMobile ? 'span 2' : '' }}
            /> */}

            <FormControl sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
              <InputLabel id="client_type">Client Type</InputLabel>
              <Select
                labelId='client_type'
                label="Client Type"
                name='client_type'
                value={selectedClientType}
                onChange={handleClientTypeChange}
              >
                {
                  clientType.map(item => (
                    <MenuItem key={item.id} value={item.name}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <FormControl sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
              <InputLabel id="audit_type">Audit Type</InputLabel>
              <Select
                labelId='audit_type'
                label="Audit Type"
                name='audit_type'
                value={selectedType}
                onChange={handleTypeChange}
              >
                {
                  auditType.map(item => (
                    <MenuItem key={item.id} value={item.name}>{item.name}</MenuItem>
                  ))
                }
              </Select>
            </FormControl>
            <TextField
              label="Task Role"
              name="task_role"
              value={mainData.task_role}
              onChange={handleChange}
              sx={{ gridColumn: isMobile ? 'span 2' : '' }}
            />
            {/* <TextField
              label="Job Details"
              name="res_details"
              multiline
              rows={15}
              value={mainData.res_details}
              onChange={handleChange}
              sx={{ gridColumn: 'span 2' }}
            /> */}

              <Box
                  sx={{
                      gridColumn: 'span 2',
                      width: '100%',
                      '& .ck-editor__editable': {
                          height: '400px', // or whatever height you desire
                      },
                  }}
              >
                  <CKEditor
                      editor={ClassicEditor}
                      data={mainData.res_details || ''}
                      onChange={handleEditorChange}
                      config={editorConfig}
                  />
              </Box>
    
                <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-start">
                  {isAdding ? null : <Button style={{ backgroundColor: 'maroon', color: 'white' }} variant="outlined" onClick={() => handleDelete(mainData.id)} ><Delete /></Button>}
                </Stack>
                <Stack spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
                  <Button variant="outlined" onClick={handleClose}>Close</Button>
                  <Button variant="contained" onClick={isAdding ? handleAdd : handleSave}>{isAdding ? 'Add' : <Check />}</Button>
                </Stack>

          </Box>
        </DialogContent>
      </Dialog>
    );
  };

  return (
    <Container maxWidth="lg" style={{ marginTop: '.3rem' }}>
      <Button
        variant="contained"
        onClick={() => {
          setOpen(true);
          setIsAdding(true);
          resetMainDataState();
        }}
        style={{ marginBottom: '1.3rem' }}>Add New</Button>
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
                <TableCell>Client Name</TableCell>
                <TableCell>Client Type</TableCell>
                <TableCell>Audit Type</TableCell>
                <TableCell>Job Role</TableCell>
                <TableCell>Action</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((item, index) => (
                <TableRow key={item.id}>
                  <TableCell>{index+1}</TableCell>
                  <TableCell>{item.client_name}</TableCell>
                  <TableCell>{item.client_type}</TableCell>
                  <TableCell>{item.audit_type}</TableCell>
                  <TableCell>{item.task_role}</TableCell>
                  <TableCell>
                    <Button
                      onClick={() => {
                        setMainData(item);
                        setOpen(true);
                        setSelectedVisibility(item.visibility);
                        setSelectedClientType(item.client_type);
                        setSelectedType(item.audit_type);
                        setIsAdding(false)
                      }}
                    >
                      <Edit />
                    </Button>
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
        onclose={() => setSnackbarOpen(false)}
        message={snackbarMessage}
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
  );
}

export default JobResponsibility;
