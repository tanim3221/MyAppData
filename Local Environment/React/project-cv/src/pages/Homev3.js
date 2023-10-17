import React, { useState, useEffect, useCallback, memo, useRef } from 'react';
import { debounce } from 'lodash';
import PropTypes from 'prop-types';
import { FixedSizeList as FixedList } from "react-window";
import {
  Container,
  Table, TableBody, TableCell, TableContainer, TableHead, TableRow,
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
  viewEduInfoLoading,
  setViewEduInfo,
  viewEduInfo,
  eduResult,
  setSearchSingle,
  setViewLoading,
  handleSearchView,
  setCurrentIndex,
  searchSingle,
  currentExtIndex,
  setImageUrl,
  setDetailsView,
  setViewEduInfoLoading,
  optionSearch,
  imageUrl,
  isDesktop,
  handleImgError,
  imageExtensions,
  handleExtensionChange,
  handleEducationHistory
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
    setViewEduInfo(false);
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
    setViewEduInfo(false);
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
        backgroundColor: 'none',
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
            minHeight: '10rem',
          }}>
            <div style={{
              marginRight: isDesktop ? '1rem' : '',
              marginBottom: isDesktop ? '' : '1rem',
              display: 'flex',
              alignItems: isDesktop ? 'flex-start' : 'center',
              flexDirection: isDesktop ? 'row' : 'column',
            }}>
              <img
                src={(get_photo === null) ? optionSearch ? item.srvhost + '' + item.memberimg : imageUrl : `data:image/jpeg;base64,${get_photo}`}
                alt={`Profile of ${optionSearch ? item?.first_name : item?.name}`}
                style={{ borderRadius: '.5rem', width: optionSearch ? isDesktop ? '12rem' : '12rem' : '9rem', height: '100%', objectFit: 'cover' }}
                onError={handleImgError}
              />
            </div>
            <div style={{
              width: '100%'
            }}>
              {
                optionSearch ? (
                  <div>
                    <TableContainer component={Paper}>
                      <Table>
                        <TableBody>
                          <TableRow >
                            <TableCell className={extStyles.tableTd_name}>{item?.userfullname}</TableCell>
                          </TableRow>
                          <TableRow >
                            <TableCell className={extStyles.tableTd_title}>{item?.userposition}, {item?.userorgname}</TableCell>
                          </TableRow>
                        </TableBody>
                      </Table>
                    </TableContainer>
                  </div>
                ) : (
                  <div>
                    <TableContainer component={Paper}>
                      <Table>
                        <TableBody>
                          <TableRow>
                            <TableCell rowSpan={2} className={extStyles.tableTd_name}>{item.name} ({item.regNo}/{item.regYear})</TableCell>
                          </TableRow>
                        </TableBody>
                      </Table>

                      <Table>
                        <TableBody>
                          <TableRow >
                            <TableCell className={extStyles.tableTh}>Mobile: </TableCell>
                            <TableCell className={extStyles.tableTd}>{item.cell}</TableCell>
                          </TableRow>


                          <TableRow >
                            <TableCell className={extStyles.tableTh}>Email: </TableCell>
                            <TableCell className={extStyles.tableTd}>{item.email}</TableCell>
                          </TableRow>

                          <TableRow >
                            <TableCell className={extStyles.tableTh}>Birthday: </TableCell>
                            <TableCell className={extStyles.tableTd}>{item.dob}</TableCell>
                          </TableRow>


                          <TableRow >
                            <TableCell className={extStyles.tableTh}>Father Name: </TableCell>
                            <TableCell className={extStyles.tableTd}>{item.fName}</TableCell>
                          </TableRow>


                          <TableRow >
                            <TableCell className={extStyles.tableTh}>Mother Name: </TableCell>
                            <TableCell className={extStyles.tableTd}>{item.mName}</TableCell>
                          </TableRow>

                        </TableBody>
                      </Table>
                    </TableContainer>
                  </div>
                )
              }
              {
                !optionSearch ? (
                  <>
                    <IconButton style={{
                      float: 'right',
                      marginTop: '1rem'
                    }}
                      color="success"
                      onClick={() => {
                        handleEducationHistory(item.regNo);
                        setViewEduInfoLoading(true);
                      }}
                    >
                      <School />
                    </IconButton>
                  </>
                ) : (
                  <></>
                )
              }

              {get_photo === null && !optionSearch ? (
                <div>
                  <IconButton style={{
                    float: optionSearch ? 'right' : 'left',
                    marginTop: '1rem'
                  }} onClick={handleExtensionChange}>
                    <Refresh />
                  </IconButton>
                </div>

              ) : (
                <></>
              )}
            </div>
          </CardContent>

          <Divider sx={{}} />
          <CardContent style={{
            display: 'flex',
            alignItems: isDesktop ? 'flex-start' : '',
            flexDirection: isDesktop ? 'row' : 'column',
            minHeight: '12rem',
          }}>
            {
              optionSearch ? (
                <div>

                  <TableContainer component={Paper}>
                    <Table>
                      <TableBody>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Mobile</TableCell>
                          <TableCell className={extStyles.tableTd}>{item?.cellphone1}, {item?.cellphone2}</TableCell>
                        </TableRow>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Email</TableCell>
                          <TableCell className={extStyles.tableTd}>{item?.emailid1}, {item?.emailid2}</TableCell>
                        </TableRow>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>ACA Date</TableCell>
                          <TableCell className={extStyles.tableTd}>{item?.acadate}</TableCell>
                        </TableRow>
                        {item?.fcadate === "" ? "" : (
                          <TableRow>
                            <TableCell className={extStyles.tableTh}>FCA Date</TableCell>
                            <TableCell className={extStyles.tableTd}>{item?.fcadate}</TableCell>
                          </TableRow>
                        )}
                        {item?.educationinfo === "" ? "" : (
                          <TableRow>
                            <TableCell className={extStyles.tableTh}>Graduation</TableCell>
                            <TableCell className={extStyles.tableTd}>{item?.educationinfo}</TableCell>
                          </TableRow>
                        )}
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Membership Status</TableCell>
                          <TableCell className={extStyles.tableTd}>{item?.membershipstatus} ({item?.occupationalcategory})</TableCell>
                        </TableRow>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Address</TableCell>
                          <TableCell className={extStyles.tableTd}>{item?.useraddress} </TableCell>
                        </TableRow>
                      </TableBody>
                    </Table>
                  </TableContainer>
                </div>
              ) : (

                <div>

                  <TableContainer component={Paper}>
                    <Table>
                      <TableBody>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Article Period</TableCell>
                          <TableCell className={extStyles.tableTd}>{item.periodFrom} to {item.periodTo}</TableCell>
                        </TableRow>
                        {item?.preAdd === "" || item?.preAdd == null ? "" : (
                          <TableRow>
                            <TableCell className={extStyles.tableTh}>Present Address</TableCell>
                            <TableCell className={extStyles.tableTd}>{item.preAdd}</TableCell>
                          </TableRow>
                        )}
                        {item?.perAdd === "" || item?.perAdd == null ? "" : (
                          <TableRow>
                            <TableCell className={extStyles.tableTh}>Permanent Address</TableCell>
                            <TableCell className={extStyles.tableTd}>{item.perAdd}</TableCell>
                          </TableRow>
                        )}
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Firm Name</TableCell>
                          <TableCell className={extStyles.tableTd}>{item.firmName}</TableCell>
                        </TableRow>
                        <TableRow>
                          <TableCell className={extStyles.tableTh}>Principal Name</TableCell>
                          <TableCell className={extStyles.tableTd}>{item.prinName} {item.prinEnrNo === '0' ? '' : '(' + item.prinEnrNo + ')'}</TableCell>
                        </TableRow>
                      </TableBody>
                    </Table>
                  </TableContainer>
                </div>
              )
            }

          </CardContent>

          {
            viewEduInfo ? (
              !viewEduInfoLoading ? (
                <TableContainer component={Paper}>
                  <Table>
                    <TableHead>
                      <TableRow>
                        <TableCell>Degree</TableCell>
                        <TableCell>University/Board</TableCell>
                        <TableCell>Pass Year</TableCell>
                        <TableCell>Group</TableCell>
                      </TableRow>
                    </TableHead>
                    <TableBody>
                      {eduResult.map((item, index) => (
                        <TableRow key={index}>
                          <TableCell>{item.examName}</TableCell>
                          <TableCell>{item.boardUni}</TableCell>
                          <TableCell>{item.passYear}</TableCell>
                          <TableCell>{item.group_name}</TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </TableContainer>
              ) : (
                <>
                  <Box sx={{ width: '100%', borderRadius: '1rem'}}>
                    <Skeleton height={25} variant="rectangular"/>
                    <Skeleton height={30} variant="rectangular"/>
                  </Box>
                </>
              )
            ) : null
          }

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
  handleEducationHistory: PropTypes.func.isRequired,
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
  const [eduResult, setEduResult] = useState([]);
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
  const [viewEduInfo, setViewEduInfo] = useState(false);
  const [viewEduInfoLoading, setViewEduInfoLoading] = useState(false);

  const handleChange = (e) => {
    setOptionSearch(e.target.checked);
    setSearchResult([]);
    setSearchSingle({});
    setDetailsView(false);
    setSearchArray(false);
    setViewEduInfo(false);
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
    setEduResult([]);
    setViewEduInfoLoading(false);
    setViewEduInfo(false);
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
    setEduResult([]);
    setDetailsView(false);
    setViewEduInfo(false);
    setSearchArray(false);
    setValueClick(false);
    setSearchLoading(false);
    setViewEduInfoLoading(false);
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
                  {optionSearch ? item.userfullname : item.name} {optionSearch ? '' : '(' + item.regNo + ')'}
                </Typography>
              </CardContent>
            </CardActionArea>
          </Card>
        </ListItem>
      </div>
    );
  }, [searchResult, isDesktop, handleSearchView, imagePath, optionSearch]);


  // eslint-disable-next-line
  const handleEducationHistory = useCallback(debounce((regNo) => {
    const requestData = {
      search: regNo,
      searchType: 'edu',
      searchFrom: optionSearch
    };
    searchData(requestData)
      .then((response) => {
        const result = response.result;
        setEduResult(result);
        setViewEduInfoLoading(false);
        setViewEduInfo(true);
      })
      .catch((error) => {
        console.error(error);
      });
  }, 300), []);

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
            eduResult={eduResult}
            setViewEduInfo={setViewEduInfo}
            setViewEduInfoLoading={setViewEduInfoLoading}
            viewEduInfoLoading={viewEduInfoLoading}
            viewEduInfo={viewEduInfo}
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
            handleEducationHistory={handleEducationHistory}
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
            setViewEduInfoLoading={setViewEduInfoLoading}
            viewEduInfoLoading={viewEduInfoLoading}
            searchSingle={searchSingle}
            eduResult={eduResult}
            setViewEduInfo={setViewEduInfo}
            viewEduInfo={viewEduInfo}
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
            handleEducationHistory={handleEducationHistory}
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
