
import React from 'react';
import { Navigate, Route, Routes } from 'react-router-dom';
import LoginPage from './pages/LoginPage';
import Page404 from './pages/Page404';
import Home from './pages/Home';
import ProtectedMainLayout from './auth/ProtectedMainLayout';


export default function Router() {
  return (
    <Routes>
      <Route path="/" element={<ProtectedMainLayout />}>
        <Route index element={<Navigate to="/home" />} />
        <Route path="home" element={<Home/>} />
      </Route>
      <Route path="login" element={<LoginPage />} />
      <Route path="404" element={<Page404 />} />
      <Route path="*" element={<Navigate to="/404" />} />
    </Routes>
  );
}