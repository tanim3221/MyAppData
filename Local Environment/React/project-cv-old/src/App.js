import { BrowserRouter } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import Router from './routes';
import ThemeProvider from './theme';

import { StateProvider } from './auth/StateProvider';

export default function App() {
  return (
    <StateProvider>
      <HelmetProvider>
        <BrowserRouter>
          <ThemeProvider>
            <Router />
          </ThemeProvider>
        </BrowserRouter>
      </HelmetProvider>
    </StateProvider>

  );
}
