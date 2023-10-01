import React, { useState, useEffect } from 'react';
import { Skeleton } from '@mui/material';
import { Outlet, useNavigate, useLocation } from 'react-router-dom';
import CryptoJS from 'crypto-js';
import { fetchData, generateCv } from '../auth/api';
import { getProdDevUrl } from '../tools/commonFunction';


function Home() {

  const [activeSection, setActiveSection] = useState('home');
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isAnimated, setIsAnimated] = useState(false);
  const [personal, setPersonal] = useState([]);
  const [socialLinks, setSocialLinks] = useState([]);
  const navigate = useNavigate();
  const [isCVLoading, setIsCVLoading] = useState(false);
  const [isDataLoading, setIsDataLoading] = useState(false);
  const [imageLoaded, setImageLoaded] = useState(false);
  const routeLocation = useLocation();

  const menuItems = [
    { id: 'home', icon: 'menu-icon lnr lnr-home', text: 'Home', route: '/home' },
    { id: 'about', icon: 'lnr lnr-user', text: 'About Me', route: '/about' },
    { id: 'qualifications', icon: 'lnr lnr-graduation-hat', text: 'Qualifications', route: '/qualifications' },
    { id: 'portfolio', icon: 'lnr lnr-laptop-phone', text: 'Portfolio', route: '/portfolio' },
    { id: 'contact', icon: 'lnr lnr-envelope', text: 'Contact', route: '/contact' },
  ];

  const tables = ['personalinfo', 'social_links'];

  function disableCopy(e) {
    e.preventDefault();
    return false;
  }

  useEffect(() => {
    fetchData(tables)
      .then(responseData => {
        const getdata = responseData.saklayen;
        const personalinfo = getdata.personalinfo[0];
        const social = getdata.social_links;
        setPersonal(personalinfo);
        setSocialLinks(social);
        setIsDataLoading(true);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setIsDataLoading(false);
      });

    window.addEventListener('resize', mobileMenuHide);
    document.addEventListener('copy', disableCopy);
    document.addEventListener('contextmenu', (e) => {
      e.preventDefault();
    });
    document.addEventListener('keydown', (e) => {
      if ((e.ctrlKey && (e.key === 'c' || e.key === 'u' || e.key === 'C' || e.key === 'U')) ||
        (e.ctrlKey && e.shiftKey && (e.key === 'i' || e.key === 'I'))) {
        e.preventDefault();
      }
    });
    return () => {
      window.removeEventListener('resize', mobileMenuHide);
      document.removeEventListener('copy', disableCopy);
    }

    // eslint-disable-next-line
  }, []);


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


  function navigateToNextSection() {
    const currentIndex = menuItems.findIndex(item => item.id === activeSection);
    const nextIndex = (currentIndex + 1) % menuItems.length;
    setActiveSection(menuItems[nextIndex].id);
    navigate('/' + menuItems[nextIndex].id);
  }

  const currentDate = () => {
    const date = new Date();

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');

    return `${day}${month}${year}${hours}${minutes}${seconds}`;
  };


  const handleDownloadCV = async (e) => {
    e.preventDefault();
    setIsCVLoading(true);
    const date = new Date();
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const ciphertext = CryptoJS.MD5(minutes).toString();
    try {
      const requestData = {
        token: ciphertext
      };
      const response = await generateCv(requestData);

      const blob = new Blob([response], { type: 'application/pdf' });
      await new Promise(resolve => setTimeout(resolve, 0));
      const url = URL.createObjectURL(blob);

      const a = document.createElement('a');
      a.href = url;
      const dateStr = currentDate();
      a.download = `CV_of_Saklayen_Ahmed_${dateStr}.pdf`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    } catch (error) {
      console.error('Error generating PDF:', error);
    } finally {
      setIsCVLoading(false);
    }
  };



  return (
    <div>
      <div className="lm-animated-bg" id="web_home" style={{ backgroundImage: `url(${process.env.PUBLIC_URL}/img/main_bg.png)` }}></div>
      <div className="page" id="mainContent__">
        <div className="page-content">
          <header id="site_header" className={`header ${isAnimated ? 'animate' : ''} ${isMenuOpen ? '' : 'mobile-menu-hide'}`}>
            <div>
              <div className="header-content">
                <div className="header-photo" id="profilePhoto">

                  <div>
                    {!imageLoaded && <Skeleton className='skeletonProfile' variant="circular" />}

                    <img
                      src={`${getProdDevUrl()}/assets/img/` + personal.photo}
                      alt={personal.name}
                      onLoad={() => setImageLoaded(true)}
                      style={imageLoaded ? {} : { display: 'none' }}
                    />
                  </div>
                </div>
                <div className="header-titles">
                  <h2 id="sidebar_name_title">
                    {!isDataLoading
                      ? <Skeleton animation="wave" className='skeletonName' variant='h2'/>
                      : personal.name}
                  </h2>
                  <h4>
                  {!isDataLoading
                      ? <Skeleton className='skeletonTag' variant='h4'/>
                      : 'Tech Enthusiast'}
                  </h4>
                </div>
              </div>
              <ul className="main-menu">
                {menuItems.map(item => (
                  <li key={item.id} className={`menu_li_item ${routeLocation.pathname === item.route ? 'active' : ''}`}>
                    <div onClick={() => handleClick(item.id)} className="nav-anim">
                      <span className={`menu-icon ${item.icon}`}></span>
                      <span className="link-text">{item.text}</span>
                    </div>
                  </li>
                ))}
              </ul>
              <div className="social-links">
                <ul>
                  {socialLinks.map(socialLink => (
                    <li key={socialLink.link}>
                      <a href={socialLink.link} target="_blank" rel="noopener noreferrer">
                        <i className={socialLink.icon}></i>
                      </a>
                    </li>
                  ))}
                </ul>
              </div>

              {personal.cv_download === '1' && (
                <div className="header-buttons">
                  {isCVLoading ? <button className="cv_download_button nav-anim btn btn-primary" disabled="disabled" >Generating CV</button> : <button className="cv_download_button nav-anim btn btn-primary" onClick={handleDownloadCV}>Download CV</button>}
                </div>
              )}

              <div className="copyrights">
                © <span className="get_year">2023</span> | <a href="https://saklayenahmed.cf"><span>{personal.name}</span></a> | All rights reserved.
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
                <Outlet />
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
