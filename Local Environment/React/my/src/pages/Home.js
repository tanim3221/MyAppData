// import { useTheme } from '@mui/material/styles';
import React, { useState, useEffect } from 'react';
import { Container, Grid, Stack, Box, Typography, Card,CircularProgress, CardHeader } from '@mui/material';
import { fetchData } from '../components/conn/api';
import extStyles from '../components/ext/styles.module.css';

import { fToNow } from '../utils/formatTime';

import {
  AppWidgetSummary,
} from '../sections/@dashboard/app';


export default function DashboardAppPage() {
  // const theme = useTheme();

  const [visitor, setVisit] = useState([]);
  const [message, setMsg] = useState([]);
  const [portfolio, setPort] = useState([]);
  const [skills, setSkill] = useState([]);
  const [loading, setLoading] = useState(true);

  const subjectStyle = {
    fontWeight: 'bold',
    fontSize: '1rem',
  }
  const msgStyle = {
    fontSize: '.9rem',
    marginTop: '.5rem',
    textTransform: 'justify',
  }
  const dateStyle = {
    color: 'gray',
    fontSize: '.7rem',
    marginTop: '1rem',
  }

  const stackStyle = {
    marginBottom: '1rem',
    paddingLeft: '1.5rem',
    paddingRight: '1.5rem',
    paddingBottom: '1rem',
    borderBottom: '1px solid #eee',
  }

  const HeaderStyle = {
    marginBottom: '1.5rem',
    padding: '1.5rem',
    backgroundColor: '#eee',
  }

  useEffect(() => {
    fetchData()
      .then(responseData => {
        setVisit(responseData.saklayen.visitors);
        setMsg(responseData.saklayen.contact_messages);
        setSkill(responseData.saklayen.skills);
        setPort(responseData.saklayen.portfolio);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);

      });
  }, []);

  return (
    <>
      <Container maxWidth="xl">

        <Grid container spacing={3}>
          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Contact Messages" total={message.length} icon={'ant-design:message'} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Website Visitors" total={visitor.length} color="info" icon={'ant-design:global-outlined'} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Skills" total={skills.length} color="info" icon={'ant-design:gold-outlined'} />
          </Grid>

          <Grid item xs={12} sm={6} md={3}>
            <AppWidgetSummary title="Portfolio" total={portfolio.length} color="info" icon={'ant-design:rise-outlined'} />
          </Grid>
          {loading ? (
            <div className={extStyles.spinnerarea}>
              <CircularProgress />
            </div>
          ) : (
            <Grid item xs={12} md={12} lg={12}>
              <Card>
                <CardHeader title="Contact Messages" style={HeaderStyle} />
                {message.map((item) => (
                  <Stack direction="row" alignItems="center" spacing={2} style={stackStyle} key={item.id}>
                    <Grid item md={12} lg={12}>
                      <Grid item md={12} lg={12}>
                        <Box sx={{ minWidth: 240, flexGrow: 1 }}>
                          <Typography style={subjectStyle}>
                            {item.subject}
                          </Typography>
                          <Typography style={msgStyle}>
                            {item.message}
                          </Typography>
                        </Box>
                      </Grid>

                      <Grid item md={12} lg={12}>
                        <Typography style={dateStyle}>
                          {fToNow(item.date_added)}
                        </Typography>
                      </Grid>
                    </Grid>
                  </Stack>
                ))}
              </Card>
            </Grid>
          )}
        </Grid>
      </Container>
    </>
  );
}
