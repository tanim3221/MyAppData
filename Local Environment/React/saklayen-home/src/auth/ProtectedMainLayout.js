
import React, { useEffect } from 'react';
import { useLocation, Outlet } from 'react-router-dom';
import { CircularProgress } from '@mui/material';
import { checkMaintenance } from './api';
import Home from '../pages/Home';
import './../styles';
import { useMaintenanceStatus } from './MaintenanceContext';
import ShutdownPage from '../pages/Maintenance';
import ErrorPage from '../pages/Page404';

const ProtectedMainLayout = ({ children }) => {
  const { maintenanceStatus, setMaintenanceStatus } = useMaintenanceStatus();

  const location = useLocation();

  useEffect(() => {     
    const checkMaintenanceMode = async () => {
      try {
        const data = await checkMaintenance({ table: 'personalinfo' });
        // console.log("value", data.value);
        if (data && data.value === '0') {
          setMaintenanceStatus('noMaintenance');
        } else {
          setMaintenanceStatus('maintenance');
        }
      } catch (error) {
        console.error('An error occurred:', error);
      }
    };

    checkMaintenanceMode();
  }, [setMaintenanceStatus, location.pathname]);

  // console.log("status", maintenanceStatus);

  switch (maintenanceStatus) {
    case 'loading':
      return (
        <div className='spinnerBarLoading'>
          <CircularProgress style={{ color: '#5e2fd6' }} />
        </div>
      );
    case 'noMaintenance':
      return (
        <>
          <Home>{children}</Home>
          <Outlet />
        </>
      );
    case 'maintenance':
      return (
        <ShutdownPage />
      );
    default:
      return (
        <ErrorPage />
      )
  }
};


export default ProtectedMainLayout;