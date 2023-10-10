import React, { useState } from 'react';
import GoogleLogin from 'react-google-login';

function Google() {
    const [loginData, setLoginData] = useState('');

    const handleFailure = (errorData) => {
        console.error('Login Failed:', errorData);
    };

    const handleLogin = (googleData) => {
        console.log('Login Data:', googleData);
        setLoginData(googleData);
    };

    const handleLogout = () => {
        console.log('Logout...');
        setLoginData(null);
    };

    return (
        <div className="App">
            <header className="App-header">
                <h1>React Google Login</h1>
                <div>
                    {loginData ? (
                        <div>
                            <h3>You Logged in as {loginData.profileObj.email}</h3>
                            <button onClick={handleLogout}>Logout</button>
                        </div>
                    ) : (
                        <GoogleLogin
                            clientId={process.env.REACT_APP_GOOGLE_CLIENT_ID}
                            buttonText='Login with Google'
                            onSuccess={handleLogin}
                            onFailure={handleFailure}
                            cookiePolicy={'single_host_origin'}
                        />
                    )}
                </div>
            </header>
        </div>
    );
}

export default Google;
