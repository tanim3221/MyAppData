let data = []; // Array to store extracted text.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach(element => {
    // Get all span elements inside the current element.
    let spans = element.querySelectorAll('span');
    
    // Check if the 2nd span exists and starts with the specified text.
    if (spans[1] && spans[1].textContent.startsWith("ভ্যাট টিপস")) {
        data.push(spans[1].textContent); // Add the text of the 2nd span to the data array.
    }
});

console.log(data); // This will output the extracted texts in the console.
