import { BrowserRouter } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import Router from './routes';

import ThemeProvider from './theme';

import { StyledChart } from './components/chart';
import ScrollToTop from './components/scroll-to-top';
import { StateProvider } from './auth/StateProvider';

export default function App() {
  return (
    <StateProvider>
      <HelmetProvider>
        <BrowserRouter>
          <ThemeProvider>
            <ScrollToTop />
            <StyledChart />
            <Router />
          </ThemeProvider>
        </BrowserRouter>
      </HelmetProvider>
    </StateProvider>

  );
}
