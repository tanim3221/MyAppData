import axios from 'axios';
import { getProdDevUrl } from '../tools/commonFunction';

const apiUrl = `${getProdDevUrl()}/assets/api`;

const api = axios.create({
  baseURL: apiUrl,
});

export const fetchData = async (tables) => {
  try {
    const response = await api.post('/public', { tables, userType: 'enduser'});
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

export const fetchUserData = async () => {
  const jsonURL = 'https://api.ipregistry.co?key=q1wuszo1zgdb6ekp';
  try {
    const response = await axios.get(jsonURL);
    if (response.status === 200) {
      return response.data;
    }
    throw new Error('Failed to fetch JSON data');
  } catch (error) {
    throw error;
  }
};

export const sendUserDataToAPI = async (userData) => {
  try {
    const response = await api.post('/visit', { userData });
    if (response.status === 200) {
      return response.data;
    }
    throw new Error('Failed to send data to PHP');
  } catch (error) {
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