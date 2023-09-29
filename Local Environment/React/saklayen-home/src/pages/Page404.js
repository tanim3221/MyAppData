import React from 'react';
import '../assets/extStyle/not-found.css';
import { useNavigate } from 'react-router-dom';

const ErrorPage = () => {
    const navigate = useNavigate();

    const handleHome = () => {
        navigate('/home');
    }
    return (
        <div id="shutDownPage">
            <div className="lm-animated-bg" style={{
                backgroundImage: `url(${process.env.PUBLIC_URL}/img/main_bg.png)`,
                position: 'absolute!important'
            }}></div>
            <div id="shutPageContent">
                <div className="header-content">
                    <div className="err-container">
                        <span className="err-junk">:: </span><span className="err-junk" style={{ color: '#ffffff' }}> SAKLAYEN AHMED </span><span className="err-junk"> ::</span>
                        <br />
                        <br />
                        <span className="err-statuscode">Page not found</span>
                        <hr />
                        <br /><br /><br /><br /><br />
                        <span className="err-error">error</span>
                        <br />
                        <br />
                        <br />
                        <br />
                        <button onClick={handleHome} className="err-link">[go home]</button>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ErrorPage;
