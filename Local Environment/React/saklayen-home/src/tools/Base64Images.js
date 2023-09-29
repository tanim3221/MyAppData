import { useState, useEffect } from 'react';

const useImageToBase64 = (url, targetWidth = 500, targetHeight = 500) => {
  const [base64, setBase64] = useState(null);

  useEffect(() => {
    const fetchImageAndConvertToBase64 = async () => {
      try {
        const response = await fetch(url, {mode: 'no-cors'});
        const blob = await response.blob();
        
        const img = new Image();
        img.src = URL.createObjectURL(blob);
        
        img.onload = function() {
          // Create canvas and draw image on it with reduced dimensions
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          
          canvas.width = targetWidth;
          canvas.height = targetHeight;
          
          ctx.drawImage(img, 0, 0, targetWidth, targetHeight);

          // Convert canvas to base64
          const reducedBase64 = canvas.toDataURL();
          setBase64(reducedBase64);
        }
      } catch (error) {
        console.error("Failed to fetch and convert image:", error);
      }
    }

    fetchImageAndConvertToBase64();
  }, [url, targetWidth, targetHeight]);

  return base64;
}


export default useImageToBase64;