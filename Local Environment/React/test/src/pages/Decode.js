import React, { useEffect, useState } from 'react';
import axios from 'axios';

function Decode() {
    const [data, setData] = useState(null);

    useEffect(() => {
        // Function to decode the received data
        function decodeResponseData(encodedData, key) {
            // Convert the base64-encoded data to a Uint8Array
            const decodedData = atob(encodedData);
            const buffer = new Uint8Array(decodedData.length);
            for (let i = 0; i < decodedData.length; i++) {
                buffer[i] = decodedData.charCodeAt(i);
            }

            // Convert the key to an ArrayBuffer
            const keyBuffer = new TextEncoder().encode(key);

            // Import the key and decode the data
            crypto.subtle.importKey(
                'raw',
                keyBuffer,
                'AES-CBC',
                false,
                ['decrypt']
            )
            .then(key => {
                return crypto.subtle.decrypt(
                    {
                        name: 'AES-CBC',
                        iv: buffer.slice(0, 16)
                    },
                    key,
                    buffer.slice(16)
                );
            })
            .then(result => {
                // Convert the decrypted data to a UTF-8 string
                const decryptedData = new TextDecoder().decode(result);
                setData(decryptedData);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

        // Make a GET request to your PHP server
        axios.get('http://localhost:8080/php-test/translator/encode.php')
            .then(response => {
                const encryptedData = response.data.message;
                decodeResponseData(encryptedData, "YourSecretKey123");
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }, []);

    return (
        <div>
            <h1>Welcome to Decode</h1>
            <p>{data}</p>
        </div>
    );
}

export default Decode;
