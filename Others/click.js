var clickId = "play-pause-button";
var click = document.getElementById(clickId);
var pressed = click.getAttribute('aria-pressed');
// var label = click.getAttribute('aria-label');

var clickAuto = function(){
if (pressed == "false") {
    click.click();
    console.log("Play start button");
    }
}
setInterval(clickAuto,2000);

var clickId = "play-pause-button";
var click = document.getElementById(clickId);
var pressed = click.getAttribute('aria-pressed');
do {
    click.click();
    console.log("Play start button");
}

while (
    pressed === "false"
);