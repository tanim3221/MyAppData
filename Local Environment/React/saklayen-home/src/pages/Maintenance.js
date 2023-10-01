import React, { useEffect, useState } from 'react';
import { fetchData } from '../auth/api';
import { CircularProgress, Skeleton } from '@mui/material';
import '../styles';
import { getProdDevUrl } from '../tools/commonFunction';

function ShutdownPage() {
    const [personal, setPersonal] = useState(null);
    const [myTags, setMyTag] = useState([]);
    const [loading, setLoading] = useState(true);
    const [imageLoaded, setImageLoaded] = useState(false);
    const tables = ['personalinfo', 'my_tags'];


    useEffect(() => {
        fetchData(tables)
            .then(responseData => {
                const getdata = responseData.saklayen;
                const personalinfo = getdata.personalinfo[0];
                const myTag = getdata.my_tags;
                setPersonal(personalinfo);
                setMyTag(myTag);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);

    if (loading) return <div className='spinnerBarMaintenace'>
        <CircularProgress
            style={{
                color: '#5e2fd6'
            }}
        />
    </div>;

    const lastKey = myTags.length - 1;

    function CountdownTimer({ expiryDate }) {
        const [timeLeft, setTimeLeft] = useState({
            days: 0,
            hours: 0,
            minutes: 0,
            seconds: 0,
        });

        useEffect(() => {
            const interval = setInterval(() => {
                const now = new Date();
                const expiration = new Date(expiryDate);
                const difference = expiration - now;
        
                if (difference <= 0) {
                    setTimeLeft({ days: 0, hours: 0, minutes: 0, seconds: 0 });
                    clearInterval(interval);
                } else {
                    const days = Math.floor(difference / (1000 * 60 * 60 * 24));
                    const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
                    const seconds = Math.floor((difference % (1000 * 60)) / 1000);
        
                    setTimeLeft({ days, hours, minutes, seconds });
                }
            }, 1000);
        
            return () => clearInterval(interval);
        }, [expiryDate]);
        
        return (
            <div className="counterTimer">
                {[
                    ['days', 'Days'],
                    ['hours', 'Hours'],
                    ['minutes', 'Minutes'],
                    ['seconds', 'Seconds'],
                ].map(([key, label]) => (
                    <div className="counter__time" key={key}>
                        <span id={`ss-${key}`}>{String(timeLeft[key]).padStart(2, '0')}</span>
                        <span>{label}</span>
                    </div>
                ))}
            </div>
        );
    }

    return (
        <>
            {loading ? (
                <div className='spinnerBarMaintenace'>
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
                                        {myTags.sort((b,a)=>a.rank-b.rank).map((value, index) => (
                                            <React.Fragment key={index}>
                                                {value.tag_name}
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
                                <CountdownTimer expiryDate={personal.expiry_date}/>
                            </div>
                        </div>
                    </div>

                </>
            )}
        </>

    )
}

export default ShutdownPage;
