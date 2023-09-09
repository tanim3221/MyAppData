import React, { useState, useEffect } from 'react';
// eslint-disable-next-line
import { Container, Stack, Box, Snackbar, Card, CardContent, Typography, CardActionArea, List, ListItem, ListItemText, TextField, InputAdornment, Paper, Grid, FormControl, InputLabel, Input, Select, MenuItem, Dialog, Button, DialogContent, DialogTitle, CircularProgress, Divider, useMediaQuery, DialogActions, IconButton } from '@mui/material';
import { Search, Clear, Refresh } from '@mui/icons-material';

import useResponsive from '../utils/UseResponsive';
import { searchData } from '../auth/api';
import extStyles from '../utils/styles.module.css';


export default function Home() {

  // const theme = useTheme();
  const [loading, setLoading] = useState(true);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [valueClick, setValueClick] = useState(false);
  const [searchArray, setSearchArray] = useState(false);
  const [detailsView, setDetailsView] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [searchValue, setSearchValue] = useState('');
  const [searchResult, setSearchResult] = useState([]);
  const [searchSingle, setSearchSingle] = useState({});
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const dialogMinWidth = isSmallScreen ? '90%' : '500px';
  const [imageUrl, setImageUrl] = useState(null);
  const [currentExtIndex, setCurrentExtIndex] = useState(0);
  const regNo = searchSingle.reg_no;
  const imageExtensions = ['jpeg', 'jpg', 'png'];

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);

    const loadImage = async () => {
      try {
        const ext = imageExtensions[currentExtIndex];
        const potentialUrl = `https://s3.brilliant.com.bd/icab-exam/studentDocument/${regNo}/${regNo}.${ext}`;
        const imageExists = await checkIfImageExists(potentialUrl);

        // console.log(potentialUrl);

        if (imageExists) {
          setImageUrl(potentialUrl);
        } else {
          const nextExtIndex = (currentExtIndex + 1) % imageExtensions.length;
          setCurrentExtIndex(nextExtIndex);
        }
      } catch (error) {
        console.error(error);
      }
    };

    loadImage();
  }, [regNo, currentExtIndex]);

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

  const handleClose = () => {
    setDetailsView(false);
  }

  const handleImgError = (e) => {
    const imagePath = process.env.PUBLIC_URL + '/android-chrome-192x192.png';
    e.target.src = imagePath;
  }

  const handleExtensionChange = () => {
    const nextExtIndex = (currentExtIndex + 1) % imageExtensions.length;
    setCurrentExtIndex(nextExtIndex);
  };

  async function checkIfImageExists(url) {
    try {
      const response = await fetch(url, {
        mode: 'no-cors',
      });

      if (response.status === 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  function DetailsInfoView() {

    if (imageUrl) {
      return (
        <Card key={searchSingle.id}>
          <CardContent style={{
            display: 'flex',
            alignItems: 'center',
            flexDirection: isDesktop ? 'row' : 'column'
          }}>
            <div style={{
              marginRight: isDesktop ? '1rem' : '',
              marginBottom: isDesktop ? '' : '1rem'
            }}>
              <img
                src={imageUrl}
                alt={`${searchSingle.name}'s profile picture`}
                style={{ borderRadius: '.7rem', width: '130px', height: '100%', objectFit: 'cover' }}
                onError={handleImgError}
              />
            </div>
            <div>
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
              <IconButton style={{
                position: 'absolute',
                right: '.5rem',
                bottom: '.4rem'
              }} onClick={handleExtensionChange}>
                <Refresh />
              </IconButton>
            </div>
          </CardContent>
        </Card>
      );
    } else {
      return <div className={extStyles.spinnerarea_deatails}><CircularProgress /></div>;
    }
  }

  // eslint-disable-next-line
  const renderDetailsDialog = () => {
    return (
      <Dialog
        maxWidth="md"
        PaperProps={{
          sx: {
            minWidth: dialogMinWidth,
          },
        }}
        open={detailsView}
        onClose={() => setDetailsView(false)}
      >
        <DialogTitle>{searchSingle.name}</DialogTitle>
        <DialogContent>
          <DetailsInfoView />
        </DialogContent>
        <DialogActions sx={{
          justifyContent: 'flex-end',
          paddingRight: '1rem',
          paddingBottom: '1rem'
        }}>
          <Button variant="outlined" onClick={handleClose}>Close</Button>
        </DialogActions>
      </Dialog>
    )
  };
  const LeftSide = () => (
    <div>
      <Paper style={{
        padding: '1rem',
        borderRadius: '1rem',
        position: 'relative',
      }}>
        <div style={{
          position: 'sticky',
          top: '0',
          background: 'white',
          zIndex: 1,
          padding: '1rem',
          borderRadius: '1rem',
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
              onChange={(e) => setSearchValue(e.target.value)}
              endAdornment={
                <InputAdornment position="end">
                  {searchValue && (
                    <Clear
                      onClick={() => setSearchValue('')}
                      style={{
                        cursor: 'pointer',
                        marginRight: '.5rem'
                      }}
                    />
                  )}
                </InputAdornment>
              }
            />
            <Button variant="contained" color="primary" onClick={handleSearch}>
              <Search />
            </Button>
          </Box>
        </div>
        {searchArray ? (
          <List style={{
            overflow: 'scroll',
            height: '30rem'
          }}>
            {searchResult.map((item) => (
              <ListItem key={item.id} sx={{
                padding: '.3rem 0rem'
              }}>
                <Card sx={{
                  width: '100%',
                  padding: '0px',
                }}
                  onClick={() => {
                    setSearchSingle(item)
                    setValueClick(true)
                    { isDesktop ? setDetailsView(false) : setDetailsView(true) }

                  }}
                >
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
    <div>
      <Paper style={{
        padding: '0px',
        borderRadius: '1rem'
      }}>
        {valueClick ? (
          <DetailsInfoView />
        ) : (
          <div className={extStyles.not_selected} >No data selected.</div>
        )}
      </Paper>
    </div>
  );


  return (
    <Container maxWidth="xl">
      <>
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (
          <Grid container spacing={2}>
            <Grid item xs={12} lg={5} md={12} sm={12}>
              <LeftSide />
            </Grid>
            {isDesktop ? (
              <Grid item xs={12} lg={7} md={12} sm={12}>
                <RightSide />
              </Grid>
            ) : (
              <></>
            )}

          </Grid>
        )}

        <Snackbar
          anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
          open={snackbarOpen}
          autoHideDuration={3000}
          onClose={() => setSnackbarOpen(false)}
          message={snackbarMessage.toString()}
        />
        {!isDesktop ? renderDetailsDialog() : ""}
      </>
    </Container>
  );
}
