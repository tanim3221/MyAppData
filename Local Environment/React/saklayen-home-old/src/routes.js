import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import HomeSection from './pages/sections/HomeSection';
import AboutContent from './pages/sections/AboutSection';
import Page404 from './pages/Page404';
import ShutDownPage from './pages/Maintenance';
import ContactContent from './pages/sections/ContactSection';
import Portfolio from './pages/sections/PortfolioSection';
import QualificationSection from './pages/sections/QualificationSection';
import ProtectedMainLayout from './auth/ProtectedMainLayout';
import { useMaintenanceStatus } from './auth/MaintenanceContext';

function AppRoutes() {
  const { maintenanceStatus } = useMaintenanceStatus();
  return (
    <Routes>
      <Route path="/" element={<ProtectedMainLayout />}>
        <Route index element={<Navigate to="/home" />} />
        <Route path="home" element={<HomeSection />} />
        <Route path="about" element={<AboutContent />} />
        <Route path="contact" element={<ContactContent />} />
        <Route path="qualifications" element={<QualificationSection />} />
        <Route path="portfolio" element={<Portfolio />} />
      </Route>
      {/* <Route path="error" element={<Page404 />} /> */}
      {/* <Route path="maintenance" element={maintenanceStatus === 'maintenance' ? <ShutDownPage /> : <Navigate to="/home" />} /> */}
      <Route path="*" element={<Page404 />} />
      {/* <Route path="*" element={<Navigate to="/error" />} /> */}
    </Routes>
  );
}

export default AppRoutes;
