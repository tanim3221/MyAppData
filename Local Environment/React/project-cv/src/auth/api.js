import axios from 'axios';
import { getProdDevUrl } from '../utils/CommonFunction';

const apiUrl = `${getProdDevUrl()}/api/v3`;

const api = axios.create({
  baseURL: apiUrl,
});

export const searchData = async (requestData) => {
  try {
    const loggedinToken = sessionStorage.getItem('authToken');
    const response = await api.post('/search.php', { ...requestData, token: loggedinToken });
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
export const getSearchLog = async (requestData) => {
  try {
    const loggedinToken = sessionStorage.getItem('authToken');
    const response = await api.post('/search_log.php', { ...requestData, token: loggedinToken });
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

export const userLogin = async (requestData) => {
  try {
    const response = await api.post('/login.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
export const user_G_Login = async (requestData) => {
  try {
    const response = await api.post('/g_decode_token.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};

// export const getDecodedOAuthJwtGoogle = async (token) => {
//   // const CLIENT_ID_GOOGLE = process.env.REACT_APP_GOOGLE_LOGIN_CLIENT_ID;

//   try {
//     const response = await api.get(
//       `https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=${token}`
//     );

//     return response.data;
//   } catch (error) {
//     return { status: 500, data: error };
//   }
// };

export const tokenVerify = async (requestData) => {
  try {
    const response = await api.post('/token_verify.php', requestData);
    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};