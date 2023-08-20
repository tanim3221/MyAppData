function checkProgressAndClickNext() {
    var progressBarFill = document.querySelector('.cs-fill.progress-bar-fill');
    var playPauseButton = document.getElementById('play-pause');
    var nextButton = document.getElementById('next');
    if (progressBarFill && playPauseButton) {
        var ariaValueNow = parseFloat(progressBarFill.getAttribute('aria-valuenow'));
        var ariaValueMax = parseFloat(progressBarFill.getAttribute('aria-valuemax'));
        var ariaPressed = playPauseButton.getAttribute('aria-pressed');
        if ((ariaValueNow === ariaValueMax) && (ariaPressed === 'true')) {
            nextButton.click();
            console.log('Next button clicked');
        }
    }
}

setInterval(checkProgressAndClickNext, 3000);

