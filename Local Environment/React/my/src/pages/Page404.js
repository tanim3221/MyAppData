import { Link as RouterLink } from 'react-router-dom';

import { styled } from '@mui/material/styles';
import { Button, Typography, Container } from '@mui/material';

const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: 480,
  margin: 'auto',
  minHeight: '100vh',
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  padding: theme.spacing(12, 0),
}));

const ButtonStyle = styled(Button)(({ theme }) => ({
  marginTop: theme.spacing(5),
}));


export default function Page404() {
  return (
    <>
      <Container>
        <StyledContent sx={{ textAlign: 'center', alignItems: 'center' }}>
          <Typography variant="h3" paragraph>
            Not Found
          </Typography>

          <Typography sx={{ color: 'text.secondary' }}>
          The requested page could not be found due to a 404 error. Please check the URL for typos or misspellings. If the URL is correct, the page may have been moved or deleted. You can contacting the website administrator for assistance.
          </Typography>
          <ButtonStyle>
            <Button to="/" size="large" variant="contained" component={RouterLink}>
              Go to Home
            </Button>
          </ButtonStyle>

        </StyledContent>
      </Container>
    </>
  );
}
