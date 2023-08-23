import React from 'react';
import { Home, Public,Interests,Message,SupportAgent,GTranslate,HistoryEdu,Celebration, ConnectWithoutContact, InsertEmoticon, School, Image, Work, CardMembership, FolderSpecial, CastForEducation } from '@mui/icons-material';


const navConfig = [
  {
    title: 'Home',
    path: '/home',
    icon: <Home />,
  },
  {
    title: 'About Me',
    path: '/about-me',
    icon: <InsertEmoticon />,
  },
  {
    title: 'Education',
    path: '/education',
    icon: <School />,
  },
  {
    title: 'Media',
    path: '/media-list',
    icon: <Image />,
  },
  {
    title: 'Experiance',
    path: '/experiences',
    icon: <Work />,
  },
  {
    title: 'Certifications',
    path: '/certifications',
    icon: <CardMembership />,
  },
  {
    title: 'Skills',
    path: '/skills',
    icon: <CastForEducation />,
  },
{
    title: 'Portfolio',
    path: '/portfolios',
    icon: <FolderSpecial />,
  },
{
    title: 'Attributes',
    path: '/attributes',
    icon: <HistoryEdu/>,
  },
 {
    title: 'Interests',
    path: '/interests',
    icon: <Interests />,
  },
  {
    title: 'Funfacts',
    path: '/funfacts',
    icon: <Celebration />,
  },
{
    title: 'Services',
    path: '/services',
    icon: <SupportAgent />,
  },
{
    title: 'Languages',
    path: '/languages',
    icon: <GTranslate />,
  },{
    title: 'Social Link',
    path: '/social',
    icon: <ConnectWithoutContact />,
  },{
    title: 'Contact Message',
    path: '/messages',
    icon: < Message />,
  }
,{
    title: 'Web Visitors',
    path: '/visitors',
    icon: < Public />,
  },
];

export default navConfig;
