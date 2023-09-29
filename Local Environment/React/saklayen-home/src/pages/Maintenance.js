import React, { useEffect, useState } from 'react';
import { fetchData } from '../auth/api';
import { CircularProgress, Skeleton } from '@mui/material';
import '../styles';
import { getProdDevUrl } from '../tools/commonFunction';

function ShutdownPage() {
    const [personal, setPersonal] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [imageLoaded, setImageLoaded] = useState(false);
    const tables = ['personalinfo'];

    useEffect(() => {
        fetchData(tables)
            .then(responseData => {
                const getdata = responseData.saklayen;
                const personalinfo = getdata.personalinfo[0];
                setPersonal(personalinfo);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setError(error);
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);

    if (loading) return <div className='spinnerBar'>
        <CircularProgress
            style={{
                color: '#5e2fd6'
            }}
        />
    </div>;
    if (error) return <div>Error loading data. Please try again later.</div>;
    if (!personal) return null;

    const mytag = JSON.parse(personal.tag || '[]');
    const lastKey = mytag.length - 1;

    return (
        <>
            {loading ? (
                <div className='spinnerBar'>
                    <CircularProgress
                        style={{
                            color: '#5e2fd6'
                        }}
                    />
                </div>
            ) : (
                <>
                    <div id="shutDownPage">
                        <div className="lm-animated-bg" id="web_home" style={{ backgroundImage: `url(${process.env.PUBLIC_URL}/img/main_bg.png)` }}></div>
                        <div id="shutPageContent">
                            <div className="header-content" id="shutDownHead">
                                <div className="header-photo" id="shutImageHead">
                                    {!imageLoaded && <Skeleton className='skeletonProfileMaintenace' variant="circular" />}
                                    <img
                                        src={`${getProdDevUrl()}/assets/img/` + personal.photo}
                                        alt={personal.name}
                                        onLoad={() => setImageLoaded(true)}
                                        style={imageLoaded ? {} : { display: 'none' }}
                                    />
                                    <img id="secureImage" src={`${process.env.PUBLIC_URL}/img/man.png`} alt="Saklayen Ahmed" />

                                </div>
                                <div className="header-titles">
                                    <h2 id="shutName">{personal.name}</h2>
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

                </>
            )}
        </>

    )
}

export default ShutdownPage;
