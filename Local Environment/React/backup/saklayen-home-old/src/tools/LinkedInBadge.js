import React, { useEffect } from 'react';

const LinkedInBadge = () => {

  useEffect(() => {
    const script = document.createElement('script');
    script.src = "https://platform.linkedin.com/badges/js/profile.js";
    script.async = true;
    document.body.appendChild(script);
    
    return () => {
      document.body.removeChild(script);
    }
  }, []);

  return (
    <div className="badge-base LI-profile-badge" data-locale="en_US" data-size="large" data-theme="light" data-type="HORIZONTAL" data-vanity="saklayen" data-version="v1">
    </div>
  );
}

export default LinkedInBadge;
