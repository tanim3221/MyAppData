import { useState } from 'react';
import { Stack, IconButton, InputAdornment, TextField } from '@mui/material';
import { styled } from '@mui/material/styles';
import { LoadingButton } from '@mui/lab';
import { useNavigate } from 'react-router-dom';

import { userLogin } from '../../../components/conn/api';
import Iconify from '../../../components/iconify';

// eslint-disable-next-line
const ButtonStyle = styled('div')(({ theme }) => ({
  marginTop: '2rem',
}));

export default function LoginForm() {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = async () => {
    try {
      const requestData = {
        user: username,
        pass: password,
      };

      const data = await userLogin(requestData);

      if (data.token) {
        localStorage.setItem('authToken', data.token);
        setIsLoggedIn(true);
        navigate('/home');
        console.log('Login successful:', data.token);
      } else {
        // Handle error response
        console.error('Login failed:', data.error);
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
    </Stack>
  );
}
