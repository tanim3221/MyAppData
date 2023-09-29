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
    const response = await api.post('/home_api.php', { tables, userType: 'enduser' });
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const postContactData = async (requestData) => {
  try {
    const response = await api.post('/contact.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const tokenVerify = async (requestData) => {
  try {
    const response = await api.post('/token_verify.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};