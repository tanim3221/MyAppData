import axios from 'axios';

const apiUrl = "http://localhost:8080/saklayen/assets/api";

const api = axios.create({
  baseURL: apiUrl,
});

const postData = {
  user: 'saklayen',
  pass: 'SDKJFHSIURWEJFGWEYGJRCWSEIURFGWEU'
};

export const fetchData = async () => {
  try {
    const response = await api.post('/end_api.php', postData)
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
