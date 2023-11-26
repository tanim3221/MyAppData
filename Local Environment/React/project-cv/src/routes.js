
import React from 'react';
import { Navigate, Route, Routes } from 'react-router-dom';
import LoginPagev2 from './pages/LoginPagev2';
import Page404 from './pages/Page404';
import Search from './pages/HomeSearchv3';
import Home from './pages/HomeGrid';
import Analysis from './pages/Analysis';
import Years from './pages/Years';
import YearsView from './pages/YearsView';
import History from './pages/History';
import ProtectedMainLayout from './auth/ProtectedMainLayout';


export default function Router() {
  return (
    <Routes>
      <Route path="/" element={<ProtectedMainLayout />}>
        <Route index element={<Navigate to="/home" />} />
        <Route path="home" element={<Home/>} />
        <Route path="search" element={<Search/>} />
        <Route path="years" element={<Years/>} >
          <Route path=":yearsrange" element={<YearsView />} />
        </Route>
        <Route path="analysis" element={<Analysis/>} />
        <Route path="history" element={<History/>} />
      </Route>
      <Route path="login" element={<LoginPagev2 />} />
      <Route path="404" element={<Page404 />} />
      <Route path="*" element={<Navigate to="/404" />} />
    </Routes>
  );
}