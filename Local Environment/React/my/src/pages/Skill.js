import { useTheme } from '@mui/material/styles';
import { Container, Typography } from '@mui/material';

export default function Skill() {
  const theme = useTheme();

  return (
    <>
      <Container maxWidth="xl">
        <Typography variant="h4" sx={{ color: 'text.primary' }}>
        Skill
        </Typography>
      </Container>
    </>
  );
}
