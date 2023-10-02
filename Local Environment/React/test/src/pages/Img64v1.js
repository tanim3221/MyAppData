import { useState, useEffect } from 'react';

const useImageToBase64 = (url, targetWidth = 500, targetHeight = 500) => {
  const [base64, setBase64] = useState(null);

  useEffect(() => {
    let isMounted = true; // track if component is mounted

    const fetchImageAndConvertToBase64 = async () => {
      try {
        const response = await fetch(url);
        const blob = await response.blob();

        const convertBlobToBase64 = new Promise((resolve) => {
          const reader = new FileReader();
          reader.readAsDataURL(blob);
          reader.onloadend = () => resolve(reader.result);
        });

        const rawData = await convertBlobToBase64;

        const img = new Image();
        img.onload = function() {
          if (!isMounted) return; // if component has been unmounted, exit

          // Create canvas, draw image on it with the desired dimensions, and get base64
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          canvas.width = targetWidth;
          canvas.height = targetHeight;
          ctx.drawImage(img, 0, 0, targetWidth, targetHeight);
          const reducedBase64 = canvas.toDataURL();
          setBase64(reducedBase64);
        }

        img.src = rawData;  // Set the source to the raw base64 data
      } catch (error) {
        console.error("Failed to fetch and convert image:", error);
      }
    }

    fetchImageAndConvertToBase64();

    return () => { isMounted = false }; // cleanup function

  }, [url, targetWidth, targetHeight]);

  return base64;
}

export default useImageToBase64;
