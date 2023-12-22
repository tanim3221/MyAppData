import React, { useEffect, useState, useRef } from 'react';
import {
    TextField,
    FormControl,
    Typography,
    Box,
    Stack,
} from '@mui/material';

import ReCAPTCHA from 'react-google-recaptcha';

import { fetchData, postContactData } from '../../auth/api';
import { CircularProgress, useMediaQuery } from '@mui/material';

function ContactContent() {
    const tables = ['personalinfo'];
    const [personal, setPersonal] = useState([]);
    const [loading, setLoading] = useState(true);
    const [btnLabel, setBtnLabel] = useState('Send message');
    const [message, setMessage] = useState('');
    const mainDataRef = useRef({});
    const TABLE_NAME = 'contact_messages';
    const isMobile = useMediaQuery('(max-width:600px)');
    const captchaRef = useRef(null);
    const [isCaptchaSuccessful, setIsCaptchaSuccess] = useState(false);
    const [captchaKey, setCaptchaKey] = useState('');


    const nameRef = useRef(null);
    const mobileRef = useRef(null);
    const emailRef = useRef(null);
    const subjectRef = useRef(null);
    const messageRef = useRef(null);

    const styles = {
        formStyle: {
            padding: '20px',
            borderRadius: '5px'
        },

        defaultMessageStyle: {
            padding: '10px',
            color: '#e74c3c'
        },
        successMessageStyle: {
            padding: '10px',
            color: 'green',
            fontWeight: '700'
        }
    };

    const [messageStyle, setMessageStyle] = useState(styles.defaultMessageStyle);

    // const handleChange = (event) => {
    //     const { name, value } = event.target;
    //     mainDataRef.current = {
    //         ...mainDataRef.current,
    //         [name]: value
    //     };
    // };



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
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);

    const getCurrentDate = () => {
        const date = new Date();
        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        const hours = ('0' + date.getHours()).slice(-2);
        const minutes = ('0' + date.getMinutes()).slice(-2);
        const seconds = ('0' + date.getSeconds()).slice(-2);
        return `${month}-${day}-${year} ${hours}:${minutes}:${seconds}`;
    }
   

    const onRecaptchaChange = (value) => {
        setIsCaptchaSuccess(true)
        setCaptchaKey(value);
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        const currentDate = getCurrentDate();
        setBtnLabel('Sending...');
        const requestData = {
            table: TABLE_NAME,
            data: {
                date_added: currentDate,
                name: nameRef.current.value,
                mobile: mobileRef.current.value,
                email: emailRef.current.value,
                subject: subjectRef.current.value,
                message: messageRef.current.value,
            },
            captcha: captchaKey,
            secret: process.env.REACT_APP_GOOGLE_SECRET_KEY,
        };

        // console.log(requestData);

        postContactData(requestData)
            .then(response => {
                if (response.error) {
                    setBtnLabel('Send again');
                    setMessageStyle({ color: 'red', fontWeight: '700' });
                    setMessage(response.message);
                } else {
                    setBtnLabel('Send again');
                    setMessageStyle({ color: 'green', fontWeight: '700' });
                    setMessage(response.message);
                    nameRef.current.value = '';
                    mobileRef.current.value = '';
                    emailRef.current.value = '';
                    subjectRef.current.value = '';
                    messageRef.current.value = '';
                }
                captchaRef.current.reset();

            })
            .catch(error => {
                setBtnLabel('Try again');
                setMessageStyle({ color: 'red', fontWeight: '700' });
                setMessage('Sorry! Please try again later.');
                console.error(error);
            });
    }

    return (
        <div className="section-content main_body_wrapper">
            {loading ? (
                <div className='spinnerBar'>
                    <CircularProgress
                        style={{
                            color: '#5e2fd6'
                        }}
                    />
                </div>
            ) : (
                <><div className="page-title">
                    <h2>Contact</h2>
                </div>
                    <div className="row">
                        <ContactInfoBlock value={personal.mobile} iconClass="lnr lnr-phone-handset" title="Mobile" id="contactMobile" />
                        <ContactInfoBlock value={personal.email} iconClass="lnr lnr-envelope" title="E-mail" id="contactMail" />
                    </div>
                    <div className="white-space-50"></div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Please <span>contact me</span> if you have any <span>further inquiries</span></h3>
                            </div>
                            <FormComponent
                                handleSubmit={handleSubmit}
                                // handleChange={handleChange}
                                messageStyle={messageStyle}
                                isCaptchaSuccessful={isCaptchaSuccessful}
                                captchaRef={captchaRef}
                                message={message}
                                isMobile={isMobile}
                                btnLabel={btnLabel}
                                nameRef={nameRef}
                                mobileRef={mobileRef}
                                onRecaptchaChange={onRecaptchaChange}
                                emailRef={emailRef}
                                mainDataRef={mainDataRef}
                                subjectRef={subjectRef}
                                messageRef={messageRef}
                            />
                        </div>
                    </div>
                </>

            )}


        </div>
    )
}


