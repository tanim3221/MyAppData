// component
import React from 'react';
import { AddHome, AccountCircle, School, Work, CardMembership, ModeStandby, FolderSpecial, NavigateNext } from '@mui/icons-material';
// ----------------------------------------------------------------------
const navConfig = [
  {
    title: 'Home',
    path: '/',
    icon: <AddHome />,
  },
  {
    title: 'About Me',
    path: '/about',
    icon: <AccountCircle />,
  },
  {
    title: 'Education',
    path: '/education',
    icon: <School />,
  },
  {
    title: 'Experiance',
    path: '/experience',
    icon: <Work />,
  },
  {
    title: 'Certifications',
    path: '/certificate',
    icon: <CardMembership />,
  },
  {
    title: 'Skills',
    path: '/skill',
    icon: <ModeStandby />,
  },
{
    title: 'Portfolio',
    path: '/portfolio',
    icon: <FolderSpecial />,
  },
{
    title: 'Others',
    path: '/others',
    icon: <NavigateNext />,
  },
];

export default navConfig;
