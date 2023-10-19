import React, { useEffect, useState } from 'react';
import axios from 'axios';
import CryptoJS from 'crypto-js';

function Decode() {
  const [data, setData] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:8080/php-test/translator/encodev2.php')
      .then(response => {
        const ciphertext = response.data.message;
        const key = 'I LOVE YOU';
        const decryptedData = CryptoJS.AES.decrypt(ciphertext, key);
        setData(decryptedData.toString(CryptoJS.enc.Utf8));
        console.log(decryptedData.toString(CryptoJS.enc.Utf8));
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }, []);

  return (
    <div>
      <p>{data}</p>
    </div>
  );
}

export default Decode;