function ContactInfoBlock({ iconClass, title, id, value }) {
    return (
        <div className="col-xs-6 col-lg-6 col-md-6 col-sm-12">
            <div className="lm-info-block gray-default">
                <i className={iconClass}></i>
                <h4>{title}</h4>
                <span className="lm-info-block-value" id={id}></span>
                <span className="lm-info-block-text">{value}</span>
            </div>
        </div>
    );
}

function FormComponent({
    handleSubmit,
    // handleChange,
    messageStyle,
    message,
    btnLabel,
    onRecaptchaChange,
    nameRef,
    mobileRef,
    captchaRef,
    isCaptchaSuccessful,
    emailRef,
    // mainDataRef,
    isMobile,
    subjectRef,
    messageRef
}) {
    return (
        <Box
            component="form"
            className='form_contact'
            sx={{
                marginTop: '2rem',
                display: 'grid',
                gridTemplateColumns: '1fr 1fr',
                gap: '1rem',
            }}
        >

            <FormControl className='form_control' sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
                <TextField
                    inputRef={nameRef}
                    label="Name"
                    name='name'
                    defaultValue={nameRef.current ? nameRef.current.value : ''}
                    variant="outlined"
                    required
                // onChange={handleChange}
                />
            </FormControl>
            <FormControl sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
                <TextField
                    inputRef={mobileRef}
                    label="Mobile"
                    variant="outlined"
                    defaultValue={mobileRef.current ? mobileRef.current.value : ''}
                    type="number"
                    required
                    name='mobile'
                // onChange={handleChange}
                />
            </FormControl>

            <FormControl sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
                <TextField
                    inputRef={emailRef}
                    label="Email"
                    variant="outlined"
                    name='email'
                    defaultValue={emailRef.current ? emailRef.current.value : ''}
                    type="email"
                    required
                // onChange={handleChange}
                />
            </FormControl>

            <FormControl sx={{ gridColumn: isMobile ? 'span 2' : '' }}>
                <TextField
                    inputRef={subjectRef}
                    label="Subject"
                    variant="outlined"
                    defaultValue={subjectRef.current ? subjectRef.current.value : ''}
                    required
                    name='subject'
                // onChange={handleChange}
                />
            </FormControl>

            <FormControl sx={{ gridColumn: 'span 2' }}>
                <TextField
                    id="message-textarea"
                    inputRef={messageRef}
                    defaultValue={messageRef.current ? messageRef.current.value : ''}
                    multiline
                    rows={10}
                    name='message'
                    label="Message"
                    placeholder="Please, leave me a message."
                // onChange={handleChange}

                />
            </FormControl>

            <Stack sx={{ gridColumn: 'span 2' }} spacing={2} direction="column" style={{ marginTop: '20px' }} justifyContent="flex-end">
                <ReCAPTCHA
                    sitekey={process.env.REACT_APP_GOOGLE_SITE_KEY}
                    onChange={onRecaptchaChange}
                    ref={captchaRef}
                />

                {message && (
                    <Typography className='contactMessage' variant="body1" style={messageStyle}>
                        {message}
                    </Typography>
                )}
                <Box
                    display="flex"
                    alignContent="flex-start"
                    flexDirection="column"
                    flexWrap="wrap"
                    justifyContent="flex-start"
                >

                    <button
                        style={{
                            marginTop: '1rem'
                        }}
                        onClick={handleSubmit}
                        className='button btn-send'
                        disabled={btnLabel === 'Sending...'}
                    >
                        {btnLabel}
                    </button>
                </Box>
            </Stack>
        </Box>

    );

}


export default ContactContent;
