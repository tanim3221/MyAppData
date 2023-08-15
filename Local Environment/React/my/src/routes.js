import { Navigate, useRoutes } from 'react-router-dom';
// layouts
import DashboardLayout from './layouts/dashboard';
import SimpleLayout from './layouts/simple';
//
import LoginPage from './pages/LoginPage';
import Page404 from './pages/Page404';
import About from './pages/About';
import Education from './pages/Education';
import Experience from './pages/Experience';
import Portfolio from './pages/Portfolio';
import Skill from './pages/Skill';
import Certificate from './pages/Certificate';
import Attributes from './pages/Attributes';
import Interests from './pages/Interests';
import Funfacts from './pages/Funfacts';
import Languages from './pages/Languages';
import Contact from './pages/Contact';
import Serivces from './pages/Services';
import Social from './pages/Social';
import DashboardAppPage from './pages/Home';
import Visitors from './pages/Visitors';

// ----------------------------------------------------------------------

export default function Router() {
  const routes = useRoutes([
    {
      path: '/',
      element: <DashboardLayout />,
      children: [
        { element: <Navigate to="/home" />, index: true },
        { path: 'home', element: <DashboardAppPage /> },
        { path: 'about-me', element: <About /> },
        { path: 'education', element: <Education /> },
        { path: 'experiences', element: <Experience /> },
        { path: 'certifications', element: <Certificate /> },
        { path: 'skills', element: <Skill /> },
        { path: 'portfolios', element: <Portfolio /> },
        { path: 'interests', element: <Interests /> },
        { path: 'funfacts', element: <Funfacts /> },
        { path: 'attributes', element: <Attributes /> },
        { path: 'services', element: <Serivces /> },
        { path: 'languages', element: <Languages /> },
        { path: 'messages', element: <Contact /> },
        { path: 'social', element: <Social /> },
        { path: 'visitors', element: <Visitors /> },
      ],
    },
    {
      path: 'login',
      element: <LoginPage />,
    },
    {
      element: <SimpleLayout />,
      children: [
        { element: <Navigate to="/home" />, index: true },
        { path: '404', element: <Page404 /> },
        { path: '*', element: <Navigate to="/404" /> },
      ],
    },
    {
      path: '*',
      element: <Navigate to="/404" replace />,
    },
  ]);

  return routes;
}
