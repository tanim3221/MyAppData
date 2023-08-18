import React, { useState, useEffect } from 'react';
import { Stack, IconButton, Container, Typography, Box, InputAdornment, TextField, Snackbar } from '@mui/material';
import { styled } from '@mui/material/styles';
import { LoadingButton } from '@mui/lab';
import { useNavigate } from 'react-router-dom';
import PropTypes from 'prop-types';

import { userLogin } from '../components/conn/api';
import Iconify from '../components/iconify';

const StyledRoot = styled('div')(({ theme }) => ({
  [theme.breakpoints.up('md')]: {
    display: 'flex',
  },
}));

const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: 480,
  margin: 'auto',
  minHeight: '100vh',
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  padding: theme.spacing(12, 0),
}));
const HeadStyle = styled('div')(() => ({
  textAlign: 'center',
  fontSize: '4rem',
  fontWeight: 'bold',
  marginBottom: '3rem',
}));

// eslint-disable-next-line
const ButtonStyle = styled('div')(() => ({
  marginTop: '2rem',
}));


function LoginForm({
  handleLogin,
  username,
  setUsername,
  password,
  setPassword,
  showPassword,
  setShowPassword
}) {

  return (
    <Container component="main" maxWidth="xs">
      <Box
        sx={{
          marginTop: '.5rem',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        }}
      >
    <Stack spacing={3}>
      <TextField
        name="username"
        label="User Name"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />

      <TextField
        name="password"
        label="Password"
        type={showPassword ? 'text' : 'password'}
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        InputProps={{
          endAdornment: (
            <InputAdornment position="end">
              <IconButton onClick={() => setShowPassword(!showPassword)} edge="end">
                <Iconify icon={showPassword ? 'eva:eye-fill' : 'eva:eye-off-fill'} />
              </IconButton>
            </InputAdornment>
          ),
        }}
      />

      <ButtonStyle>
        <LoadingButton fullWidth size="large" variant="contained" onClick={handleLogin}>
          Login
        </LoadingButton>
      </ButtonStyle>
    </Stack>
    </Box>
    </Container>
  );
}

export default function LoginPage() {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');


  LoginForm.propTypes = {
    handleLogin: PropTypes.func.isRequired,
    username: PropTypes.string.isRequired,
    setUsername: PropTypes.func.isRequired,
    password: PropTypes.string.isRequired,
    setPassword: PropTypes.func.isRequired,
    showPassword: PropTypes.bool.isRequired,
    setShowPassword: PropTypes.func.isRequired,
  };

  useEffect(() => {
    const loggedIn = localStorage.getItem('authToken');
    if (loggedIn) {
      navigate('/home');
    }
    const loginMsg = localStorage.getItem('LoginMsg');
    if (loginMsg) {
      setSnackbarOpen(true);
      setSnackbarMessage(loginMsg);
    }
  }, [navigate]);

  const handleLogin = async () => {
    try {
      const requestData = {
        user: username,
        pass: password,
      };

      const data = await userLogin(requestData);

      if (data.error===false) {
        localStorage.setItem('authToken', data.token);
        const intendedPath = localStorage.getItem('intendedPath');
        setTimeout(() => {
          if (intendedPath) {
            navigate(intendedPath, { replace: true });
          } else {
            navigate('/home', { replace: true });
          }
        }, 3000);
        setSnackbarOpen(true);
        setSnackbarMessage(data.message);
      } else {
        setSnackbarOpen(true);
        setSnackbarMessage(data.message);
      }
    } catch (error) {
      console.error('An error occurred:', error);
    }
  };

  return (
    <>
      <StyledRoot>
        <Container maxWidth="sm">
          <StyledContent>
            <HeadStyle>
              <Typography variant="h4">
                Login
              </Typography>
              <Typography variant="h3">
                Saklayen Ahmed
              </Typography>
            </HeadStyle>
            <LoginForm handleLogin={handleLogin} showPassword={showPassword} setPassword={setPassword} setUsername={setUsername} setShowPassword={setShowPassword} />
          </StyledContent>
        </Container>
        <Snackbar
          anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
          open={snackbarOpen}
          autoHideDuration={3000}
          onClose={() => setSnackbarOpen(false)}
          message={snackbarMessage}
        />
      </StyledRoot>
    </>
  );
}

