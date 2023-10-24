import { useEffect } from 'react';
import { fetchUserData, sendUserDataToAPI } from '../auth/api';

function Visitor() {
  useEffect(() => {
    const isNew = sessionStorage.getItem('has-visited') == null;

    if (isNew) {      
      fetchUserData()
        .then(userData => {
            return sendUserDataToAPI(userData);
        })
        .then(responseData => {
          if (responseData) {
            console.log('Response from visitorInfo:', responseData);
          } else {
            console.log('No response data received.');
          }
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
      sessionStorage.setItem('has-visited', 'true');
    } else {
      console.log('Welcome back !');
    }
  }, []);

  return null;
}

export default Visitor;
