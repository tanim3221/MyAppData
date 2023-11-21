function onClick() {
    var continue_btn_txt = document.getElementsByClassName('refresh-button')[0];
    continue_btn_txt.click();
}

setInterval(onClick, 2000);