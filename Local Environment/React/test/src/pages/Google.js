import './../App.css';
import { GoogleOAuthProvider, GoogleLogin } from '@react-oauth/google';
function Google() {
  const handleLoginSuccess = (credentialResponse) => {
    console.log(credentialResponse);
    // Handle successful login here...
  };

  const handleLoginFailure = (error) => {
    console.log('Login Failed:', error);
    // Handle login failure here...
  };
  return (
    <div className="App">
      <header className="App-header">
        <h1>React Google Login</h1>
        <div>
          <GoogleOAuthProvider clientId="995598256383-fn7bphr60k9gevag4dp5oudcjtf2cjm1.apps.googleusercontent.com">
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              onError={() => {
                console.log('Login Failed');
              }}
              useOneTap
            />
            <div className='spacer'></div>

            <GoogleLogin
              shape="circle"
              onSuccess={handleLoginSuccess}
              onFailure={handleLoginFailure}
              onError={handleLoginFailure}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              shape="rectangular"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              shape="pill"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              shape="square"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              type="icon"
              shape="square"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              type="icon"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              size="small"
              shape="square"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="outline"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="filled_blue"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="filled_black"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="filled_black"
              text="continue_with"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="filled_black"
              text="signin_with"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
            <div className='spacer'></div>
            <GoogleLogin
              onSuccess={credentialResponse => {
                console.log(credentialResponse);
              }}
              theme="filled_black"
              text="signup_with"
              shape="circle"
              onError={() => {
                console.log('Login Failed');
              }}
            />
          </GoogleOAuthProvider>
        </div>

      </header>
    </div>
  );
}
export default Google;
