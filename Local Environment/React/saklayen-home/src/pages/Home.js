import React, { useState } from 'react';
import { Container, Box, Grid, IconButton,Typography, Drawer, useMediaQuery, useTheme, ListItem, ListItemIcon, ListItemText, List } from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu';
import HomeIcon from '@mui/icons-material/Home';
import SettingsIcon from '@mui/icons-material/Settings';
import NotificationsIcon from '@mui/icons-material/Notifications';

function Sidebar() {
  const items = [
    { label: 'Home', icon: <HomeIcon /> },
    { label: 'Settings', icon: <SettingsIcon /> },
    { label: 'Notifications', icon: <NotificationsIcon /> },
  ];

  return (
    <Box bgcolor="grey.200" height="100vh" display="flex" alignItems="center" justifyContent="flex-start" flexDirection="column" position="fixed" top="0">
      <List>
        {items.map((item, index) => (
          <ListItem button key={index} alignItems="center" sx={{ flexDirection: 'column' }}>
            <ListItemIcon>{item.icon}</ListItemIcon>
            <ListItemText primary={item.label} sx={{ mt: 1 }} />
          </ListItem>
        ))}
      </List>
    </Box>
  );
}

function Profile() {
  return (
    <Box
      sx={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        mt: 8,
        position: 'fixed',
        left: '10%',
        top: '20px'  // Reduced margin since AppBar is removed
      }}
    >
      <Typography component="h1" variant="h4">
        Saklayen Ahmed
      </Typography>
      <Typography component="h2" variant="h6" color="textSecondary">
        Audit Professional
      </Typography>
    </Box>
  );
}

function Home() {
  const [drawerOpen, setDrawerOpen] = useState(false);
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));

  const toggleDrawer = () => {
    setDrawerOpen(!drawerOpen);
  };

  return (
    <Container
      style={{
        padding: '0',
        height: '100vh',
        overflowY: 'auto'
      }}
      component="main"
      maxWidth={false}
    >
      {isMobile && (
        <>
          <IconButton edge="start" color="inherit" onClick={toggleDrawer} sx={{ marginRight: 2, position: 'fixed', top: 15, left: 15 }}>
            <MenuIcon />
          </IconButton>
          <Drawer open={drawerOpen} onClose={toggleDrawer}>
            <Profile />
            <Box bgcolor="grey.200" width={250}>
              <Sidebar />
            </Box>
          </Drawer>
        </>
      )}

      <Grid container spacing={0}>
        {!isMobile && (
          <Grid item xs={1} style={{ position: 'fixed', height: '100vh', left: 0 }}>
            <Sidebar />
          </Grid>
        )}
        {!isMobile && (
          <Grid item xs={3} style={{ position: 'fixed', height: '100vh', left: 'calc(10% + 250px)' }}>
            <Profile />
            <Box mt={5} textAlign="center" position="fixed" bottom={20} left="10%">
              &copy; 2023 Saklayen Ahmed. All rights reserved.
            </Box>
          </Grid>
        )}
        <Grid
          item
          xs={isMobile ? 12 : 8}
          style={{
            marginLeft: isMobile ? 0 : 'calc(10% + 250px + 400px)',
            overflowY: 'visible',
            height: '100vh'
          }}
        >
          <Box
            bgcolor="grey.100"
            height="100%"
            pt={isMobile ? 0 : 10}
          >
            Details view content here
          </Box>
        </Grid>
      </Grid>
    </Container>
  );
}

export default Home;
