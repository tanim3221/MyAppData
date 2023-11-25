import React, { useState, useEffect, useCallback, memo, useRef } from 'react';
import {
  Container,
  Grid,
  CircularProgress,
  useMediaQuery,
  Card, CardContent, Typography, Badge
} from '@mui/material';
import {useNavigate} from 'react-router-dom';

import useResponsive from '../utils/UseResponsive';
import extStyles from '../utils/styles.module.css';
import { History, Search, Check, TravelExplore, Policy, Insights, School, Business, PersonSearch} from '@mui/icons-material';
import { getSearchLog, getLoginLog} from '../auth/api';



export default function Home() {

  const [loading, setLoading] = useState(true);
  const [skeleton, setSkeleton] = useState(true);
  const navigate = useNavigate();
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const [loginLog, setLoginLog] = useState([]);
  const [searchLog, setSearchLog] = useState([]);



  useEffect(() => {
    getLoginLog()
      .then(responseData => {
        setLoginLog(responseData.totalCount);
        setSkeleton(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setSkeleton(false);
      });

    getSearchLog()
      .then(responseData => {
        setSearchLog(responseData.totalCount);
        setSkeleton(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setSkeleton(false);
      });
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);

  const cardData = [
    { id: 1, title: 'Search', click: '/search', icon: <Search fontSize="large" />, count: <PersonSearch fontSize="large"/> },
    { id: 4, title: 'Firm Analysis', click: '/analysis', icon: <Business fontSize="large"/>, count: <Insights fontSize="large"/> },
    { id: 5, title: 'Years to CA', click: '/years', icon: <School fontSize="large"/>, count: <Insights fontSize="large"/> },
    { id: 2, title: 'Search History', click: '/history', icon: <TravelExplore fontSize="large" />, count: searchLog },
    { id: 3, title: 'Login History', click: '', icon: <Policy fontSize="large"/>, count: loginLog },
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
              <Card style={{ height: '10rem', cursor:'pointer' }} onClick={() => handleNavigate(card.click)}>
                <CardContent style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
                  <div style={{ marginBottom: 'auto' }}>
                    {card.icon}
                    <Typography variant="h6">{card.title}</Typography>
                  </div>
                    <Typography variant="h3" style={{ alignSelf: 'flex-end' }}>
                    {card.count}
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
