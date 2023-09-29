
import React, { useEffect } from 'react';
import { Navigate, useLocation, Outlet } from 'react-router-dom';
import { CircularProgress } from '@mui/material';
import { checkMaintenance } from './api';
import Home from '../pages/Home';
import '../styles';
import { useMaintenanceStatus } from './MaintenanceContext';


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
        <div className='spinnerBar'>
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
      return <Navigate to="/maintenance" />;
    default:
      return <Navigate to="/not-found" />;
  }
};


export default ProtectedMainLayout;