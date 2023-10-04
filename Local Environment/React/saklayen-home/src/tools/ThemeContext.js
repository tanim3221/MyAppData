import React, { createContext, useContext, useEffect, useState } from "react";
import { fetchData } from '../auth/api';

import './../assets/extStyle/bootstrap-grid.min.css';
import './../assets/extStyle/custom.css';
// import './assets/extStyle/main.dark.blue.css';
// import './../assets/extStyle/main.dark.blue.min.css';
// import './assets/extStyle/main.dark.iris.css';
// import './assets/extStyle/main.dark.iris.min.css';
// import './assets/extStyle/main.light.blue.css';
// import './assets/extStyle/main.light.blue.min.css';
// import './assets/extStyle/main.light.iris.css';
import './../assets/extStyle/main.light.iris.min.css';
// import './assets/extStyle/main.light.lightblue.css';
// import './assets/extStyle/main.light.lightblue.min.css';
import './../assets/extStyle/online-cv.css';
// import './assets/extStyle/reset.css';
import './../assets/extStyle/reset.min.css';


const ThemeContext = createContext();

export const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState(() => localStorage.getItem('theme') || "light");
  const [color, setColor] = useState("");

  const tables = ['personalinfo'];

  useEffect(() => {
      fetchData(tables)
          .then(responseData => {
              const getdata = responseData.saklayen;
              const person = getdata.personalinfo[0];
              setColor(person.theme);
          })
          .catch(error => {
              console.error('Error fetching data:', error);
          });
      // eslint-disable-next-line
  }, []);

  // Whenever theme changes, update localStorage
  useEffect(() => {
    localStorage.setItem('theme', theme);
  }, [theme]);

  const toggleTheme = () => {
    setTheme((prevTheme) => prevTheme === "light" ? "dark" : "light");
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme, color }}>
      {children}
    </ThemeContext.Provider>
  );
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error("useTheme must be used within a ThemeProvider");
  }
  return context;
};
