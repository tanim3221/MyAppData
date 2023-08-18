import { useState,useEffect } from 'react';
import { Stack, IconButton,Container, Typography, InputAdornment, TextField, Snackbar } from '@mui/material';
import { styled } from '@mui/material/styles';
import { LoadingButton } from '@mui/lab';
import { useNavigate } from 'react-router-dom';

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
const HeadStyle = styled('div')(({ theme }) => ({
  textAlign: 'center',
  fontSize: '4rem',
  fontWeight: 'bold',
  marginBottom: '3rem',
}));

// eslint-disable-next-line
const ButtonStyle = styled('div')(({ theme }) => ({
  marginTop: '2rem',
}));


function LoginForm() {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState('');

  useEffect(() => {
    const loggedIn = localStorage.getItem('authToken');
    if (loggedIn) {
      navigate('/home');
    }
    const loginMsg = localStorage.getItem('LoginMsg');
    if (loginMsg) {
      setSnackbarOpen(true);
      setSnackbarMessage(loginMsg);
      setTimeout(() => {
        localStorage.clear();
        // window.location.reload();
      }, 3000);
    }
  }, []);

  const handleLogin = async () => {
    try {
      const requestData = {
        user: username,
        pass: password,
      };

      const data = await userLogin(requestData);

      if (data.token) {
        localStorage.setItem('authToken', data.token);
        setTimeout(() => {
          navigate('/home');
        }, 3000)
        setSnackbarOpen(true);
        setSnackbarMessage('Login successful.');
        console.log('Login successful:', data.token);
      } else {
        // Handle error response
        console.error('Login failed:', data.error);
        setSnackbarOpen(true);
        setSnackbarMessage('Error from PHP server. Please check console log');
      }
    } catch (error) {
      console.error('An error occurred:', error);
    }
  };

  return (
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
      <Snackbar
        anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
        open={snackbarOpen}
        autoHideDuration={3000}
        onClose={() => setSnackbarOpen(false)}
        message={snackbarMessage}
      />
    </Stack>
  );
}

export default function LoginPage() {

  return (
    <>
      <StyledRoot>
        <Container maxWidth="sm">
          <StyledContent>
            <HeadStyle>
            <Typography variant="h4" gutterBottom>
              Login | Saklayen Ahmed
            </Typography>
            </HeadStyle>
            <LoginForm />
          </StyledContent>
        </Container>
      </StyledRoot>
    </>
  );
}

