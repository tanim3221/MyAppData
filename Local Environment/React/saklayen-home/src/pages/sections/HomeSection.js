import React, { useEffect, useState } from 'react';
import { fetchData } from '../../auth/api';
import {CircularProgress} from '@mui/material';

const HomeSection = () => {
  const [personal, setPersonal] = useState([]);
  const [index, setIndex] = useState(0);
  const [currentText, setCurrentText] = useState("");
  const [currentCharIndex, setCurrentCharIndex] = useState(0);
  const [loading, setLoading] = useState(true);
  // eslint-disable-next-line
  const personalTags = personal && personal.tag ? JSON.parse(personal.tag) : [];
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
        setLoading(false);
      });
      // eslint-disable-next-line
  }, []);

  useEffect(() => {
    if (personalTags.length > 0 && personalTags[index] && currentCharIndex <= personalTags[index].length) {
        const timeoutId = setTimeout(() => {
            setCurrentText(personalTags[index].substr(0, currentCharIndex + 1));
            setCurrentCharIndex(currentCharIndex + 1);
        }, 100);
        return () => clearTimeout(timeoutId);
    } else if (personalTags[index] && currentCharIndex > personalTags[index].length) {
        const timeoutId = setTimeout(() => {
            setIndex((index + 1) % personalTags.length);
            setCurrentCharIndex(0);
            setCurrentText("");
        }, 3000);
        return () => clearTimeout(timeoutId);
    }
  }, [index, currentCharIndex, personalTags]);

  return (
    <div className="section-content vcentered">
      {loading ? (
        <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <CircularProgress 
            style={{
              color: '#5e2fd6'
            }}
          />
        </div>
      ) : (
        <div className="row">
          <div className="col-sm-12 col-md-12 col-lg-12">
            <div className="title-block">
              <h2 id="title_name">{personal.name}</h2>
              <div id="getTag" className="text-rotation">
                <div className="item">
                  <div className="sp-subtitle">
                    <span className="typing-effect">{currentText}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default HomeSection;
