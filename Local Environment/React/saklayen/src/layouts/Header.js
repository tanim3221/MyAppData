import { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import { styled, alpha } from '@mui/material/styles';
import { Box, Stack, AppBar, Dialog, DialogContent, Checkbox, FormGroup, FormControlLabel, Button, DialogTitle, TextField, Toolbar, IconButton, Typography, Divider, MenuItem, Avatar, FormControl, InputLabel, Select, Popover, Portal, useMediaQuery, Snackbar } from '@mui/material';
import { useLocation, useNavigate } from 'react-router-dom';
import { Check } from '@mui/icons-material'


import { bgBlur } from '../utils/cssStyles';
import Iconify from '../components/iconify';
import { getProdDevUrl } from '../utils/commonFunction';
import { fetchData, changePasswordData, updateProData } from '../auth/api';
import { useStateContext } from '../auth/StateProvider';



const NAV_WIDTH = 280;
const HEADER_MOBILE = 66;
const HEADER_DESKTOP = 75;

const StyledRoot = styled(AppBar)(({ theme }) => ({
  ...bgBlur({ color: theme.palette.background.default }),
  boxShadow: 'none',
  [theme.breakpoints.up('lg')]: {
    width: `calc(100% - ${NAV_WIDTH + 1}px)`,
  },
}));

const StyledToolbar = styled(Toolbar)(({ theme }) => ({
  minHeight: HEADER_MOBILE,
  [theme.breakpoints.up('lg')]: {
    minHeight: HEADER_DESKTOP,
    padding: theme.spacing(0, 5),
  },
}));

function toProperCase(text) {
  return text
    .toLowerCase()
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

const StyledAppbar = styled('div')(({ theme }) => ({
  ...bgBlur({ color: theme.palette.background.default }),
  top: 0,
  left: 0,
  width: '100%',
  color: theme.palette.text.primary,
  display: 'flex',
  position: 'absolute',
  alignItems: 'center',
  height: HEADER_MOBILE,
  padding: theme.spacing(0, 3),
  boxShadow: theme.customShadows.z8,
  [theme.breakpoints.up('md')]: {
    height: HEADER_DESKTOP,
    padding: theme.spacing(0, 5),
  },
}));



Header.propTypes = {
  onOpenNav: PropTypes.func,
};


// eslint-disable-next-line
export default function Header({ onOpenNav }) {
  const { sharedState } = useStateContext();
  const loggedInToken = sessionStorage.getItem('authToken');
  const [open, setOpen] = useState(null);
  const [mainData, setMainData] = useState([]);
  const [changePassword, setChangePassword] = useState(false);
  const [openProfile, setOpenProfile] = useState(false);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');
  const [mediaList, setMediaList] = useState([]);
  const [selectedFile, setSelectedFile] = useState(null);
  const [showPass, setShowPass] = useState(false);

  const location = useLocation();
  const path = location.pathname.split('/')[1];
  const navigate = useNavigate();

  const customUserData = {
    'id': sharedState.userData.id,
    'username': sharedState.userData.username,
    'photo': sharedState.userData.photo,
    'name': sharedState.userData.name,
    'email': sharedState.userData.email,
  };

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setMediaList(responseData.saklayen.media);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);


  const TABLE_NAME = "users";

  const handleFileChange = (event) => {
    const selectedValue = event.target.value;
    setMainData((prevData) => ({
      ...prevData,
      photo: selectedValue,
    }));
    setSelectedFile(selectedValue);
  };

  const handleProChange = () => {

    const dataChanged = JSON.stringify(mainData) !== JSON.stringify(customUserData);

    if (!dataChanged) {
      setSnackbarMessage("No changes to save.");
      setSnackbarOpen(true);
      setOpenProfile(true);
      return;
    }

    const requestData = {
      data: mainData
    };

    updateProData(requestData)
      .then(response => {
        setSnackbarMessage(`${response.message} Please wait...`);
        setSnackbarOpen(true);
        setOpenProfile(false);
        setMainData([]);
        setTimeout(() => {
          navigate('/admin', { replace: true });
        }, 2000);
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error.message);
        setSnackbarOpen(true);
      });
  }

  const handleChange = (event) => {
    const { name, value } = event.target;
    setMainData((prevEdu) => ({
      ...prevEdu,
      [name]: value
    }));
  };

  const handleOpen = (event) => {
    setOpen(event.currentTarget);
  };

  const handleClose = () => {
    setOpen(false);
    setChangePassword(false);
    setOpenProfile(false);
    setMainData([]);
  };

  const handleTogglePasswordVisibility = () => {
    setShowPass(!showPass);
  }

  const handlePasswordChange = () => {
    const requestData = {
      table: TABLE_NAME,
      data: mainData,
      token: loggedInToken
    };

    changePasswordData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        if (!response.error) {
          setChangePassword(false);
          setMainData([]);
        }
      })
      .catch(error => {
        console.error(error);
        setSnackbarMessage(error);
        setSnackbarOpen(true);
      });
  }

  const userLogout = () => {
    sessionStorage.removeItem('authToken');
    sessionStorage.setItem('LoginMsg', 'Goodbye for now! You\'ve been logged out.');
    navigate('/admin');
  }

  const viewSite = () => {
    const url = window.location.origin;
    window.open(url, "_blank");
  }

  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const dialogMinWidth = isSmallScreen ? '90%' : '500px';

  // eslint-disable-next-line
  const renderPasswordDialog = () => {

    return (
      <Dialog
        maxWidth="md"
        PaperProps={{
          sx: {
            minWidth: dialogMinWidth,
          },
        }}
        open={changePassword}
        onClose={() => setChangePassword(false)}
      >
        <DialogTitle>Change Login Password</DialogTitle>
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
              label="Current Password"
              name='curr_pass'
              type={showPass ? 'text' : 'password'}
              value={mainData.curr_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="New Password"
              name='new_pass'
              type={showPass ? 'text' : 'password'}
              value={mainData.new_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Confirm Password"
              name='con_pass'
              type={showPass ? 'text' : 'password'}
              value={mainData.con_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <FormGroup>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={showPass}
                    onChange={handleTogglePasswordVisibility}
                    color="primary"
                  />
                }
                label="Show Password"
              />
            </FormGroup>
            <Stack sx={{ gridColumn: 'span 2' }} spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={handlePasswordChange}><Check /></Button>
            </Stack>
          </Box>
        </DialogContent>
      </Dialog>
    )
  };
  // eslint-disable-next-line
  const renderProDialog = () => {

    return (
      <Dialog
        maxWidth="md"
        PaperProps={{
          sx: {
            minWidth: dialogMinWidth,
          },
        }}
        open={openProfile}
        onClose={() => setOpenProfile(false)}
      >
        <DialogTitle>My Profile</DialogTitle>
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
              label="Username"
              name='username'
              value={mainData.username}
              onChange={handleChange}
            />
            <FormControl sx={{ minWidth: 120 }}>
              <InputLabel id="pro_img">Profile Photo</InputLabel>
              <Select
                labelId="pro_img"
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
            <TextField
              label="Full Name"
              name='name'
              value={mainData.name}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Email"
              name='email'
              value={mainData.email}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <Stack sx={{ gridColumn: 'span 2' }} spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={handleProChange}><Check /></Button>
            </Stack>
          </Box>
        </DialogContent>
      </Dialog>
    )
  };

  return (
    <>
      <StyledRoot>
        <StyledToolbar>
          <StyledAppbar>
            <IconButton
              onClick={onOpenNav}
              className="iconMenu"
              sx={{
                mr: 3,
                padding: 0,
                color: 'text.primary',
                display: { lg: 'none', md: 'block' },
              }}
            >
              <Iconify
                icon="pepicons-pop:menu"
                style={{ width: '1.8rem', height: '1.8rem' }}
              />
            </IconButton>
            <Typography variant="h4">
              {toProperCase(path)}
            </Typography>
          </StyledAppbar>

          <Box sx={{ flexGrow: 1 }} />
          <Stack
            direction="row"
            alignItems="center"
            spacing={{
              xs: 0.5,
              sm: 1,
            }}
          >
            <IconButton
              onClick={handleOpen}
              sx={{
                p: 0,
                ...(open && {
                  '&:before': {
                    zIndex: 1,
                    content: "''",
                    width: '100%',
                    height: '100%',
                    borderRadius: '50%',
                    position: 'absolute',
                    bgcolor: (theme) => alpha(theme.palette.grey[900], 0.8),
                  },
                }),
              }}
            >
              <Avatar src={`${getProdDevUrl()}/assets/img/${sharedState.userData.photo}`} alt="photoURL" >
                {sharedState.userData.name[0]}
              </Avatar>

            </IconButton>

            <Popover
              open={Boolean(open)}
              anchorEl={open}
              onClose={handleClose}
              anchorOrigin={{ vertical: 'bottom', horizontal: 'right' }}
              transformOrigin={{ vertical: 'top', horizontal: 'right' }}
              PaperProps={{
                sx: {
                  p: 0,
                  mt: 1.5,
                  ml: 0.75,
                  width: 180,
                  '& .MuiMenuItem-root': {
                    typography: 'body2',
                    borderRadius: 0.75,
                  },
                },
              }}
            >
              <Box sx={{ my: 1.5, px: 2.5 }}>
                <Typography variant="subtitle1" noWrap>
                  {sharedState.userData.name}
                </Typography>
              </Box>

              <Divider sx={{ borderStyle: 'dashed' }} />

              <MenuItem
                onClick={() => {
                  setOpenProfile(true)
                  setMainData(customUserData)
                  setSelectedFile(customUserData.photo)
                }}
                sx={{ m: 1 }}
              >
                Profile
              </MenuItem>
              <MenuItem
                onClick={() => {
                  setChangePassword(true)
                  setShowPass(false)
                }}
                sx={{ m: 1 }}
              >
                Change Password
              </MenuItem>

              <Divider sx={{ borderStyle: 'dashed' }} />
              <MenuItem onClick={viewSite} sx={{ m: 1 }}>
                View Site
              </MenuItem>
              <MenuItem onClick={userLogout} sx={{ m: 1 }}>
                Logout
              </MenuItem>

              <Portal>
                <Snackbar
                  anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
                  open={snackbarOpen}
                  autoHideDuration={3000}
                  onClose={() => setSnackbarOpen(false)}
                  message={snackbarMessage}
                />
              </Portal>

              {renderProDialog()}
              {renderPasswordDialog()}
            </Popover>
          </Stack>
        </StyledToolbar>
      </StyledRoot>
    </>
  );
}
