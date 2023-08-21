import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, TableContainer, Box, Paper, Grid, Table, Dialog, DialogTitle, DialogContent, TableHead, Button, TableRow, TableCell, TableBody, CircularProgress, Typography } from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';

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

  // eslint-disable-next-line
  const renderDialog = () => {
    return (
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>View for {mainData.ip}</DialogTitle>
        <DialogContent>
          <Box
            component="form"
            sx={{
              marginTop: '16px',
              display: 'grid',
              gridTemplateColumns: '1fr 1fr',
              gap: '16px',
            }}
          >
            <Typography><strong>IP Address:</strong> {mainData.ip}</Typography>
            <Typography><strong>Time Zone:</strong> {mainData.timezone}</Typography>
            <Typography><strong>Country:</strong> {mainData.country}</Typography>
            <Typography><strong>Visit Date:</strong> {mainData.visit_date}</Typography>
            <Typography sx={{ gridColumn: 'span 2' }}><strong>ISP:</strong> {mainData.isp}</Typography>
            <Typography sx={{ gridColumn: 'span 2' }}><strong>User Agent:</strong> {mainData.agent}</Typography>

          </Box>
        </DialogContent>
      </Dialog>
    );
  };


  const handleClose = () => {
    setOpen(false);
    setMainData({});
  }

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
          onClick={() => handleDialogView(param.row)}
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
