// UserContext.js
import React, { createContext, useContext, useState } from 'react';

const StateContext = createContext();

// eslint-disable-next-line 
export const StateProvider = ({ children }) => {
  const [sharedState, setSharedState] = useState(null);

  return (
    <StateContext.Provider value={{ sharedState, setSharedState }}>
      {children}
    </StateContext.Provider>
  );
};

// eslint-disable-next-line 
export const useStateContext = () => {
  return useContext(StateContext);
};
