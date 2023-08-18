
import React from 'react';
import { Navigate, Route, Routes } from 'react-router-dom';
import MainLayout from './layouts/main';
import LoginPage from './pages/LoginPage';
import Page404 from './pages/Page404';
import ProtectedLogin from './sections/auth/ProtectedLogin';
import Home from './pages/Home';
import About from './pages/About';
import Education from './pages/Education';
import Experience from './pages/Experience';
import Certificate from './pages/Certificate';
import Skill from './pages/Skill';
import Portfolio from './pages/Portfolio';
import Interests from './pages/Interests';
import Funfacts from './pages/Funfacts';
import Attributes from './pages/Attributes';
import Services from './pages/Services';
import Languages from './pages/Languages';
import Contact from './pages/Contact';
import Social from './pages/Social';
import Visitors from './pages/Visitors';

export default function Router() {
  return (
    <Routes>
      <Route path="/" element={<MainLayout />}>
        <Route index element={<Navigate to="/login" />} />
        <Route path="home" element={<ProtectedLogin Component={Home} path="/home" />} />
        <Route path="about-me" element={<ProtectedLogin Component={About} path="/about-me" />} />
        <Route path="education" element={<ProtectedLogin Component={Education} path="/education" />} />
        <Route path="experiences" element={<ProtectedLogin Component={Experience} path="/experiences" />} />
        <Route path="certifications" element={<ProtectedLogin Component={Certificate} path="/certifications" />} />
        <Route path="skills" element={<ProtectedLogin Component={Skill} path="/skills" />} />
        <Route path="portfolios" element={<ProtectedLogin Component={Portfolio} path="/portfolios" />} />
        <Route path="interests" element={<ProtectedLogin Component={Interests} path="/interests" />} />
        <Route path="funfacts" element={<ProtectedLogin Component={Funfacts} path="/funfacts" />} />
        <Route path="attributes" element={<ProtectedLogin Component={Attributes} path="/attributes" />} />
        <Route path="services" element={<ProtectedLogin Component={Services} path="/services" />} />
        <Route path="languages" element={<ProtectedLogin Component={Languages} path="/languages" />} />
        <Route path="messages" element={<ProtectedLogin Component={Contact} path="/messages" />} />
        <Route path="social" element={<ProtectedLogin Component={Social} path="/social" />} />
        <Route path="visitors" element={<ProtectedLogin Component={Visitors} path="/visitors" />} />
      </Route>
      <Route path="login" element={<LoginPage />} />
      <Route path="404" element={<Page404 />} />
      <Route path="*" element={<Navigate to="/404" />} />
    </Routes>
  );
}


// import { Navigate, useRoutes } from 'react-router-dom';

// import MainLayout from './layouts/main';
// import LoginPage from './pages/LoginPage';
// import Page404 from './pages/Page404';
// import About from './pages/About';
// import Education from './pages/Education';
// import Experience from './pages/Experience';
// import Portfolio from './pages/Portfolio';
// import Skill from './pages/Skill';
// import Certificate from './pages/Certificate';
// import Attributes from './pages/Attributes';
// import Interests from './pages/Interests';
// import Funfacts from './pages/Funfacts';
// import Languages from './pages/Languages';
// import Contact from './pages/Contact';
// import Serivces from './pages/Services';
// import Social from './pages/Social';
// import Visitors from './pages/Visitors';
// import Home from './pages/Home';
// import ProtectedLogin from './sections/auth/ProtectedLogin';


// export default function Router() {
//   const routes = useRoutes([
//     {
//       path: '/',
//       element: <MainLayout />,
//       children: [
//         { element: <Navigate to="/login" />, index: true },
//         { path: 'home', element: <ProtectedLogin Component={Home} /> },
//         { path: 'about-me', element: <ProtectedLogin Component={About} /> },
//         { path: 'education', element: <Education /> },
//         { path: 'experiences', element: <Experience /> },
//         { path: 'certifications', element: <Certificate /> },
//         { path: 'skills', element: <Skill /> },
//         { path: 'portfolios', element: <Portfolio /> },
//         { path: 'interests', element: <Interests /> },
//         { path: 'funfacts', element: <Funfacts /> },
//         { path: 'attributes', element: <Attributes /> },
//         { path: 'services', element: <Serivces /> },
//         { path: 'languages', element: <Languages /> },
//         { path: 'messages', element: <Contact /> },
//         { path: 'social', element: <Social /> },
//         { path: 'visitors', element: <Visitors /> },
//       ],
//     },
//     {
//       path: 'login',
//       element: <LoginPage />,
//     },
//     {
      
//       children: [
//         { element: <Navigate to="/login" />, index: true },
//         { path: '404', element: <Page404 /> },
//         { path: '*', element: <Navigate to="/404" /> },
//       ],
//     },
//     {
//       path: '*',
//       element: <Navigate to="/404" replace />,
//     },
//   ]);

//   return routes;
// }