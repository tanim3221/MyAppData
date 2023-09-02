import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import { useLocation } from 'react-router-dom';
import { Box, Drawer, Typography } from '@mui/material';
import { Home, Public, Interests, Message, SupportAgent, GTranslate, HistoryEdu, Celebration, ConnectWithoutContact, InsertEmoticon, School, Image, Work, CardMembership, FolderSpecial, CastForEducation } from '@mui/icons-material';

// Custom hooks and components
import useResponsive from '../hooks/useResponsive';
import Scrollbar from '../components/scrollbar';
import NavSection from '../components/nav-section';
import { useStateContext } from '../auth/StateProvider';

const NAV_WIDTH = 280;

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
    icon: <HistoryEdu />,
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
  }, {
    title: 'Social Link',
    path: '/social',
    icon: <ConnectWithoutContact />,
  }, {
    title: 'Contact Message',
    path: '/messages',
    icon: < Message />,
  }
  , {
    title: 'Web Visitors',
    path: '/visitors',
    icon: < Public />,
  },
];

Nav.propTypes = {
  openNav: PropTypes.bool,
  onCloseNav: PropTypes.func,
};

export default function Nav({ openNav, onCloseNav }) {
  const { pathname } = useLocation();
  const { sharedState } = useStateContext();
  const isDesktop = useResponsive('up', 'lg');

  useEffect(() => {
    if (openNav) {
      onCloseNav();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pathname]);

  const renderContent = (
    <Box sx={{ height: 1, display: 'flex', flexDirection: 'column' }}>
      <Box sx={{ px: 2.5, py: 3, display: 'inline-flex' }}>
        <Typography variant="h4" sx={{ color: 'text.primary' }}>
          {sharedState.userData.name}
        </Typography>
      </Box>
      <Scrollbar sx={{ flexGrow: 1 }}>
        <NavSection data={navConfig} />
      </Scrollbar>
    </Box>
  );

  return (
    <Box
      component="nav"
      sx={{
        flexShrink: { lg: 0 },
        width: { lg: NAV_WIDTH },
      }}
    >
      <Drawer
        open={isDesktop || openNav}
        onClose={onCloseNav}
        variant={isDesktop ? 'permanent' : 'temporary'}
        ModalProps={{
          keepMounted: true,
        }}
        PaperProps={{
          sx: { width: NAV_WIDTH },
        }}
      >
        {renderContent}
      </Drawer>
    </Box>
  );
}
