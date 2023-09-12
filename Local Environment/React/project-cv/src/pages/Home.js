import React, { useState, useEffect, useCallback, memo, useRef } from 'react';
import { debounce } from 'lodash';
import PropTypes from 'prop-types';
import { FixedSizeList as FixedList } from "react-window";
import {
  Container,
  Box,
  Snackbar,
  Card,
  CardContent,
  Typography,
  CardActionArea,
  ListItem,
  Paper,
  Grid,
  Dialog,
  Button,
  DialogContent,
  CircularProgress,
  useMediaQuery,
  DialogActions,
  IconButton,
  Skeleton
} from '@mui/material';
import { Search, Clear, Refresh } from '@mui/icons-material';

import useResponsive from '../utils/UseResponsive';
import { searchData } from '../auth/api';
import extStyles from '../utils/styles.module.css';


function DetailsInfoView({
  searchSingle,
  currentExtIndex,
  setImageUrl,
  imageUrl,
  isDesktop,
  handleImgError,
  imageExtensions,
  handleExtensionChange
}) {
  const checkIfImageExists = useCallback(async (url) => {
    try {
      const response = await fetch(url, {
        mode: 'no-cors',
      });
      return response.status === 0;
    } catch (error) {
      return false;
    }
  }, []);

  const loadImage = useCallback(async (item) => {
    try {
      const ext = imageExtensions[currentExtIndex];
      const potentialUrl = `${process.env.REACT_APP_IMG_URL}/${item.reg_no}/${item.reg_no}.${ext}`;
      const imageExists = await checkIfImageExists(potentialUrl);

      if (imageExists) {
        setImageUrl(potentialUrl);
      } else {
        console.error('Image does not exist.');
      }
    } catch (error) {
      console.error('Error loading image:', error);
    }
  }, [currentExtIndex, setImageUrl, checkIfImageExists, imageExtensions]);

  useEffect(() => {
    if (searchSingle.length > 0) {
      searchSingle.forEach((item) => {
        if (item.photo === null) {
          loadImage(item);
        }
      });
    }
  }, [loadImage, searchSingle]);

  if (searchSingle.length > 0) {
    return (
      <div style={{
        backgroundColor: 'none'
      }}>
        {searchSingle.map((item) => (

          <Card
            key={item.id}
            style={{
              marginBottom: '1rem'
            }}
          >
            <CardContent style={{
              display: 'flex',
              alignItems: isDesktop ? 'flex-start' : 'center',
              flexDirection: isDesktop ? 'row' : 'column',
            }}>
              <div style={{
                marginRight: isDesktop ? '1rem' : '',
                marginBottom: isDesktop ? '' : '1rem'
              }}>
                <img
                  src={(item.photo === null) ? imageUrl : `data:image/jpeg;base64,${item.photo}`}
                  alt={`Profile of ${item.name}`}
                  style={{ borderRadius: '.7rem', width: '130px', height: '100%', objectFit: 'cover' }}
                  onError={handleImgError}
                />
              </div>
              <div>
                <Typography variant="h6" component="div">
                  {item.name} ({item.reg_no})
                </Typography>
                <Typography variant="body2" color="textSecondary">
                  <strong>Mobile:</strong> {item.mobile}
                </Typography>
                <Typography variant="body2" color="textSecondary">
                  <strong>Email:</strong> {item.email}
                </Typography>
                <Typography variant="body2" color="textSecondary">
                  <strong>Birthday:</strong> {item.birthday}
                </Typography>
                {item.photo === null ? (
                  <IconButton style={{
                    position: 'absolute',
                    right: '.5rem',
                    bottom: '.4rem'
                  }} onClick={handleExtensionChange}>
                    <Refresh />
                  </IconButton>
                ) : (
                  <></>
                )}
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    );
  } else {
    return <div className={extStyles.spinnerarea_deatails}><CircularProgress /></div>;
  }
}


DetailsInfoView.propTypes = {
  searchSingle: PropTypes.array.isRequired,
  imageExtensions: PropTypes.array.isRequired,
  currentExtIndex: PropTypes.number.isRequired,
  setImageUrl: PropTypes.func.isRequired,
  imageUrl: PropTypes.string,
  isDesktop: PropTypes.bool.isRequired,
  handleImgError: PropTypes.func.isRequired,
  handleExtensionChange: PropTypes.func.isRequired,
};

export const MemoizedDetailsInfoView = memo(DetailsInfoView);

export default function Home() {
  const searchInputRef = useRef(null);

  const imagePath = process.env.PUBLIC_URL + '/android-chrome-192x192.png';
  const [loading, setLoading] = useState(true);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [valueClick, setValueClick] = useState(false);
  const [searchArray, setSearchArray] = useState(false);
  const [detailsView, setDetailsView] = useState(false);
  const [clearState, setClearState] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  // const [searchValue, setSearchValue] = useState('');
  const [searchResult, setSearchResult] = useState([]);
  const [searchSingle, setSearchSingle] = useState([]);
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const dialogMinWidth = isSmallScreen ? '90%' : '500px';
  const [imageUrl, setImageUrl] = useState(imagePath);
  const [currentExtIndex, setCurrentExtIndex] = useState(0);
  const imageExtensions = ['jpeg', 'jpg', 'png'];
  const [searchLoading, setSearchLoading] = useState(false);

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);


  const handleFilter = () => {
    const inputValue = searchInputRef.current.value;
    const filteredResult = searchResult.filter((item) =>
      item.name.toLowerCase().includes(inputValue.toLowerCase())
    );
    setSearchResult(filteredResult);
  };

  // eslint-disable-next-line
  const handleSearch = (e) => {
    e.preventDefault();
    const inputValue = searchInputRef.current.value;
    const requestData = {
      search: inputValue,
      searchType: 'search',
    };
    if (inputValue.trim() === '') {
      setSnackbarMessage("Please enter keywords to search.");
      setSnackbarOpen(true);
    } else {
      setSearchLoading(true);
      searchData(requestData)
        .then((response) => {
          setSearchLoading(false);
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
          setSearchLoading(false);
          setSnackbarMessage("An error occurred during the search.");
          setSnackbarOpen(true);
        });
    }
  };

  // eslint-disable-next-line
  const handleSearchView = useCallback(debounce((reg_no) => {
    const requestData = {
      search: reg_no,
      searchType: 'view',
    };
    searchData(requestData)
      .then((response) => {
        const result = response.result;
        setSearchSingle(result);
      })
      .catch((error) => {
        console.error(error);
      });
  }, 300), []);

  const handleClose = () => {
    setDetailsView(false);
    setSearchSingle([]);
  }

  const clearSearchValue = () => {
    searchInputRef.current.value = '';
    setClearState(true);
  }

  const removeSearchStates = () => {
    searchInputRef.current.value = '';
    setSearchResult([]);
    setSearchSingle([]);
    setDetailsView(false);
    setSearchArray(false);
    setValueClick(false);
    setSearchLoading(false);
    setImageUrl(null);
    setClearState(false);
  }

  // const handleInputChange = (e) => {
  //   const newValue = e.target.value;
  //   setSearchValue(newValue);
  // };

  const handleImgError = useCallback((e) => {
    e.preventDefault();
    e.target.src = imagePath;
    e.target.onerror = null;
  }, [imagePath]);


  const Row = useCallback(({ index, style }) => {
    const item = searchResult[index];
    return (
      <div style={style}>
        <ListItem>
          <Card
            sx={{
              width: '100%',
              padding: 0,
            }}
            onClick={() => {
              handleSearchView(item.reg_no);
              setValueClick(true);
              setSearchSingle([]);
              setImageUrl(imagePath);
              isDesktop ? setDetailsView(false) : setDetailsView(true);
            }}
          >
            <CardActionArea>
              <CardContent
                sx={{
                  padding: '1rem',
                }}>
                <Typography variant="p" component="div">
                  {item.name} ({item.reg_no})
                </Typography>
              </CardContent>
            </CardActionArea>
          </Card>
        </ListItem>
      </div>
    );
  }, [searchResult, isDesktop, handleSearchView, imagePath]);

  const handleExtensionChange = useCallback(() => {
    const nextExtIndex = (currentExtIndex + 1) % imageExtensions.length;
    setCurrentExtIndex(nextExtIndex);
  }, [currentExtIndex, imageExtensions.length]);

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
        <DialogContent
          sx={{
            padding: 0,
            boxShadow: 'none'
          }}
        >
          <MemoizedDetailsInfoView
            searchSingle={searchSingle}
            currentExtIndex={currentExtIndex}
            imageExtensions={imageExtensions}
            setImageUrl={setImageUrl}
            imageUrl={imageUrl}
            isDesktop={isDesktop}
            handleImgError={handleImgError}
            handleExtensionChange={handleExtensionChange}
          />
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
        padding: '0',
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
            <form
              style={{
                width: '100%'
              }}
              onSubmit={handleSearch}>
              <div style={{ position: 'relative', display: 'flex', alignItems: 'center' }}>
              <input
                  autoFocus
                  placeholder="Search…"
                  style={{
                    padding: '1rem',
                    border: 'none',
                    fontSize: '1rem',
                    fontWeight: 'bold',
                    outline: 'none',
                    width: '100%', // make the input take the full width
                    paddingRight: '3rem' // space for the adornments
                  }}
                  defaultValue={searchInputRef.current ? searchInputRef.current.value : ''}
                  inputMode="text"
                  name='search'
                  autoComplete="off"
                  ref={searchInputRef}
                  onKeyPress={(e) => {
                    if (e.key === 'Enter') {
                      e.preventDefault();
                      searchArray ? handleFilter() : handleSearch(e);
                      searchInputRef.current && searchInputRef.current.blur();
                    }
                  }}
                />
                <div style={{ position: 'absolute', right: '1rem', display: 'flex', alignItems: 'center' }}>
                {searchInputRef.current && searchInputRef.current.value && (
                    <IconButton
                      style={{
                        cursor: 'pointer',
                        marginRight: '.5rem'
                      }}
                      // onClick={clearState ? removeSearchStates : clearSearchValue}
                      onClick={removeSearchStates}
                    >
                      <Clear />
                    </IconButton>
                  )}
                  <IconButton
                    style={{
                      cursor: 'pointer',
                    }}
                    onClick={(e) => {
                      searchArray ? handleFilter() : handleSearch(e);
                      searchInputRef.current && searchInputRef.current.blur();
                  }}
                    color="primary"
                  >
                    <Search />
                  </IconButton>
                </div>
              </div>

            </form>
          </Box>
        </div>
        {searchLoading ? (
          <Box sx={{
            width: '100%',
            height: '450px',
            padding: '1rem'
          }}>
            <Skeleton height={('4rem')} animation="wave" />
            <Skeleton animation={false} />
            <Skeleton animation="wave" />
            <Skeleton height={('3rem')} animation={true} />
            <Skeleton animation='wave' />
            <Skeleton height={('3rem')} animation={false} />
            <Skeleton animation='wave' />
          </Box>
        ) : (
          searchArray ? (
            <FixedList
              height={450}
              itemCount={searchResult.length}
              itemSize={50}
              width={('100%')}
            >
              {Row}
            </FixedList>
          ) : (
            <></>
          )
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
          <MemoizedDetailsInfoView
            searchSingle={searchSingle}
            currentExtIndex={currentExtIndex}
            imageExtensions={imageExtensions}
            setImageUrl={setImageUrl}
            imageUrl={imageUrl}
            isDesktop={isDesktop}
            handleImgError={handleImgError}
            handleExtensionChange={handleExtensionChange}
          />
        ) : (
          <></>
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
