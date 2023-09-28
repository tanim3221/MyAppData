import React from 'react';

function AboutContent() {
  return (
    <div className="section-content">
        <div className="page-title">
            <h2>About <span>Me</span></h2>
        </div>
        <div className="row">
            <div className="col-xs-12 col-sm-7 about_me_text" id="aboutmeView"></div>
            <div className="col-xs-12 col-sm-5">
                <div className="info-list" id="info_list">
                    <ul>
                        <li>
                            <span className="title">Birthday</span>
                            <span className="value" id="birthday"></span>
                        </li>
                        <li>
                            <span className="title">Nationality</span>
                            <span className="value" id="nationality"></span>
                        </li>
                        <li>
                            <span className="title">Permanent Address</span>
                            <span className="value" id="permanent_address"></span>
                        </li>
                        <li>
                            <span className="title">Religion</span>
                            <span className="value" id="religion"></span>
                        </li>
                        <li>
                            <span className="title">E-mail</span>
                            <span className="value" id="email"></span>
                        </li>
                        <li>
                            <span className="title">Mobile</span>
                            <span className="value" id="mobile"></span>
                        </li>
                    </ul>
                </div>
                <div className="white-space-10"></div>
                <div className="badge-base LI-profile-badge" data-locale="en_US" data-size="large" data-theme="light" data-type="HORIZONTAL" data-vanity="saklayen" data-version="v1"></div>
            </div>
        </div>
        <div className="white-space-50"></div>

        <Sections title="What I Do" viewId="serviceView" />
        <Sections title="Language" viewId="languagesView" />
        <Sections title="Strength & Attribute" viewId="attributesView" />
        <Sections title="Interest & Hobbies" viewId="interestsView" />
        <Sections title="Fun Facts" viewId="funfactsView" />

    </div>
  );
}

function Sections({ title, viewId }) {
    return (
        <>
            <div className="row">
                <div className="col-xs-12 col-sm-12">
                    <div className="block-title">
                        <h3>{title}</h3>
                    </div>
                </div>
            </div>
            <div className="row" id={viewId}></div>
            <div className="white-space-50"></div>
        </>
    );
}

export default AboutContent;
