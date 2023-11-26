import React, { useState, useEffect, useCallback, memo, useRef } from 'react';
import {
  Container,
  Grid,
  CircularProgress,
  useMediaQuery,
  Card, CardContent, Typography, Badge
} from '@mui/material';
import { useParams } from 'react-router-dom';

import useResponsive from '../utils/UseResponsive';
import extStyles from '../utils/styles.module.css';
import { History, Search, Check, TravelExplore, Policy, Insights, School, Business, HourglassBottom } from '@mui/icons-material';
import { getYears } from '../auth/api';



export default function YearsView({yearsrange}) {

  const [loading, setLoading] = useState(false);
  const [skeleton, setSkeleton] = useState(true);
  const isDesktop = useResponsive('up', 'lg');
  const isSmallScreen = useMediaQuery((theme) => theme.breakpoints.down('sm'));
  const [log, setLog] = useState([]);
  // const { yearsrange } = useParams();
  // console.log('Yearsrange:', useParams());


  useEffect(() => {
    console.log('YearsView component mounted with yearsrange:', yearsrange);
    const requestData = {
      range: encodeURIComponent(yearsrange),
    };
    getYears(requestData)
      .then(responseData => {
        setLog(responseData);
        setSkeleton(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setSkeleton(false);
      });
  }, [yearsrange]);

  return (
    <Container maxWidth="xl">
      <>
        {loading ? (
          <div className={extStyles.spinnerarea}>
            <CircularProgress />
          </div>
        ) : (

          <Grid container spacing={2}>
            {log.map((card) => (
              <Grid item xs={12} sm={6} md={3} key={card.userkeyid}>
                  <Typography>{card.userkeyid}</Typography>
              </Grid>
            ))}
          </Grid>
        )}
      </>
    </Container>
  );
}
