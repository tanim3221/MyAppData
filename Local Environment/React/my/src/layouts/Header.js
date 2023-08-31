import { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import { styled } from '@mui/material/styles';
import { Box, Stack, AppBar, Dialog, DialogContent, Button, DialogTitle, TextField, Toolbar, IconButton, Typography, Divider, MenuItem, Avatar, Popover, Portal, useMediaQuery, Snackbar } from '@mui/material';
import { useLocation, useNavigate } from 'react-router-dom';
import { Check } from '@mui/icons-material'


import { bgBlur } from '../utils/cssStyles';
import Iconify from '../components/iconify';
import { getProdDevUrl } from '../utils/commonFunction';
import { fetchData, changePasswordData } from '../auth/api';


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
  const loggedInToken = sessionStorage.getItem('authToken');
  const [open, setOpen] = useState(null);
  const [data, setData] = useState([]);
  const [changePassword, setChangePassword] = useState(false);
  const [passwordData, setPasswordData] = useState([]);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');


  const location = useLocation();
  const path = location.pathname.split('/')[1];
  const navigate = useNavigate();

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.personalinfo[0]);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  const handleChange = (event) => {
    const { name, value } = event.target;
    setPasswordData((prevEdu) => ({
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
  };

  const TABLE_NAME = "users";

  const handlePasswordChange = () => {
    const requestData = {
      table: TABLE_NAME,
      data: passwordData,
      token: loggedInToken
    };

    // console.log(requestData);

    changePasswordData(requestData)
      .then(response => {
        setSnackbarMessage(response.message);
        setSnackbarOpen(true);
        if (!response.error) {
          setChangePassword(false);
          setPasswordData([]);
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
    navigate('/login');
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
              value={passwordData.curr_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="New Password"
              name='new_pass'
              value={passwordData.new_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <TextField
              label="Confirm Password"
              name='con_pass'
              value={passwordData.con_pass}
              sx={{ gridColumn: 'span 2' }}
              onChange={handleChange}
            />
            <Stack sx={{ gridColumn: 'span 2' }} spacing={2} direction="row" style={{ marginTop: '20px' }} justifyContent="flex-end">
              <Button variant="outlined" onClick={handleClose}>Close</Button>
              <Button variant="contained" onClick={handlePasswordChange}><Check /></Button>
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
                    // bgcolor: (theme) => alpha(theme.palette.grey[900], 0.8),
                  },
                }),
              }}
            >
              <Avatar src={`${getProdDevUrl()}/assets/img/${data.photo}`} alt="photoURL" />

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
                  {data.name}
                </Typography>
              </Box>

              <Divider sx={{ borderStyle: 'dashed' }} />

              <MenuItem
                onClick={() => setChangePassword(true)}
                sx={{ m: 1 }}
              >
                Change Password
              </MenuItem>

              <Divider sx={{ borderStyle: 'dashed' }} />

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

              {renderPasswordDialog()}
            </Popover>
          </Stack>
        </StyledToolbar>
      </StyledRoot>
    </>
  );
}
