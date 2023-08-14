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
import Others from './pages/Others';
import DashboardAppPage from './pages/DashboardAppPage';

// ----------------------------------------------------------------------

export default function Router() {
  const routes = useRoutes([
    {
      path: '/',
      element: <DashboardLayout />,
      children: [
        { element: <Navigate to="/my" />, index: true },
        { path: 'my', element: <DashboardAppPage /> },
        { path: 'about', element: <About /> },
        { path: 'education', element: <Education /> },
        { path: 'experience', element: <Experience /> },
        { path: 'certificate', element: <Certificate /> },
        { path: 'skill', element: <Skill /> },
        { path: 'others', element: <Others /> },
        { path: 'portfolio', element: <Portfolio /> },
      ],
    },
    {
      path: 'login',
      element: <LoginPage />,
    },
    {
      element: <SimpleLayout />,
      children: [
        { element: <Navigate to="/my" />, index: true },
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
