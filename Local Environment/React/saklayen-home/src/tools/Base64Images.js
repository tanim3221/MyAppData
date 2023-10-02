import { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { getProdDevUrl } from './commonFunction';


const useImageToBase64 = (imageUrl, mode, val = null) => {
  const [base64, setBase64] = useState(null);
  const valRef = useRef(val);

  useEffect(() => {
    let isMounted = true; 

    const getOpt = (mode, val, width, height, size) => {
      let result = {};
      switch (mode) {
        case 0:
          // Fixed width
          result.rate = val / width;
          result.width = val;
          result.height = height * result.rate;
          break;
        case 1:
          // Ratio size width and height
          result.rate = val;
          result.width = width * val;
          result.height = height * val;
          break;
        case 2:
          // Actual image size width and height
          val *= 1024;
          result.rate = Math.sqrt(size / val);
          result.width = Math.ceil(width / result.rate);
          result.height = Math.ceil(height / result.rate);
          break;
        default:
          break;
      }
      return result;
    };

    const convertImage = async () => {
      try {
        const imgRender = `${getProdDevUrl()}/assets/api/img_base64.php`;
        let response = await axios.post(imgRender, {
          url: imageUrl
        }, {
          responseType: 'arraybuffer'
        });
        let img = new Blob([response.data], { type: response.headers['content-type'] });

        // let responseText = new TextDecoder("utf-8").decode(response.data);
        // console.log(response.headers['content-type']);

        let size = img.size;
        let bitmap = await createImageBitmap(img);

        if (val !== null) {
          valRef.current = val;
        } else if (mode === 0 && val === null) {
          valRef.current = 150;
        } else if (mode === 1 && val === null) {
          valRef.current = 0.3;
        }

        const para = getOpt(mode, valRef.current, bitmap.width, bitmap.height, size);
        let canvas = document.createElement("canvas");
        let ctx = canvas.getContext('2d');
        canvas.width = para.width;
        canvas.height = para.height;
        ctx.drawImage(bitmap, 0, 0, para.width, para.height);

        if (isMounted) {
          setBase64(canvas.toDataURL("image/jpeg", 1));
        }

      } catch (error) {
        if (isMounted) {
          console.error("Failed to fetch the image from server:", error);
        }
        return;
      }
    };

    convertImage();

    return () => {
      isMounted = false;
    }
  }, [imageUrl, mode, val]);

  return base64;
}

export default useImageToBase64;
