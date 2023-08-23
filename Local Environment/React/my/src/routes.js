
import React from 'react';
import { Navigate, Route, Routes } from 'react-router-dom';
import LoginPage from './pages/LoginPage';
import Page404 from './pages/Page404';
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
import ProtectedMainLayout from './sections/auth/ProtectedMainLayout';
import Media from './pages/Media';

export default function Router() {
  return (
    <Routes>
      <Route path="/" element={<ProtectedMainLayout />}>
        <Route index element={<Navigate to="/login" />} />
        <Route path="home" element={<Home/>} />
        <Route path="about-me" element={<About />} />
        <Route path="education" element={<Education/>} />
        <Route path="experiences" element={<Experience />} />
        <Route path="certifications" element={<Certificate />} />
        <Route path="skills" element={<Skill />} />
        <Route path="portfolios" element={<Portfolio/>} />
        <Route path="interests" element={<Interests/>} />
        <Route path="funfacts" element={<Funfacts />} />
        <Route path="attributes" element={<Attributes />} />
        <Route path="services" element={<Services/>} />
        <Route path="languages" element={<Languages />} />
        <Route path="messages" element={<Contact />} />
        <Route path="social" element={<Social />} />
        <Route path="visitors" element={<Visitors />} />
        <Route path="media-list" element={<Media />} />
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
//         { path: 'home', element: <Home} /> },
//         { path: 'about-me', element: <About} /> },
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