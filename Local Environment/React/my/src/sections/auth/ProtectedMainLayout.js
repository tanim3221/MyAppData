import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import MainLayout from '../../layouts/main';

const ProtectedMainLayout = ({ children }) => {
    const isAuthenticated = localStorage.getItem('authToken');
    const location = useLocation();

  if (!isAuthenticated) {
    localStorage.setItem("LoginMsg", "Please login to continue.");
    localStorage.setItem("intendedPath", location.pathname);
    return <Navigate to="/login" />;
  }
  return <MainLayout>{children}</MainLayout>;
};

export default ProtectedMainLayout;
