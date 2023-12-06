import React, { Component } from 'react';
import axios from 'axios';
import GitHubLogin from 'react-github-login';

class App extends Component {

    onSuccessGithub = async (response) => {
        console.log(response);

        try {
            const accessToken = await this.getAccessToken(response.code);
            const userInfo = await this.getUserInfo(accessToken);
            console.log(userInfo);
        } catch (error) {
            console.error('Error fetching user info:', error);
        }
    }

    onFailureGithub = (response) => {
        console.error(response);
    }

    getAccessToken = async (code) => {
        const clientId = '35f3eec621fee853a24b';
        const clientSecret = '4491faaa63244f38306cda516ec746a1517e06f3';
        const redirectUri = 'http://localhost:3000/github';

        try {
            const response = await axios.post(
                'https://github.com/login/oauth/access_token',
                {
                    client_id: clientId,
                    client_secret: clientSecret,
                    code: code,
                    redirect_uri: redirectUri,
                },
                {
                    headers: {
                        Accept: 'application/json',
                        
                    },

                },
            );

            const accessToken = response.data.access_token;
            console.log('Access Token:', accessToken);
            return accessToken;
        } catch (error) {
            console.error('Error getting access token:', error);

            // Log the response data if available
            if (error.response) {
                console.error('Response Data:', error.response.data);
            }

            throw error; // rethrow the error to be caught by the calling function
        }
    };


    getUserInfo = async (accessToken) => {
        const response = await axios.get('https://api.github.com/user', {
            headers: {
                Authorization: `Bearer ${accessToken}`,
            },
        });

        return response.data;
    };

    render() {
        return (
            <div className="App" align="center">
                <h1>LOGIN WITH GITHUB AND MICROSOFT</h1>

                <GitHubLogin
                    clientId="35f3eec621fee853a24b"
                    onSuccess={this.onSuccessGithub}
                    onFailure={this.onFailureGithub}
                    buttonText="LOGIN WITH GITHUB"
                    className="git-login"
                    valid={true}
                    redirectUri="http://localhost:3000/github"
                />

                <br />
                <br />

                {/* <ReactLoginMS
                    clientId="_"
                    redirectUri="_"
                    cssClass="ms-login"
                    btnContent="LOGIN WITH MICROSOFT"
                    responseType="token"
                    handleLogin={(data) => console.log(data)}
                /> */}
            </div>
        );
    }
}

export default App;
