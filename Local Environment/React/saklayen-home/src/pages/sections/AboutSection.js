import React, { useEffect, useState } from 'react';
import { fetchData } from '../../auth/api';
import { CircularProgress } from '@mui/material';

function AboutContent() {
    const [personal, setPersonal] = useState([]);
    const [service, setService] = useState([]);
    const [languages, setLanguages] = useState([]);
    const [aboutme, setAboutMe] = useState([]);
    const [funfacts, setFunfacts] = useState([]);
    const [attributes, setAttributes] = useState([]);
    const [interests, setInterests] = useState([]);
    const [loading, setLoading] = useState(true);

    const tables = ['personalinfo', 'services', 'languages', 'aboutme', 'funfacts', 'attributes', 'interests'];
    useEffect(() => {
        fetchData(tables)
            .then(responseData => {
                const getdata = responseData.saklayen;
                const personalinfo = getdata.personalinfo[0];
                const services = getdata.services;
                const about = getdata.aboutme;
                const funfact = getdata.funfacts;
                const interest = getdata.interests;
                const attribute = getdata.attributes;
                const language = getdata.languages;
                setPersonal(personalinfo);
                setAboutMe(about);
                setAttributes(attribute);
                setInterests(interest);
                setService(services);
                setFunfacts(funfact);
                setLanguages(language);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);

    function AboutMeDescription({ about }) {
        if (about.title === "Additional Description") {
            return <p className='aboutDesc'>{about.description}</p>;
        }
        return null;
    }

    function AboutMeItem({ about }) {
        if (about.title !== "Additional Description") {
            return (
                <li>
                    <span className="title">{about.title}: </span>
                    <span>{about.description}</span>
                </li>
            );
        }
        return null;
    }

    function FunFactItem({ funfact }) {
        return (
            <div className="col-xs-12 col-sm-4">
                <div className="fun-fact gray-default">
                    <i className={funfact.icon}></i>
                    <h4>{funfact.title}</h4>
                    <span className="fun-fact-block-value">{funfact.value}</span>
                    <span className="fun-fact-block-text">{funfact.description}</span>
                </div>
            </div>
        );
    }

    function AttributeItem({ attribute }) {
        return (
            <div className="col-xs-12 col-sm-6">
                <div className="col-inner">
                    <div className="info-list-w-icon">
                        <div className="info-block-w-icon">
                            <div className="ci-text">
                                <p>{attribute.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

    function InterestItem({ interest }) {
        return (
            <div className="col-xs-12 col-sm-6">
                <div className="col-inner">
                    <div className="info-list-w-icon">
                        <div className="info-block-w-icon">
                            <div className="ci-icon">
                                <i className={interest.icon}></i>
                            </div>
                            <div className="ci-text">
                                <h4>{interest.title}</h4>
                                <p>{interest.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
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
                <>
                    <div className="page-title">
                        <h2>About <span>Me</span></h2>
                    </div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-7 about_me_text" id="aboutmeView">
                            <div id="aboutmeView">
                                <div className="info-list">
                                    <ul>
                                        {aboutme.map(about => <AboutMeItem key={about.id} about={about} />)}
                                    </ul>
                                </div>
                                {aboutme.map(about => <AboutMeDescription key={about.id} about={about} />)}
                            </div>
                        </div>
                        <div className="col-xs-12 col-sm-5">
                            <div className="info-list" id="info_list">
                                <ul>
                                    <li>
                                        <span className="title">Birthday</span>
                                        <span className="value" id="birthday">{personal.birthday}</span>
                                    </li>
                                    <li>
                                        <span className="title">Nationality</span>
                                        <span className="value" id="nationality">{personal.nationality}</span>
                                    </li>
                                    <li>
                                        <span className="title">Permanent Address</span>
                                        <span className="value" id="permanent_address">{personal.permanent_address}</span>
                                    </li>
                                    <li>
                                        <span className="title">Religion</span>
                                        <span className="value" id="religion">{personal.religion}</span>
                                    </li>
                                    <li>
                                        <span className="title">E-mail</span>
                                        <span className="value" id="email">{personal.email}</span>
                                    </li>
                                    <li>
                                        <span className="title">Mobile</span>
                                        <span className="value" id="mobile">{personal.mobile}</span>
                                    </li>
                                </ul>
                            </div>
                            <div className="white-space-10"></div>
                            <div className="badge-base LI-profile-badge" data-locale="en_US" data-size="large" data-theme="light" data-type="HORIZONTAL" data-vanity="saklayen" data-version="v1"></div>
                        </div>
                    </div>
                    <div className="white-space-50"></div>

                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>What <span>I Do</span></h3>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        {service.map(item => (
                            <div className="col-xs-12 col-sm-6" key={item.id}>
                                <div className="col-inner">
                                    <div className="info-list-w-icon">
                                        <div className="info-block-w-icon">
                                            <div className="ci-icon">
                                                <i className={item.icon}></i>
                                            </div>
                                            <div className="ci-text">
                                                <h4>{item.title}</h4>
                                                <p>{item.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                    <div className="white-space-50"></div>

                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Language<span></span></h3>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        {languages.map(language => (
                            <div key={language.id} className="col-xs-12 col-sm-6">
                                <div className="col-inner">
                                    <div className="info-list-w-icon">
                                        <div className="info-block-w-icon">
                                            <div className="ci-icon">
                                                <i className={language.icon}></i>
                                            </div>
                                            <div className="ci-text">
                                                <h4>{language.title}</h4>
                                                <p>{language.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))}
                    </div>
                    <div className="white-space-50"></div>

                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Interest & <span>Hobbies</span></h3>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        {interests.map(interest => <InterestItem key={interest.id} interest={interest} />)}
                    </div>
                    <div className="white-space-50"></div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Strenth & <span>Attribute</span></h3>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        {attributes.map(attribute => <AttributeItem key={attribute.id} attribute={attribute} />)}
                    </div>
                    <div className="white-space-50"></div>

                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Fun <span>Facts</span></h3>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        {funfacts.map(funfact => <FunFactItem key={funfact.id} funfact={funfact} />)}
                    </div>


                </>
            )}
        </div>
    )
}

export default AboutContent;
