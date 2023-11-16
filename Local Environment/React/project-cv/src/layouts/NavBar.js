import React, { useEffect } from 'react';
import PropTypes from 'prop-types';
import { useLocation } from 'react-router-dom';
import { styled } from '@mui/material/styles';

import { Box, Drawer, Typography, List, ListItemText,ListItemIcon, ListItemButton } from '@mui/material';
import { Home, History, Search } from '@mui/icons-material';

// Custom hooks and components
import useResponsive from '../utils/UseResponsive';
import Scrollbar from '../utils/Scrollbar';
import { useStateContext } from '../auth/StateProvider';
import { NavLink as RouterLink } from 'react-router-dom';

const NAV_WIDTH = 280;

const navConfig = [
  {
    title: 'Home',
    path: '/home',
    icon: <Home />,
  },
  {
    title: 'Search',
    path: '/search',
    icon: <Search />,
  },
{
    title: 'History',
    path: '/history',
    icon: <History />,
  },
];

Nav.propTypes = {
  openNav: PropTypes.bool,
  onCloseNav: PropTypes.func,
};

const StyledNavItem = styled((props) => <ListItemButton disableGutters {...props} />)(({ theme }) => ({
  ...theme.typography.body2,
  height: 48,
  position: 'relative',
  textTransform: 'capitalize',
  color: theme.palette.text.secondary,
  borderRadius: theme.shape.borderRadius,
}));

const StyledNavItemIcon = styled(ListItemIcon)({
  width: 22,
  height: 22,
  color: 'inherit',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
});

export default function Nav({ openNav, onCloseNav }) {
  const { pathname } = useLocation();
  // eslint-disable-next-line
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
          Project CV
        </Typography>
      </Box>
      <Scrollbar sx={{ flexGrow: 1 }}>
        <List disablePadding sx={{ p: 1 }}>
          {navConfig.map((item) => (
            <NavItem key={item.title} item={item} />
          ))}
        </List>
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

function NavItem({ item }) {
  const { title, path, icon, info } = item;

  return (
    <StyledNavItem
      component={RouterLink}
      to={path}
      sx={{
        '&.active': {
          color: 'text.primary',
          bgcolor: 'action.selected',
          fontWeight: 'fontWeightBold',
        },
      }}
    >
      <StyledNavItemIcon>{icon && icon}</StyledNavItemIcon>

      <ListItemText disableTypography primary={title} />

      {info && info}
    </StyledNavItem>
  );
}
