import axios from 'axios';
import { getProdDevUrl } from '../tools/commonFunction';

const apiUrl = `${getProdDevUrl()}/assets/api`;

const api = axios.create({
  baseURL: apiUrl,
});

// const postData = {
//   token: loggedinToken,
// };

export const fetchData = async (tables) => {
  try {
    const response = await api.post('/public', { tables, userType: 'enduser' });
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const postContactData = async (requestData) => {
  try {
    const response = await api.post('/message', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
export const tokenHash = async (requestData) => {
  try {
    const response = await api.post('/verify', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const checkMaintenance = async (requestData) => {
  try {
    const response = await api.post('/activity', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const generateCv = async (requestData) => {
  try {
    const response = await api.post('/resume', requestData, {
      responseType: 'blob'
    });
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};