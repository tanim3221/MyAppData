import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import {CircularProgress} from '@mui/material';
import { tokenVerify } from './api';
import MainLayout from '../layouts/MainLayout';
import { useStateContext } from './StateProvider';
import LoginPage from '../pages/LoginPagev2';

// eslint-disable-next-line
const ProtectedMainLayout = ({ children }) => {
  const [isTokenValid, setIsTokenValid] = useState(null);
  const { setSharedState } = useStateContext();
  const loggedinToken = sessionStorage.getItem('authToken');
  const location = useLocation();

  useEffect(() => {
    const verifyToken = async () => {
      try {
        const data = await tokenVerify({ token: loggedinToken });

        if (data.response === 200) {
          setIsTokenValid(true);
          setSharedState({ userData: data});
          // console.log(data);
        } else {
          sessionStorage.setItem(
            'LoginMsg',
            'Token expired. Please login again.'
          );
          sessionStorage.removeItem('authToken');
          sessionStorage.setItem('intendedPath', location.pathname);
          setIsTokenValid(false);
        }
      } catch (error) {
        console.error('An error occurred:', error);
      }
    };

    verifyToken();
    // eslint-disable-next-line
  }, [loggedinToken, location.pathname]);

  switch(isTokenValid){
    case true:
      return(
        <MainLayout>{children}</MainLayout>
      )
    case false:
      return(
        <LoginPage/>
      )
    case null:
      return (
        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
          <CircularProgress />
        </div>
      );
    default:
      return(
        <LoginPage/>
      )
  }
};

export default ProtectedMainLayout;
