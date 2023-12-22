import React, { createContext, useContext, useState } from 'react';

const MaintenanceContext = createContext();

export const useMaintenanceStatus = () => {
  return useContext(MaintenanceContext);
};

export const MaintenanceProvider = ({ children }) => {
  const [maintenanceStatus, setMaintenanceStatus] = useState('loading');
  const value = { maintenanceStatus, setMaintenanceStatus };

  return (
    <MaintenanceContext.Provider value={value}>
      {children}
    </MaintenanceContext.Provider>
  );
};
