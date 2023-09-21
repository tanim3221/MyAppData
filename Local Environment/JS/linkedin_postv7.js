let data = []; // This will store the extracted data.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach((element, index) => {
    // Extract all text content from the current element.
    let textContent = element.textContent.trim();

    if (textContent) {
        // Store the details in the array.
        data.push({
            id: index + 1,
            details: textContent
        });
        
        // Print the status to the console.
        console.log(`Processed element ${index + 1} of ${elements.length}`);
    }
});

console.log('All elements processed.');
console.log(data); // This will print the extracted data in the console.
