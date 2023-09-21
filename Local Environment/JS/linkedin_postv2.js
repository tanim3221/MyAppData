let data = []; // This will store the extracted data.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach(element => {
    // Get all span elements inside the current element.
    let spans = element.querySelectorAll('span');
    
    // Check if the 2nd span exists and starts with the specified text.
    if (spans[1] && spans[1].textContent.startsWith("ভ্যাট টিপস")) {
        let titlePattern = spans[1].textContent; // Extract the title as per the given pattern.
        
        // To get the details below the title, let's assume it's the next sibling node's text.
        // You may need to adjust this depending on the exact structure of your HTML.
        let details = spans[1].nextSibling ? spans[1].nextSibling.textContent : "";

        data.push({
            details: titlePattern
        });
    }
});

console.log(data); // This will print the extracted data in the console.
