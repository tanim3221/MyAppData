import axios from 'axios';

const apiUrl = "http://localhost:8080/saklayen/assets/api/end_api.php";

const api = axios.create({
  baseURL: apiUrl,
});

const postData = {
    user: 'saklayen',
    pass: 'SDKJFHSIURWEJFGWEYGJRCWSEIURFGWEU'
};

export const fetchData = async (endpoint) => {
  try {
    const response = await api.post(endpoint, postData)

    return response.data;
  } catch (error) {
    console.error('API request error:', error);
    throw error;
  }
};
