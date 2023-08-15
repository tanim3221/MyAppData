import React from 'react';
import { styled } from '@mui/material/styles';
import { Typography } from '@mui/material';
import { useLocation } from 'react-router-dom'; 

import { bgBlur } from '../../../utils/cssStyles';


const HEADER_MOBILE = 64;
const HEADER_DESKTOP = 92;

const StyledAppbar = styled('div')(({ theme }) => ({
  ...bgBlur({ color: theme.palette.background.default }),
  top: 0,
  left: 0,
  width: '100%',
  color: theme.palette.text.primary,
  display: 'flex',
  position: 'absolute',
  alignItems: 'center',
  height: HEADER_MOBILE,
  padding: theme.spacing(0, 3),
  boxShadow: theme.customShadows.z8,
  [theme.breakpoints.up('md')]: {
    height: HEADER_DESKTOP,
    padding: theme.spacing(0, 5),
  },
}));


function toProperCase(text) {
  return text
    .toLowerCase()
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

function Appbar() {
  const location = useLocation();
  const path = location.pathname.split('/')[1];
  return (
    <StyledAppbar>
      <Typography variant="h4">
        {toProperCase(path)}
      </Typography>
    </StyledAppbar>

  );
}

export default Appbar;
