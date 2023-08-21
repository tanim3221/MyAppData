import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, TableContainer, Stack, Box, Paper, Grid, Table, Dialog, DialogTitle, DialogContent, TableHead, Button, TableRow, TableCell, Divider, TableBody, CircularProgress, Typography } from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';

import JSONTree from 'react-json-view';

// import { Edit } from '@mui/icons-material'
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';


function Visitors() {
  const [visitor, setVisit] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mainData, setMainData] = useState([]);
  const [open, setOpen] = useState(false);

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

  const handleDialogView = (visitData) => {
    setOpen(true);
    setMainData(visitData);
  }

  const handleClose = () => {
    setOpen(false);
    setMainData({});
  }

  // eslint-disable-next-line
  const renderDialog = () => {
    if (Object.keys(mainData).length === 0) {
      return null;
    }
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>View for {mainData.ip}</DialogTitle>
        <DialogContent>
          <Box
            component={Grid}
            sx={{
              display: 'column',
            }}
          >
            <Divider sx={{ gridColumn: 'span 2', margin: '.5rem .5rem' }} />

            <Typography><strong>IP Address:</strong> {mainData.ip}</Typography>
            <Typography><strong>Time Zone:</strong> {mainData.timezone}</Typography>
            <Typography><strong>Country:</strong> {mainData.country}</Typography>
            <Typography><strong>Visit Date:</strong> {mainData.visit_date}</Typography>
            <Divider sx={{ gridColumn: 'span 2', margin: '.5rem .5rem' }} />

            <Typography sx={{ gridColumn: 'span 2' }}><strong>ISP:</strong> {mainData.isp}</Typography>
            <Divider sx={{ gridColumn: 'span 2', margin: '.5rem .5rem' }} />

            <Typography sx={{ gridColumn: 'span 2' }}><strong>User Agent:</strong> {mainData.agent}</Typography>
            <Divider sx={{ gridColumn: 'span 2', margin: '.5rem .5rem' }} />
            <Typography sx={{ whiteSpace: 'pre-wrap' }}>
              <JSONTree
                src={JSON.parse(mainData.combined_array)}
                shouldExpandNode={() => true}
              />
            </Typography>
          </Box>
          <Stack
            spacing={2}
            direction="row"
            justifyContent="flex-end"
            sx={{ marginTop: '16px', position: 'absolute', bottom: '2rem', right: '2rem' }}
          >
            <Button variant="contained" onClick={handleClose}>Close</Button>
          </Stack>
        </DialogContent>
      </Dialog>
    );
  };

  const columns = [
    {
      field: 'ip',
      headerName: 'IP Address',
      width: 150,
      editable: false,
    },
    {
      field: 'isp',
      headerName: 'ISP',
      width: 250,
      editable: false,
    },
    {
      field: 'visit_time',
      headerName: 'Time & Date',
      width: 150,
      editable: false,
    }, {
      field: 'country',
      headerName: 'Country',
      width: 150,
      editable: false,
    },
    {
      field: 'actions',
      headerName: 'Actions',
      width: 120,
      renderCell: (param) => (
        <Button variant="contained" color="primary" size="small"
          onClick={() => {
            handleDialogView(param.row);
          }

          }
        >
          View
        </Button>
      ),
    },
  ];

  return (
    <Container maxWidth="lg" className={extStyles.container}>
      <Paper component={Paper}>
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (
          <>
            <div>
              <DataGrid
                rows={visitor}
                columns={columns}
                initialState={{
                  pagination: {
                    paginationModel: {
                      pageSize: 10,
                    },
                  },
                }}
                pageSizeOptions={[10, 20, 50, 100, 500, 1000]}
                checkboxSelection
                disableRowSelectionOnClick
              />

            </div>
            {renderDialog()}
          </>

          // <Table>
          //   <TableHead>
          //     <TableRow>
          //       <TableCell>SL</TableCell>
          //       <TableCell>IP</TableCell>
          //       <TableCell>ISP</TableCell>
          //       <TableCell>Date</TableCell>
          //       <TableCell>Country</TableCell>
          //       {/* <TableCell>Action</TableCell> */}
          //     </TableRow>
          //   </TableHead>
          //   <TableBody>
          //     {visitor.map((item, index) => (
          //       <TableRow key={item.id}>
          //         <TableCell>{index+1}</TableCell>
          //         <TableCell>{item.ip}</TableCell>
          //         <TableCell>{item.isp}</TableCell>
          //         <TableCell>{item.visit_date}</TableCell>
          //         <TableCell>{item.country}</TableCell>
          //         {/* <TableCell><Button><Edit /></Button></TableCell> */}
          //       </TableRow>
          //     ))}
          //   </TableBody>
          // </Table>
        )}
      </Paper>
    </Container>
  );
}

export default Visitors;
