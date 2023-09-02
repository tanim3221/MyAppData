import React, { useState, useEffect, useRef } from 'react';
import { Stack, IconButton, Container, CircularProgress, Typography, Box, InputAdornment, TextField, Snackbar } from '@mui/material';
import { styled } from '@mui/material/styles';
import { LoadingButton } from '@mui/lab';
import { useNavigate } from 'react-router-dom';
import PropTypes from 'prop-types';
import ReCAPTCHA from 'react-google-recaptcha';

import { userLogin } from '../auth/api';
import Iconify from '../components/iconify';

import { getProdDevUrl } from '../utils/commonFunction';

const StyledRoot = styled('div')(({ theme }) => ({
  [theme.breakpoints.up('md')]: {
    display: 'flex',
  },
}));

// eslint-disable-next-line 
const BackgroundOverlay = styled('div')(({ theme }) => ({
  position: 'absolute',
  top: 0,
  left: 0,
  width: '100%',
  height: '100%',
  backgroundImage: `url("${getProdDevUrl()}/assets/img/bg-08.svg")`,
  backgroundSize: 'cover',
  zIndex: -1,
}));

const ContentOverlay = styled('div')(({ theme }) => ({
  padding: theme.spacing(1),
  borderRadius: theme.spacing(3),
  backgroundColor: 'rgba(255, 255, 255, 0.9)',
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: '80%',

  [theme.breakpoints.up('xs')]: {
    width: '85%',
    padding: theme.spacing(3),
  },

  [theme.breakpoints.up('sm')]: {
    width: '60%',
    padding: theme.spacing(2),
  },

  [theme.breakpoints.up('md')]: {
    width: '45%',
    padding: theme.spacing(3),
  },

  [theme.breakpoints.up('lg')]: {
    width: '30%',
    padding: theme.spacing(3),
  },

}));

// eslint-disable-next-line 
const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: '400px',
  margin: 'auto',
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
}));
const HeadStyle = styled('div')(() => ({
  textAlign: 'center',
  fontSize: '4rem',
  fontWeight: 'bold',
  marginBottom: '3rem',
  letterSpacing: '.5rem'
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
  captchaRef,
  isCaptchaSuccessful,
  onRecaptchaChange,
  showPassword,
  setShowPassword
}) {

  return (
    <Container component="main" maxWidth='sm'>
      <Box
        sx={{
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

          <ReCAPTCHA
            sitekey={process.env.REACT_APP_GOOGLE_SITE_KEY}
            onChange={onRecaptchaChange}
            ref={captchaRef}
          />

          <ButtonStyle>
            <LoadingButton disabled={!isCaptchaSuccessful} fullWidth size="large" variant="contained" onClick={handleLogin}>
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
  const loggedIn = sessionStorage.getItem('authToken');
  const captchaRef = useRef(null);
  const [isCaptchaSuccessful, setIsCaptchaSuccess] = useState(false);
  const [captchaKey, setCaptchaKey] = useState('');

  LoginForm.propTypes = {
    handleLogin: PropTypes.func.isRequired,
    username: PropTypes.string.isRequired,
    setUsername: PropTypes.func.isRequired,
    password: PropTypes.string.isRequired,
    setPassword: PropTypes.func.isRequired,
    showPassword: PropTypes.bool.isRequired,
    isCaptchaSuccessful: PropTypes.bool.isRequired,
    captchaRef: PropTypes.object.isRequired,
    onRecaptchaChange: PropTypes.func.isRequired,
    setShowPassword: PropTypes.func.isRequired,
  };

  useEffect(() => {
    if (loggedIn) {
      navigate('/home');
    }
    const loginMsg = sessionStorage.getItem('LoginMsg');
    if (loginMsg) {
      setSnackbarOpen(true);
      setSnackbarMessage(loginMsg);
      // sessionStorage.clear();
    }
    // eslint-disable-next-line
  }, [navigate]);


  const onRecaptchaChange = (value) => {
    setIsCaptchaSuccess(true)
    setCaptchaKey(value);
  }

  const handleLogin = async () => {

    // console.log("Captcha value:", captchaKey);

    try {
      const requestData = {
        user: username,
        pass: password,
        captcha: captchaKey,
        secret: process.env.REACT_APP_GOOGLE_SECRET_KEY,
      };

      // console.log(requestData);

      const data = await userLogin(requestData);

      if (data.error === false) {
        sessionStorage.setItem('authToken', data.token);
        const intendedPath = sessionStorage.getItem('intendedPath');
        setSnackbarOpen(true);
        setSnackbarMessage(data.message);
        setTimeout(() => {
          if (intendedPath) {
            navigate(intendedPath, { replace: true });
          } else {
            navigate('/home', { replace: true });
          }
        }, 2000);

      } else {
        setSnackbarOpen(true);
        setSnackbarMessage(data.message);
      }
    } catch (error) {
      console.error('An error occurred:', error);
    }
  };

  if (loggedIn) {
    return (
      <>
        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
          <CircularProgress />
        </div>
        <Snackbar
          anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
          open={snackbarOpen}
          autoHideDuration={3000}
          onClose={() => setSnackbarOpen(false)}
          message={snackbarMessage}
        />
      </>
    )
  }

  return (
    <>
      <BackgroundOverlay />
      <StyledRoot>
        <Container maxWidth="xs">
          <ContentOverlay>
            <StyledContent>
              <HeadStyle>
                <Typography variant="h4">
                  LOGIN
                </Typography>
              </HeadStyle>
              <LoginForm username={username} onRecaptchaChange={onRecaptchaChange} isCaptchaSuccessful={isCaptchaSuccessful} captchaRef={captchaRef} password={password} handleLogin={handleLogin} showPassword={showPassword} setPassword={setPassword} setUsername={setUsername} setShowPassword={setShowPassword} />
            </StyledContent>
          </ContentOverlay>
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