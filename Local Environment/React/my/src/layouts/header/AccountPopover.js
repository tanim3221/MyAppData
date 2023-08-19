import { useState, useEffect } from 'react';
import { alpha } from '@mui/material/styles';
import { Box, Divider, Typography, Stack, MenuItem, Avatar, IconButton, Popover } from '@mui/material';
import { useNavigate } from 'react-router-dom';

import { fetchData } from '../../components/conn/api';

import navConfig from '../nav/Navitem';

export default function AccountPopover() {
  const [open, setOpen] = useState(null);

  const [data, setData] = useState([]);

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setData(responseData.saklayen.personalinfo[0]);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  const navigate = useNavigate();
  const handleUrl = (url) => {
    navigate(url);
  };
  const handleOpen = (event) => {
    setOpen(event.currentTarget);
  };

  const handleClose = () => {
    setOpen(null);
  };

  const userLogout = () => {
    sessionStorage.removeItem('authToken');
    sessionStorage.setItem('LoginMsg', 'Goodbye for now! You\'ve been logged out.');
    navigate('/login');
  }

  return (
    <>
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
        <Avatar src={`http://localhost:8080/saklayen/assets/img/${data.photo}`} alt="photoURL" />

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
          <Typography variant="subtitle2" noWrap>
            {data.name}
          </Typography>
        </Box>

        <Divider sx={{ borderStyle: 'dashed' }} />

        <Stack sx={{ p: 1 }}>
          {navConfig.map((option) => (
            <MenuItem key={option.title} onClick={() => handleUrl(option.path)}>
              {option.title}
            </MenuItem>
          ))}
        </Stack>

        <Divider sx={{ borderStyle: 'dashed' }} />

        <MenuItem onClick={userLogout} sx={{ m: 1 }}>
          Logout
        </MenuItem>
      </Popover>
    </>
  );
}
