import React, { useEffect, useState } from 'react';
import { fetchData } from '../../auth/api'
import { CircularProgress } from '@mui/material';
import { getProdDevUrl } from '../../tools/commonFunction';

function QualificationSection() {
    const [loading, setLoading] = useState(true);
    const [educations, setEducation] = useState([]);
    const [experiences, setExperience] = useState([]);
    const [certifications, setCertifications] = useState([]);
    const [skills, setSkills] = useState([]);
    const tables = ['education', 'experience', 'certifications', 'skills'];

    useEffect(() => {
        fetchData(tables)
            .then(responseData => {
                const getdata = responseData.saklayen;
                const experience = getdata.experience;
                const certification = getdata.certifications;
                const skill = getdata.skills;
                const education = getdata.education;
                setEducation(education);
                setSkills(skill);
                setCertifications(certification);
                setExperience(experience);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);

    function ExperienceTimeline({ experienceData }) {
        return (
            <div id="experienceTimeline">
                {experienceData.map((item) => (
                    <div className="timeline-item clearfix" key={item.company + item.position}>
                        <div className="left-part">
                            <h5 className="item-period">{item.period}</h5>
                            <span className="item-company">{item.position}</span>
                        </div>
                        <div className="divider"></div>
                        <div className="right-part">
                            <h4 className="item-title">{item.company}</h4>
                            <p>{item.description}</p>
                        </div>
                    </div>
                ))}
            </div>
        );
    }


    function Skills({ skillsData, category }) {
        const getSkillLevelPercentage = (level) => {
            switch (level) {
                case "Beginner":
                    return 60;
                case "Intermediate":
                    return 80;
                case "Advanced":
                    return 100;
                default:
                    return 0;
            }
        };

        if (category === "finance_accounting") {
            return (
                <ul id="skillsContainerFin">
                    {skillsData.filter(item => item.category === "finance_accounting").map(skill => (
                        <li key={skill.skill}>{skill.skill}</li>
                    ))}
                </ul>
            );
        }

        if (category === "coding") {
            return (
                <div id="skillsContainerCode">
                    {skillsData.filter(item => item.category === "coding").map(skill => {
                        const percentage = getSkillLevelPercentage(skill.level);
                        return (
                            <div key={skill.skill} className="clearfix">
                                <div className="skill clearfix">
                                    <h4>{skill.skill}</h4>
                                    <div className="skill-value">{skill.level}</div>
                                </div>
                                <div className={`skill-container skill-${percentage}`}>
                                    <div className="skill-percentage"></div>
                                </div>
                            </div>
                        );
                    })}
                </div>
            );
        }

        if (category === "technology") {
            return (
                <ul id="skillsContainerTech">
                    {skillsData.filter(item => item.category === "technology").map(skill => (
                        <li key={skill.skill}>{skill.skill}</li>
                    ))}
                </ul>
            );
        }

    }


    function Certifications({ certificationsData }) {
        return (
            <div className='row' id="certificationsTimeline">
                {certificationsData.map((item) => (
                    <div
                        className="col-xs-12 col-sm-6"
                        key={item.title + item.issuer}
                        onClick={() => window.open(item.link)}
                    >
                        <div className="certificate-item clearfix">
                            <div className="certi-logo">
                                <img src={`${getProdDevUrl()}/assets/img/${item.icon}`} alt="logo" />
                            </div>
                            <div className="certi-content">
                                <div className="certi-title">
                                    <h4>{item.title}</h4>
                                </div>
                                <div className="certi-id">{item.course_category}</div>
                                <div className="certi-date">
                                    {new Date(item.date).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })}
                                </div>
                                <div className="certi-company">{item.issuer}</div>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        );
    }


    function EducationTimeline({ educationData }) {
        return (
            <div id="educationTimeline">
                {educationData.map((item) => (
                    <div className="timeline-item clearfix" key={item.title}>
                        <div className="left-part">
                            <h5 className="item-period">{item.period}</h5>
                        </div>
                        <div className="divider"></div>
                        <div className="right-part">
                            <h4 className="item-title">{item.title}</h4>
                            {item.department && <p>{item.department}</p>}
                            <p style={{
                                margin: '.7rem 0rem'
                            }}>{item.institution}</p>
                            <p>{item.grade}</p>
                        </div>
                    </div>
                ))}
            </div>
        );
    }

    return (
        <div className="section-content">
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
                        <h2>Qualifications</h2>
                    </div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-7">
                            <div className="block-title">
                                <h3>Education</h3>
                            </div>
                            <div className="timeline timeline-second-style clearfix" id="educationTimeline">
                                <EducationTimeline educationData={educations} />
                            </div>
                            <div className="white-space-50"></div>
                            <div className="block-title">
                                <h3>Experience</h3>
                            </div>
                            <div className="timeline timeline-second-style clearfix" id="experienceTimeline">
                                <ExperienceTimeline experienceData={experiences} />
                            </div>
                        </div>
                        <div className="col-xs-12 col-sm-5 professional_class">
                            <div className="white-space-custom"></div>
                            <div className="block-title">
                                <h3>Finance & Accounting <span>Knowledges</span></h3>
                            </div>
                            <ul className="knowledges" id="skillsContainerFin">
                                <Skills skillsData={skills} category='finance_accounting' />

                            </ul>
                            <div className="white-space-40"></div>
                            <div className="block-title">
                                <h3>Coding <span>Skills</span></h3>
                            </div>
                            <div className="skills-info skills-second-style" id="skillsContainerCode">
                                <Skills skillsData={skills} category='coding' />
                            </div>
                            <div className="white-space-10"></div>
                            <div className="block-title">
                                <h3><span>Technology</span> Knowledges</h3>
                            </div>
                            <ul className="knowledges" id="skillsContainerTech">
                                <Skills skillsData={skills} category='technology' />

                            </ul>
                        </div>
                    </div>
                    <div className="white-space-50"></div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="block-title">
                                <h3>Certifications</h3>
                            </div>
                        </div>
                    </div>
                    <Certifications certificationsData={certifications} />
                </>
            )}
        </div>
    );
}

export default QualificationSection;
