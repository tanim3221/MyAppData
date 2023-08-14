import { styled } from '@mui/material/styles';
import { Typography } from '@mui/material';
import { bgBlur } from '../../../utils/cssStyles';


const HEADER_MOBILE = 64;
const HEADER_DESKTOP = 92;

const StyledAppbar = styled('div')(({ theme }) => ({
  ...bgBlur({ color: theme.palette.background.default }),
  top: 0,
  left: 0,
  width: '100%',
  color: theme.palette.text.primary,
  display: 'flex',
  position: 'absolute',
  alignItems: 'center',
  height: HEADER_MOBILE,
  padding: theme.spacing(0, 3),
  boxShadow: theme.customShadows.z8,
  [theme.breakpoints.up('md')]: {
    height: HEADER_DESKTOP,
    padding: theme.spacing(0, 5),
  },
}));


export default function Appbar() {
  return (
    <StyledAppbar>
      <Typography variant="h4">
        Hi, Welcome back
      </Typography>
    </StyledAppbar>

  );
}
