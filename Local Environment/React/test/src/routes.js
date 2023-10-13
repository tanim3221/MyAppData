import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Google from './pages/Google';
import Home from './pages/Homev2';
import Decode from './pages/Decode';

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Navigate to="/home" />} />
      <Route path="/home" element={<Home/>} /> 
      <Route path="/decode" element={<Decode/>} /> 
      <Route path="/google" element={<Google />} />
    </Routes>
  );
}

export default AppRoutes;
