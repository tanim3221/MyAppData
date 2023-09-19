import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Home from './pages/Home'; // Adjust path if needed
import Page404 from './pages/Page404'; // Adjust path if needed
import ShutDownPage from './pages/Maintenance'; // Adjust path if needed

function Router() {
  return (
    <Routes>
      <Route path="/" element={<Navigate to="/home" />} />
      <Route path="/home" element={<Home />} />
      <Route path="/maintenance" element={<ShutDownPage />} />
      <Route path="/404" element={<Page404 />} />
      <Route path="*" element={<Navigate to="/404" />} />
    </Routes>
  );
}

export default Router;
