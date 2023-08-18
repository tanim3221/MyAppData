import React from 'react';
import { Navigate } from 'react-router-dom';
import MainLayout from '../../layouts/main';

const ProtectedMainLayout = ({ children }) => {
    const isAuthenticated = localStorage.getItem('authToken');

  if (!isAuthenticated) {
    return <Navigate to="/login" />;
  }
  return <MainLayout>{children}</MainLayout>;
};

export default ProtectedMainLayout;
