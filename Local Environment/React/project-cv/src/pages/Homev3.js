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
  FormControlLabel,
  Switch,
  IconButton,
  Skeleton,
  Divider
} from '@mui/material';
import { Search, Clear, Refresh, Close, ArrowBackIos, ArrowForwardIos, School, BusinessCenter } from '@mui/icons-material';

import useResponsive from '../utils/UseResponsive';
import { searchData } from '../auth/api';
import extStyles from '../utils/styles.module.css';


function DetailsInfoView({
  originalSearchResults,
  currentIndex,
  viewLoading,
  imagePath,
  setSearchSingle,
  setViewLoading,
  handleSearchView,
  setCurrentIndex,
  searchSingle,
  currentExtIndex,
  setImageUrl,
  setDetailsView,
  optionSearch,
  imageUrl,
  isDesktop,
  handleImgError,
  imageExtensions,
  handleExtensionChange
}) {

  const item = searchSingle;

  const handlePrev = () => {
    let newIndex;
    if (currentIndex === 0) {
      newIndex = originalSearchResults.length - 1; // go to the last item
    } else {
      newIndex = currentIndex - 1; // go to the previous item
    }

    const regNo = originalSearchResults[newIndex].regNo;
    const userkeyid = originalSearchResults[newIndex].userkeyid;
    handleSearchView(optionSearch ? userkeyid : regNo);
    setCurrentIndex(newIndex);
    setSearchSingle({});
    setImageUrl(imagePath);
    setViewLoading(true);
  };

  const handleNext = () => {
    let newIndex;
    if (currentIndex === originalSearchResults.length - 1) {
      newIndex = 0; // go to the first item
    } else {
      newIndex = currentIndex + 1; // go to the next item
    }
    const regNo = originalSearchResults[newIndex].regNo;
    const userkeyid = originalSearchResults[newIndex].userkeyid;
    handleSearchView(optionSearch ? userkeyid : regNo);
    setCurrentIndex(newIndex);
    setSearchSingle({});
    setViewLoading(true);
    setImageUrl(imagePath);
  };

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

  // const id_no = optionSearch ? searchSingle.userkeyid : searchSingle.regNo;
  const id_no = optionSearch ? searchSingle?.userkeyid : searchSingle?.regNo;
  const fetchImage = useCallback(async () => {
    try {
      const ext = imageExtensions[currentExtIndex];
      const potentialUrl = `${process.env.REACT_APP_IMG_URL}/${id_no}/${id_no}.${ext}`;
      const imageExists = await checkIfImageExists(potentialUrl);

      if (imageExists) {
        setImageUrl(potentialUrl);
      } else {
        console.error('Image does not exist.');
      }
    } catch (error) {
      console.error('Error loading image:', error);
    }
  }, [currentExtIndex, checkIfImageExists, imageExtensions, setImageUrl, id_no]);

  const debouncedFetchImage = useCallback(debounce(() => {
    fetchImage();
  }, 500), [fetchImage]); // 500ms delay

  const get_photo_single = optionSearch ? searchSingle?.image_base64 : searchSingle?.photo;

  useEffect(() => {

    if (get_photo_single === null) {
      debouncedFetchImage();
    }
    // Cleanup to cancel any pending debounced calls when component unmounts or on other significant changes.
    return () => debouncedFetchImage.cancel();
  }, [currentExtIndex, get_photo_single, debouncedFetchImage]);

  const get_photo = optionSearch ? item?.image_base64 : item?.photo;

  if (!viewLoading) {
    return (
      <div style={{
        backgroundColor: 'none'
      }}>

        <Card
          key={item?.id}
          style={{
            borderRadius: isDesktop ? '1rem' : '0'

          }}
        >
          <CardContent style={{
            display: 'flex',
            alignItems: isDesktop ? 'flex-start' : '',
            flexDirection: isDesktop ? 'row' : 'column',
            minHeight: '15rem',
          }}>
            <div style={{
              marginRight: isDesktop ? '1rem' : '',
              marginBottom: isDesktop ? '' : '1rem',
              display: 'flex',
              alignItems: isDesktop ? 'flex-start' : 'center',
              flexDirection: isDesktop ? 'row' : 'column',
            }}>
              <img
                src={(get_photo === null) ? optionSearch ? item.srvhost+''+item.memberimg : imageUrl : `data:image/jpeg;base64,${get_photo}`}
                alt={`Profile of ${optionSearch ? item?.first_name : item?.name}`}
                style={{ borderRadius: '.7rem', width: optionSearch ? isDesktop ? '11rem' : '9rem' : '9rem', height: '100%', objectFit: 'cover' }}
                onError={handleImgError}
              />
            </div>
            <div>
              {
                optionSearch ? (
                  <>
                    <Typography variant="h5" component="div">
                      {item?.userfullname}
                    </Typography>
                    <Typography variant="body1" color="textSecondary">
                      {item?.userposition}, {item?.userorgname}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>ACA Date: </strong> {item?.acadate}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>FCA Date: </strong> {item?.fcadate}
                    </Typography>
                    {item?.educationinfo=="" ? "" : (
                      <Typography variant="body2" color="textSecondary">
                      <strong>Graduation: </strong> {item?.educationinfo}
                    </Typography>
                    )}
                    <Typography variant="body2" color="textSecondary">
                      <strong>Membership Status: </strong> {item?.membershipstatus} ({item?.occupationalcategory})
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Mobile: </strong> {item?.cellphone1}, {item?.cellphone2}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Email: </strong> {item?.emailid1}, {item?.emailid2}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Address: </strong>{item?.useraddress}
                    </Typography>
                  </>
                ) : (
                  <>
                    <Typography variant="h6" component="div">
                      {item.name} ({item.regNo}/{item.regYear})
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Article Period:</strong> {item.periodFrom} to {item.periodTo}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Father Name:</strong> {item.fName}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Mother Name:</strong> {item.mName}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Mobile:</strong> {item.cell}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Present Address:</strong> {item.preAdd}
                    </Typography>
                     <Typography variant="body2" color="textSecondary">
                      <strong>Permanent Address:</strong> {item.perAdd}
                    </Typography>
                     <Typography variant="body2" color="textSecondary">
                      <strong>Email:</strong> {item.email}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Firm Name:</strong> {item.firmName}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Principal Name:</strong> {item.prinName}
                    </Typography>
                    <Typography variant="body2" color="textSecondary">
                      <strong>Birthday:</strong> {item.dob}
                    </Typography>
                  </>
                )
              }
              {get_photo === null ? (
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
          {(optionSearch && item.regNo) || (!optionSearch && item.userkeyid) ? (
            <div>
              <Divider sx={{}} />
              <div style={{ padding: '1rem' }}>
                <strong>{optionSearch ? "Registration Number: " : "Enrollment Number: "}</strong>
                {optionSearch ? item.regNo : item.userkeyid}
              </div>
            </div>
          ) : null}

        </Card>

        <Grid container spacing={2} alignItems="center"
          sx={{
            margin: 0,
            width: '100%'
          }}>
          <Grid item xs={6} style={{
            padding: isDesktop ? '1rem 1rem 1rem 0' : '1rem'
          }}>
            <Button
              variant="contained"
              color="primary"
              onClick={handlePrev}
            >
              <ArrowBackIos />
            </Button>
          </Grid>
          <Grid item xs={6} style={{
            textAlign: 'right',
            padding: isDesktop ? '1rem 0 1rem 1rem' : '1rem'
          }}>
            <Button
              variant="contained"
              color="primary"
              onClick={handleNext}
            >
              <ArrowForwardIos />
            </Button>
          </Grid>
        </Grid>


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
  const [viewLoading, setViewLoading] = useState(true);
  const [clearState, setClearState] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  // const [searchValue, setSearchValue] = useState('');
  const [searchResult, setSearchResult] = useState([]);
  const [searchSingle, setSearchSingle] = useState({});
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const dialogMinWidth = isSmallScreen ? '90%' : '500px';
  const [imageUrl, setImageUrl] = useState(imagePath);
  const [currentExtIndex, setCurrentExtIndex] = useState(0);
  const imageExtensions = ['jpeg', 'jpg', 'png'];
  const [searchLoading, setSearchLoading] = useState(false);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [optionSearch, setOptionSearch] = useState(false);

  const handleChange = (e) => {
    setOptionSearch(e.target.checked);
    setSearchResult([]);
    setSearchSingle({});
    setDetailsView(false);
    setSearchArray(false);
    setValueClick(false);
    setSearchLoading(false);
    setImageUrl(null);
    setClearState(false);
  };

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);


  const handleFilter = () => {
    const inputValue = searchInputRef.current.value.toLowerCase();
    const filteredResult = searchResult.filter((item) => {
      if (optionSearch) {
        return item.userfullname.toLowerCase().includes(inputValue)
      } else {
        return item.name.toLowerCase().includes(inputValue);
      }
    });
    setSearchResult(filteredResult);
  };

  // eslint-disable-next-line
  const handleSearch = (e) => {
    e.preventDefault();
    const inputValue = searchInputRef.current.value;
    const requestData = {
      search: inputValue,
      searchType: 'search',
      searchFrom: optionSearch
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
          // console.log(result);
          if (Array.isArray(result) && result.length > 0) {
            setSearchResult(result);
            setOptionSearch(response.search);
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
  const handleSearchView = useCallback(debounce((regNo) => {
    const requestData = {
      search: regNo,
      searchType: 'view',
      searchFrom: optionSearch
    };
    searchData(requestData)
      .then((response) => {
        const result = response.result;
        setSearchSingle(result);
        // console.log(response);

        setViewLoading(false);
        const index = searchResult.findIndex(item => (optionSearch ? item.userkeyid : item.regNo) === regNo);
        if (index !== -1) {
          setCurrentIndex(index);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }, 300), [searchResult]);

  const handleClose = () => {
    setDetailsView(false);
    setSearchSingle({});
    setValueClick(false);
  }

  const clearSearchValue = () => {
    searchInputRef.current.value = '';
    setClearState(true);
  }

  const removeSearchStates = () => {
    searchInputRef.current.value = '';
    setSearchResult([]);
    setSearchSingle({});
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
              handleSearchView(optionSearch ? item.userkeyid : item.regNo);
              setValueClick(true);
              setViewLoading(true);
              setSearchSingle({});
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
                  {optionSearch ? item.userfullname : item.name} {optionSearch ? '' : '('+item.regNo+')'}
                </Typography>
              </CardContent>
            </CardActionArea>
          </Card>
        </ListItem>
      </div>
    );
  }, [searchResult, isDesktop, handleSearchView, imagePath, optionSearch]);

  const handleExtensionChange = useCallback(() => {
    const nextExtIndex = (currentExtIndex + 1) % imageExtensions.length;
    setCurrentExtIndex(nextExtIndex);
    setImageUrl(imagePath);
  }, [currentExtIndex, imageExtensions.length, imagePath]);

  const renderDetailsDialog = () => {
    return (
      <Dialog
        maxWidth="md"
        PaperProps={{
          sx: {
            minWidth: dialogMinWidth,
            position: 'relative'
          },
        }}
        open={detailsView}
        onClose={() => setDetailsView(false)}
      >
        <IconButton
          aria-label="close"
          onClick={handleClose}
          sx={{
            position: 'absolute',
            right: 8,
            top: 8,
            zIndex: 999
          }}
        >
          <Close />
        </IconButton>
        <DialogContent
          sx={{
            padding: 0,
            boxShadow: 'none'
          }}
        >
          <MemoizedDetailsInfoView
            searchSingle={searchSingle}
            setCurrentIndex={setCurrentIndex}
            setDetailsView={setDetailsView}
            viewLoading={viewLoading}
            setViewLoading={setViewLoading}
            setSearchSingle={setSearchSingle}
            currentExtIndex={currentExtIndex}
            imageExtensions={imageExtensions}
            handleSearchView={handleSearchView}
            setImageUrl={setImageUrl}
            imagePath={imagePath}
            imageUrl={imageUrl}
            isDesktop={isDesktop}
            handleImgError={handleImgError}
            optionSearch={optionSearch}
            handleExtensionChange={handleExtensionChange}
            originalSearchResults={searchResult}
            currentIndex={currentIndex}
          />
        </DialogContent>
        {/* <DialogActions sx={{
          justifyContent: 'flex-end',
          paddingRight: '1rem',
          paddingBottom: '1rem'
        }}>
          <Button variant="outlined" onClick={handleClose}>Close</Button>
        </DialogActions> */}
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

                <FormControlLabel
                  labelPlacement="start"
                  sx={{
                    margin: 0
                  }}
                  control={
                    <Switch
                      checked={optionSearch}
                      onChange={handleChange}
                      disabled={searchLoading}
                    />
                  }
                />

                <input
                  autoFocus
                  placeholder='Search . . .'
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
                    {optionSearch ? <BusinessCenter /> : <School />}
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
        borderRadius: '1rem',
        background: 'none'
      }}>
        {valueClick ? (
          <MemoizedDetailsInfoView
            searchSingle={searchSingle}
            setCurrentIndex={setCurrentIndex}
            viewLoading={viewLoading}
            setDetailsView={setDetailsView}
            setViewLoading={setViewLoading}
            setSearchSingle={setSearchSingle}
            currentExtIndex={currentExtIndex}
            imageExtensions={imageExtensions}
            handleSearchView={handleSearchView}
            setImageUrl={setImageUrl}
            imagePath={imagePath}
            imageUrl={imageUrl}
            isDesktop={isDesktop}
            optionSearch={optionSearch}
            handleImgError={handleImgError}
            handleExtensionChange={handleExtensionChange}
            originalSearchResults={searchResult}
            currentIndex={currentIndex}
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
            <Grid item xs={12} lg={4} md={12} sm={12}>
              <LeftSide />
            </Grid>
            {isDesktop ? (
              <Grid item xs={12} lg={8} md={12} sm={12}>
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