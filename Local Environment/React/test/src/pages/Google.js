import './../App.css';
import GoogleLogin from 'react-google-login';
import { useState } from 'react';

function Google() {

  const [loginData, setLoginData] = useState(
    localStorage.getItem('loginData')
      ? JSON.parse(localStorage.getItem('loginData'))
      : null
  );
  const handleFailure = (errorData) => {
    console.log(errorData)
  }
  const handleLogin = async (googleData) => {
    console.log(googleData)
    setLoginData(googleData);    
  }
  const handleLogout = () => {
    console.log("Logout....")
    localStorage.removeItem('loginData');
    setLoginData(null)
  }
  return (
    <div className="App">
      <header className="App-header">
        <h1>React Google Login</h1>
        <div>
          {
            loginData ? (
            <div>
              <h3> You Logged in as {loginData.profileObj.email}</h3>
              <button onClick={handleLogout}>Logout</button>
            </div> )
          : (
          <GoogleLogin
            clientId={process.env.REACT_APP_GOOGLE_CLIENT_ID}
            buttonText='Login with Google'
            onSuccess={handleLogin}
            onFailure={handleFailure}
            cookiePolicy={'none'}
          ></GoogleLogin>
          )}
        </div>
      </header>
    </div>
  );
}

export default Google;
