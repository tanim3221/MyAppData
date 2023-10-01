import { useState, useEffect } from 'react';

const useImageToBase64 = (url, targetWidth = 500, targetHeight = 500) => {
  const [base64, setBase64] = useState(null);

  useEffect(() => {
    let isMounted = true; // track if component is mounted

    const fetchImageAndConvertToBase64 = async () => {
      try {
        const response = await fetch(url);
        const blob = await response.blob();
        
        const img = new Image();
        
        img.onload = function() {
          if (!isMounted) return; // if component has been unmounted, exit

          // rest of the logic remains the same
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          canvas.width = targetWidth;
          canvas.height = targetHeight;
          ctx.drawImage(img, 0, 0, targetWidth, targetHeight);
          const reducedBase64 = canvas.toDataURL();
          setBase64(reducedBase64);
        }

        img.src = URL.createObjectURL(blob);
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
