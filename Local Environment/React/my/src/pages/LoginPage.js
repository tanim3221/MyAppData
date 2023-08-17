import { styled } from '@mui/material/styles';
import { Container, Typography } from '@mui/material';
import { LoginForm } from '../sections/auth/login';


const StyledRoot = styled('div')(({ theme }) => ({
  [theme.breakpoints.up('md')]: {
    display: 'flex',
  },
}));


const StyledContent = styled('div')(({ theme }) => ({
  maxWidth: 480,
  margin: 'auto',
  minHeight: '100vh',
  display: 'flex',
  justifyContent: 'center',
  flexDirection: 'column',
  padding: theme.spacing(12, 0),
}));
const HeadStyle = styled('div')(({ theme }) => ({
  textAlign: 'center',
  fontSize: '4rem',
  fontWeight: 'bold',
  marginBottom: '3rem',
}));


export default function LoginPage() {

  return (
    <>
      <StyledRoot>
        <Container maxWidth="sm">
          <StyledContent>
            <HeadStyle>
            <Typography variant="h4" gutterBottom>
              Login | Saklayen Ahmed
            </Typography>
            </HeadStyle>
            <LoginForm />
          </StyledContent>
        </Container>
      </StyledRoot>
    </>
  );
}
