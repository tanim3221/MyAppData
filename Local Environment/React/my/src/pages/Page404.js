import { Link as RouterLink } from 'react-router-dom';
import { styled } from '@mui/material/styles';
import { Button, Typography, Container } from '@mui/material';

const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: 480,
  margin: 'auto',
  minHeight: '100vh',
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center', // Center content vertically as well
  padding: theme.spacing(12, 0),
}));

// eslint-disable-next-line 
const BackgroundOverlay = styled('div')(({ theme }) => ({
  position: 'absolute',
  top: 0,
  left: 0,
  width: '100%',
  height: '100%',
  backgroundImage: `url("http://localhost:8080/saklayen/assets/img/bg-03.svg")`,
  backgroundSize: 'cover',
  zIndex: -1, // Move the background behind the content
}));

const ButtonStyle = styled('div')(({ theme }) => ({
  display: 'flex',
  justifyContent: 'flex-start',
  marginTop: theme.spacing(2),
}));

const ContentOverlay = styled('div')(({ theme }) => ({
  padding: theme.spacing(3),
  borderRadius: theme.spacing(1),
  backgroundColor: 'rgba(255, 255, 255, 0.8)', // Add a semi-transparent background for better readability
}));

export default function Page404() {
  return (
    <>
      <BackgroundOverlay />
      <StyledContent>
        <Container>
          <ContentOverlay>
            <Typography variant="h3" paragraph>
              Not Found
            </Typography>

            <Typography sx={{ color: 'text.secondary' }}>
              The requested page could not be found due to a 404 error. Please check the URL for typos or misspellings. If the URL is correct, the page may have been moved or deleted. You can contact the website administrator for assistance.
            </Typography>
            <ButtonStyle>
              <Button to="/" size="large" variant="contained" component={RouterLink}>
                Go to Home
              </Button>
            </ButtonStyle>
          </ContentOverlay>
        </Container>
      </StyledContent>
    </>
  );
}
