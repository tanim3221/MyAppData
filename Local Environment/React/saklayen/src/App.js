import React, { useState, useEffect } from 'react';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const response = await fetch('http://192.168.43.226:8080/saklayen/api/getData.php');
      const data = await response.json();
      setData(data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  return (
    <div>
      {data.map((item) => (
        <div key={item.id}>
          {/* Render your data here */}
          <p>{item.name}</p>
          <p>{item.mobile}</p>
          <p>{item.email}</p>
          {/* Add other data fields as needed */}
        </div>
      ))}
    </div>
  );
}

export default App;
