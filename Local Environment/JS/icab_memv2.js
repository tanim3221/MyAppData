const headers = {
  Accept: 'application/json, text/plain, */*',
  Authorization: 'Basic Y2xpZW50LXdlYjpVQTAxMjM0NTY=',
  Dnt: '1',
  Origin: 'https://www.icab.org.bd',
  Referer: 'https://www.icab.org.bd/',
  'Sec-Ch-Ua': '"Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"',
  'Sec-Ch-Ua-Mobile': '?1',
  'Sec-Ch-Ua-Platform': '"Android"',
  'Sec-Fetch-Dest': 'empty',
  'Sec-Fetch-Mode': 'cors',
  'Sec-Fetch-Site': 'same-site',
  'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Mobile Safari/537.36 Edg/117.0.2045.60'
};

// Define the URL for page 1
const url = 'https://api.icab.org.bd/api/v1/memberinfopagination?stext=&pageno=1&itemno=3000';

// Function to fetch data for page 1
async function fetchDataForPage() {
  const response = await fetch(url, {
    method: 'GET',
    headers: headers,
  });

  if (!response.ok) {
    throw new Error('Network response was not ok');
  }

  return response.json();
}

// Usage
fetchDataForPage()
  .then(data => {
    console.log('Data for page 1:', data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
