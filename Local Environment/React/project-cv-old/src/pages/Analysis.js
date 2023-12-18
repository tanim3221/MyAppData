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
import { History, Search, Check, TravelExplore, Policy, Insights, School, Business, PersonSearch } from '@mui/icons-material';
import { getAnalysis } from '../auth/api';



export default function Analysis() {

  const [loading, setLoading] = useState(true);
  const [skeleton, setSkeleton] = useState(true);
  const navigate = useNavigate();
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const [log, setLog] = useState([]);



  useEffect(() => {
    getAnalysis()
      .then(responseData => {
        setLog(responseData.distinctValues);
        // console.log(responseData);
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
            {log && log.length > 0 && log.map((card) => (
              <Grid item xs={12} sm={6} md={4} key={card.sl}>
                <Card style={{ height: '10rem', cursor: 'pointer' }} onClick={() => handleNavigate("/analysis")}>
                  <CardContent style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
                    <div style={{ marginBottom: 'auto' }}>
                      <Typography variant="h6">{card.value}</Typography>
                    </div>
                    <Typography variant="h3" style={{ alignSelf: 'flex-end', position: 'absolute', bottom: '10px', right: '15px' }}>
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
