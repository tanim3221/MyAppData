let data = []; // This will store the extracted data.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach((element, index) => {
    // Extract all text content from the current element.
    let textContent = element.textContent.trim(); // Remove any leading/trailing whitespace.

    if (textContent) {
        data.push({
            id: index + 1, // Assuming you want IDs to start from 1
            details: textContent
        });
    }
});

console.log(data); // This will print the extracted data in the console.
