import React from 'react';
import './../styles';

function ShutdownPage() {

    const setToken = '';
    const myname = 'Saklayen Ahmed';
    const mytag = ['Tech','Audit','Finance'];
    const lastKey = mytag.length - 1;

    return (
        <div id="shutDownPage">
            <div className="lm-animated-bg" id="web_home" token={setToken} style={{ backgroundImage: `url(${process.env.PUBLIC_URL}/img/main_bg.png)` }}></div>
            <div id="shutPageContent">
                <div className="header-content" id="shutDownHead">
                    <div className="header-photo" id="shutImageHead">
                        <img id="secureImage" src={`${process.env.PUBLIC_URL}/img/man.png`} alt="Saklayen Ahmed" />

                    </div>
                    <div className="header-titles">
                        <h2 id="shutName">{myname}</h2>
                        <h4>
                            {mytag.map((value, index) => (
                                <React.Fragment key={index}>
                                    {value}
                                    {index !== lastKey && <>&nbsp;&nbsp;&nbsp;•&nbsp;&nbsp;&nbsp;</>}
                                </React.Fragment>
                            ))}
                        </h4>
                    </div>
                </div>
                <div className="counter">
                    <div className="textShutPage">
                        <p>It was a pleasure to have you here.</p>
                        <p>I hope to see you again soon.</p>
                    </div>
                    <div className="counterTimer">
                        {[['ss-days', 'Days'], ['ss-hours', 'Hours'], ['ss-minutes', 'Minutes'], ['ss-seconds', 'Seconds']].map(([id, label]) => (
                            <div className="counter__time" key={id}>
                                <span id={id}>00</span>
                                <span>{label}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ShutdownPage;
