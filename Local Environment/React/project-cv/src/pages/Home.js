import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, Stack, Box, Snackbar, Card, CardContent, Typography, CardActionArea, List, ListItem, ListItemText, TextField, InputAdornment, Paper, Grid, FormControl, InputLabel, Input, Select, MenuItem, Dialog, Button, DialogContent, DialogTitle, CircularProgress, Divider } from '@mui/material';
import { Search } from '@mui/icons-material';

import { searchData } from '../auth/api';
import extStyles from '../utils/styles.module.css';


export default function Home() {

  // const theme = useTheme();
  const [loading, setLoading] = useState(true);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [valueClick, setValueClick] = useState(false);
  const [searchArray, setSearchArray] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [searchValue, setSearchValue] = useState('');
  const [searchResult, setSearchResult] = useState([]);
  const [searchSingle, setSearchSingle] = useState({});

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);

  const handleSearchChange = (event) => {
    const searchKey = event.target.value;
    setSearchValue(searchKey);
  };


  const handleSearch = () => {
    const requestData = {
      search: searchValue,
    };

    if (searchValue.trim() === '') {
      setSnackbarMessage("Please enter keywords to search.");
      setSnackbarOpen(true);
    } else {
      searchData(requestData)
        .then((response) => {
          const result = response.result;
          if (Array.isArray(result) && result.length > 0) {
            setSearchResult(result);
            setSearchArray(true);
          } else {
            setSearchResult([]);
            setSearchArray(false);
            setSnackbarMessage(response.message);
            setSnackbarOpen(true);
          }
        })
        .catch((error) => {
          console.error(error);
          setSnackbarMessage("An error occurred during the search.");
          setSnackbarOpen(true);
        });
    }
  };



  const LeftSide = () => (
    <div style={{
      height: 'calc(100vh)', // Adjust the height as needed
      overflowY: 'auto',
    }}>
      <Paper style={{
        padding: '1rem',
        borderRadius: '1rem'
      }}>
        {/* Fixed header for search */}
        <div style={{
          position: 'sticky',
          top: 0,
          background: 'white',
          zIndex: 1,
          padding: '1rem 0',
        }}>
          <Box display="flex" alignItems="center">
            <Input
              autoFocus
              fullWidth
              disableUnderline
              placeholder="Search…"
              sx={{
                fontWeight: 'fontWeightBold',
              }}
              name='search'
              value={searchValue}
              onChange={handleSearchChange}
            />
            <Button variant="contained" color="primary" onClick={handleSearch}>
              <Search />
            </Button>
          </Box>
        </div>
        {searchArray ? (
          <List>
            {searchResult.map((item) => (
              <ListItem key={item.id} sx={{
                padding: '.5rem 0rem'
              }}
                onClick={() => {
                  setSearchSingle(item)
                  setValueClick(true)
                }}
              >
                <Card sx={{
                  width: '100%',
                  padding: '0px'
                }}>
                  <CardActionArea sx={{
                    padding: '0px'
                  }}>
                    <CardContent sx={{
                      padding: '1rem'
                    }}>
                      <Typography variant="p" component="div">
                        {item.name} ({item.reg_no})
                      </Typography>
                    </CardContent>
                  </CardActionArea>
                </Card>
              </ListItem>
            ))}
          </List>
        ) : (
          <div className={extStyles.not_found}>
            No Search Result.
          </div>
        )}


      </Paper>
    </div>
  );

  const RightSide = () => (
    <div style={{
      height: 'calc(100vh - 64px)', // Adjust the height as needed
      overflowY: 'auto',
    }}>
      <Paper style={{
        padding: '0px',
        borderRadius: '1rem'
      }}>
        {valueClick ? (
          <Card key={searchSingle.id} style={{ marginBottom: '16px' }}>
            <CardContent>
              <Typography variant="h6" component="div">
                {searchSingle.name} ({searchSingle.reg_no})
              </Typography>
              <Typography variant="body2" color="textSecondary">
                <strong>Mobile:</strong> {searchSingle.mobile}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                <strong>Email:</strong> {searchSingle.email}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                <strong>Birthday:</strong> {searchSingle.birthday}
              </Typography>
            </CardContent>
          </Card>
        ) : (
          <div className={extStyles.not_selected} >No data selected.</div>
        )}
      </Paper>
    </div>
  );


  return (
      <Container maxWidth="xl">
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (
          <Grid container spacing={2}>
            <Grid item xs={5}>
              <LeftSide />
            </Grid>

            <Grid item xs={7}>
              <RightSide />
            </Grid>
          </Grid>
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
