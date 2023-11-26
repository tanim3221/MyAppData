import React, { useState } from 'react';
import {
  Container,
  Grid,
  CircularProgress,
  useMediaQuery,
  Card, CardContent, Typography
} from '@mui/material';
import { useNavigate } from 'react-router-dom';

import useResponsive from '../utils/UseResponsive';
import extStyles from '../utils/styles.module.css';
// eslint-disable-next-line
import { History, Search, Check, TravelExplore, Policy, Insights, School, Business, HourglassBottom } from '@mui/icons-material';



export default function Years() {

  const [loading, setLoading] = useState(false);
  const [skeleton, setSkeleton] = useState(true);
  const navigate = useNavigate();
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));

  const cardData = [
    { id: 1, title: '3 to 4 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 2, title: '4 to 5 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 3, title: '5 to 6 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 4, title: '6 to 7 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 5, title: '7 to 8 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 6, title: '8 to 9 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 7, title: '9 to 10 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 8, title: 'Above 10 Years', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
  ];

  const handleNavigate = (url) => {
    navigate(url);
  }

  return (
    <Container maxWidth="xl">
      <>
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (

          <Grid container spacing={2}>
            {cardData.map((card) => (
              <Grid item xs={12} sm={6} md={3} key={card.id}>
                <Card style={{ height: '10rem', cursor: 'pointer' }}
                  onClick={() => {
                    handleNavigate(encodeURIComponent(card.title));
                  }}>
                  <CardContent style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
                    <div style={{ marginBottom: 'auto' }}>
                      {/* {card.icon} */}
                      <Typography variant="h6">{card.title}</Typography>
                    </div>
                    <Typography variant="h3" style={{ alignSelf: 'flex-end', position: 'absolute', bottom: '10px', right: '15px' }}>
                      {card.icon}
                    </Typography>
                  </CardContent>
                </Card>
              </Grid>
            ))}
          </Grid>
        )}
      </>
    </Container>
  );
}
