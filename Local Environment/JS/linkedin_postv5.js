let data = []; // This will store the extracted data.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach(element => {
    // Extract all text content from the current element.
    let textContent = element.textContent.trim(); // Remove any leading/trailing whitespace.

    if (textContent) {
        data.push(textContent);
    }
});

console.log(data); // This will print the extracted data in the console.
