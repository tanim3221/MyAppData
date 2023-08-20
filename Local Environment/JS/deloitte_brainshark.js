function onClick() {

    var play_pause_btn = document.getElementById('play-pause-button');
    var continue_btn_txt = document.getElementsByClassName('mat-button-wrapper');
    var checkboxes = document.querySelectorAll('.mat-checkbox-inner-container:not(.mat-checkbox-checked)');
    var continue_btn = document.getElementsByClassName('mat-focus-indicator');
    var play_pause_txt = play_pause_btn.textContent || play_pause_btn.innerText;
    var continue_txt = continue_btn_txt[0].textContent || continue_btn_txt[0].innerText;
    var submit_btn = document.querySelector('button.mat-raised-button');

    if (play_pause_txt == "play_arrow") {
        play_pause_btn.click();
    }
    if ((continue_txt == " CONTINUE ") || (continue_txt == " SUBMIT ")) {
        continue_btn[0].click();
    }
    if (checkboxes.length > 0) {
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].classList.add('mat-checkbox-checked');
            checkboxes[i].click();
        }
    }
    if (submit_btn && submit_btn.offsetParent !== null && submit_btn.disabled === false) {
        submit_btn.click();
    }
}

setInterval(onClick, 3000);