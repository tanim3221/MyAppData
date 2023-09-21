let data = []; // This will store the extracted data.

// Get all elements with the specified class.
let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

elements.forEach(element => {
    // Instead of specifically looking for the 2nd span, we'll check all spans.
    let spans = element.querySelectorAll('span');
    
    spans.forEach(span => {
        if (span.textContent.startsWith("ভ্যাট টিপস")) {
            let titlePattern = span.textContent;

            // For the details, let's grab the next sibling's text (if available).
            let details = span.nextSibling ? span.nextSibling.textContent : "";

            data.push({
                details: titlePattern
            });
        }
    });
});

console.log(data); // This will print the extracted data in the console.
