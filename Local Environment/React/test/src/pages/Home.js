import React from 'react';
import useImageToBase64 from './Img64';
import './../App.css';


function Home() {
    const imageUrl = "https://api.saklayen.cf/assets/img/9593487dda110b125edacdba7b3058ef.jpg";
    // const base64Image = useImageToBase64(imageUrl, 300, 300);

    // mode 0 = define width e.g 150
    // mode 1 = define ratio e.g 0.3
    const base64Image = useImageToBase64(imageUrl, 1, 1);
    return (
        <div className="App">
            <h1>Welcome to Home</h1>
            <p>This is the home page of our React application.</p>
            {base64Image && <img src={base64Image} className="imgScr" alt="Converted" />}
        </div>
    );
}

export default Home;
