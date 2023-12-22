import axios from 'axios';
import { getProdDevUrl } from '../utils/commonFunction';

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

export const updateData = async (requestData) => {
  try {
    const response = await api.post('/update.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const updateProData = async (requestData) => {
  try {
    const response = await api.post('/update_profile.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
export const changePasswordData = async (requestData) => {
  try {
    const response = await api.post('/change_password.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
export const cvPassChange = async (requestData) => {
  try {
    const response = await api.post('/cv_pass_change.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const addData = async (requestData) => {
  try {
    const response = await api.post('/add.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

const headers = {
  'Content-Type': 'multipart/form-data'
}

export const addMedia = async (requestData) => {
  try {
    const response = await api.post('/media.php', requestData, { headers });
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const deleteData = async (requestData) => {
  try {
    const response = await api.post('/delete.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

export const userLogin = async (requestData) => {
  try {
    const response = await api.post('/login.php', requestData);
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

export const userGLogin = async (requestData) => {
  try {
    const response = await api.post('/g_decode_token.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};