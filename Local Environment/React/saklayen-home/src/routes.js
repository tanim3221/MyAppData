import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Home from './pages/Home';
import HomeSection from './pages/sections/HomeSection';
import AboutContent from './pages/sections/AboutSection';
import Page404 from './pages/Page404';
import ShutDownPage from './pages/Maintenance';
import ContactContent from './pages/sections/ContactSection';
import Portfolio from './pages/sections/PortfolioSection';

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Home />}>
        <Route index element={<Navigate to="/home" />} />
        <Route path="home" element={<HomeSection />} />
        <Route path="about" element={<AboutContent />} />
        <Route path="contact" element={<ContactContent />} />
        <Route path="maintenance" element={<ShutDownPage />} />
        <Route path="portfolio" element={<Portfolio />} />
      </Route>
      <Route path="not-found" element={<Page404 />} />
      <Route path="*" element={<Navigate to="/not-found" />} />
    </Routes>
  );
}

export default AppRoutes;
