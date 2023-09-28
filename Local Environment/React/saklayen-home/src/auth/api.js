import axios from 'axios';
import { getProdDevUrl } from '../tools/commonFunction';

const apiUrl = `${getProdDevUrl()}/assets/api`;

const api = axios.create({
  baseURL: apiUrl,
});

// const postData = {
//   token: loggedinToken,
// };

export const fetchData = async (requestData) => {
  try {
    const loggedinToken = sessionStorage.getItem('authToken');
    const response = await api.post('/end_api.php', { ...requestData, token: loggedinToken, userType: 'fromAdmin' });
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