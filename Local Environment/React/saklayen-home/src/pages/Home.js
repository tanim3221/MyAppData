import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Outlet, useNavigate } from 'react-router-dom';

import { getProdDevUrl } from '../tools/commonFunction';

const apiUrl = `${getProdDevUrl()}/assets/api`;

// eslint-disable-next-line
function Home() {

  const [activeSection, setActiveSection] = useState('home');
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isAnimated, setIsAnimated] = useState(false);
  const navigate = useNavigate();
  const setToken = '';

  const menuItems = [
    { id: 'home', icon: 'menu-icon lnr lnr-home', text: 'Home', route: '/home' },
    { id: 'about', icon: 'lnr lnr-user', text: 'About Me', route: '/about' },
    { id: 'qualifications', icon: 'lnr lnr-graduation-hat', text: 'Qualifications',route: '/qualifications' },
    { id: 'portfolio', icon: 'lnr lnr-laptop-phone', text: 'Portfolio',route: '/portfolio' },
    { id: 'contact', icon: 'lnr lnr-envelope', text: 'Contact',route: '/contact' },
  ];

  const handleClick = (sectionId) => {
    const menuItem = menuItems.find(item => item.id === sectionId);
    if (menuItem && menuItem.route) {
      navigate(menuItem.route);
    }
    setActiveSection(sectionId);
    mobileMenuHide();
  };

  const handleToggleClick = () => {
    setIsAnimated(true);
    setIsMenuOpen(!isMenuOpen);
  };

  const mobileMenuHide = () => {
    const windowWidth = window.innerWidth;

    if (windowWidth < 1025) {
      setIsMenuOpen(false);
      setTimeout(() => {
        setIsAnimated(true);
      }, 500);
    } else {
      setIsAnimated(false);
    }
  };

  useEffect(() => {
    window.addEventListener('resize', mobileMenuHide);
    return () => {
      window.removeEventListener('resize', mobileMenuHide);
    }
  }, []);



  function navigateToNextSection() {
    const currentIndex = menuItems.findIndex(item => item.id === activeSection);
    const nextIndex = (currentIndex + 1) % menuItems.length;
    setActiveSection(menuItems[nextIndex].id);
    navigate('/' + menuItems[nextIndex].id);
  }

  const currentDate = () => {
    const date = new Date();
    return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
  };

  const handleDownload = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post(`${apiUrl}/requests.php`, {
        generate_pdf: true
      }, {
        headers: {
          'Content-Type': 'application/json',
        }
      });

      // Convert data to Blob
      const blob = new Blob([response.data], { type: 'application/pdf' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `CV_of_Saklayen_Ahmed_${currentDate()}.pdf`;
      a.click();
      URL.revokeObjectURL(url);
    } catch (error) {
      console.log('Error generating PDF:', error);
    }

  };


  return (
    <div>
      <div className="lm-animated-bg" id="web_home" token={setToken} style={{ backgroundImage: `url(${process.env.PUBLIC_URL}/img/main_bg.png)` }}></div>
      <div className="page" id="mainContent__">
        <div className="page-content">
          <header id="site_header" className={`header ${isAnimated ? 'animate' : ''} ${isMenuOpen ? '' : 'mobile-menu-hide'}`}>
            <div>
              <div className="header-content">
                <div className="header-photo" id="profilePhoto"><img src={`${process.env.PUBLIC_URL}/img/man.png`} alt="Saklayen Ahmed" /></div>
                <div className="header-titles">
                  <h2 id="sidebar_name_title"> Saklayen Ahmed</h2>
                  <h4>Tech Enthusiast</h4>
                </div>
              </div>
              <ul className="main-menu">
                {menuItems.map(item => (
                  <li key={item.id} className={`menu_li_item ${item.id === 'home' ? 'active' : ''}`}>
                    <div onClick={() => handleClick(item.id)} className="nav-anim">
                      <span className={`menu-icon ${item.icon}`}></span>
                      <span className="link-text">{item.text}</span>
                    </div>
                  </li>
                ))}
              </ul>
              <div className="social-links"></div>
              <div className="header-buttons">
                <button onClick={handleDownload} className="cv_download_button nav-anim btn btn-primary">Download CV</button>
              </div>
              <div className="copyrights">
                © <span className="get_year">2023</span> | <a href="https://saklayenahmed.cf"><span>Saklayen Ahmed</span></a> | All rights reserved.
              </div>
            </div>
          </header>
          <div className={`menu-toggle ${isMenuOpen ? 'open' : ''}`} onClick={handleToggleClick}>
            <span></span>
            <span></span>
            <span></span>
          </div>
          <div className="content-area">
            <div id="animatedContent" className="animated-sections">
              <section className="animated-section ps section-active">
                <Outlet/>
              </section>
              <div className="lmpixels-arrows-nav" onClick={navigateToNextSection}>
                <div className="chevron"></div>
                <div className="chevron"></div>
                <div className="chevron"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Home;
