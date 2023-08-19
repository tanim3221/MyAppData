// import React from 'react';
// import { Navigate, useLocation } from 'react-router-dom';
// import MainLayout from '../../layouts/main';

// // eslint-disable-next-line
// const ProtectedMainLayout = ({ children }) => {

//     const isAuthenticated = sessionStorage.getItem('authToken');
//     const location = useLocation();

//   if (!isAuthenticated) {
//     sessionStorage.setItem("LoginMsg", "Please login to continue.");
//     sessionStorage.setItem("intendedPath", location.pathname);
//     return <Navigate to="/login" />;
//   }
//   return <MainLayout>{children}</MainLayout>;
// };

// export default ProtectedMainLayout;

import React, { useEffect, useState } from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import {CircularProgress} from '@mui/material';
import { tokenVerify } from '../../components/conn/api';
import MainLayout from '../../layouts/main';
import { useStateContext } from './StateProvider';

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

  if (isTokenValid === null) {
    // Display a circular loading indicator in the middle of the screen
    return (
      <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <CircularProgress />
      </div>
    );
  }
  if (isTokenValid) {
    // Token is valid, render the main layout
    return <MainLayout>{children}</MainLayout>;
  }
  // Token is not valid, navigate to login
  return <Navigate to="/login" />;
};

export default ProtectedMainLayout;
