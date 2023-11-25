import React, { useState, useEffect, useCallback, memo, useRef } from 'react';
import {
  Container,
  Grid,
  CircularProgress,
  useMediaQuery,
  Card, CardContent, Typography, Badge
} from '@mui/material';
import { useNavigate } from 'react-router-dom';

import useResponsive from '../utils/UseResponsive';
import extStyles from '../utils/styles.module.css';
import { History, Search, Check, TravelExplore, Policy, Insights, School, Business, HourglassBottom } from '@mui/icons-material';
import { getYears } from '../auth/api';



export default function Years() {

  const [loading, setLoading] = useState(false);
  const [skeleton, setSkeleton] = useState(true);
  const navigate = useNavigate();
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const [log, setLog] = useState([]);

  const handleRequest = (years) => {
    const requestData = {
      range: encodeURIComponent(years),
    };

    getYears(requestData)
      .then(responseData => {
        setLog(responseData);
        setSkeleton(false);
        console.log(responseData);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setSkeleton(false);
      });
  }


  const cardData = [
    { id: 1, title: '3 to 4 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '4 to 5 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '5 to 6 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '6 to 7 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '7 to 8 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '8 to 9 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: '9 to 10 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
    { id: 1, title: 'Above 10 Years', click: '/years/view', icon: <School fontSize="large" />, count: <HourglassBottom fontSize="large" /> },
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
                    // handleNavigate(card.click);
                    handleRequest(card.title)
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
