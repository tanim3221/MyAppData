let lastScrollHeight = 0;

function scrollToBottomAndExtract() {
    // Scroll to the bottom of the page.
    window.scrollTo(0, document.body.scrollHeight);

    // Check if the scroll height has changed since the last scroll.
    if (document.body.scrollHeight === lastScrollHeight) {
        extractData(); // Extract data when no more new content loads.
        return;
    }

    lastScrollHeight = document.body.scrollHeight;

    // Continue scrolling after a delay (e.g., 2000ms = 2 seconds).
    setTimeout(scrollToBottomAndExtract, 2000);
}

function extractData() {
    let data = []; // This will store the extracted data.

    // Get all elements with the specified class.
    let elements = document.querySelectorAll('.update-components-text.relative.feed-shared-update-v2__commentary');

    elements.forEach(element => {
        // Get all span elements inside the current element.
        let spans = element.querySelectorAll('span');

        // Check if the 2nd span exists and starts with the specified text.
        if (spans[1] && spans[1].textContent.startsWith("ভ্যাট টিপস")) {
            let titlePattern = spans[1].textContent;

            data.push({
                details: titlePattern
            });
        }
    });

    console.log(data); // This will print the extracted data in the console.
}

// Start the process by scrolling.
scrollToBottomAndExtract();
