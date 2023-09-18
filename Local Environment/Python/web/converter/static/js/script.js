$(document).ready(function () {
    $(document).on("scroll", onScroll);
    //smoothscroll
    $('.navbar-nav li a[href^="#"]').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");
        $('.navbar-nav li a').each(function () {
            $(this).removeClass('active');
        })
        $(this).addClass('active');
        var target = this.hash
            , menu = target;
        target = $(target);
        $('html, body').stop().animate({
            'scrollTop': target.offset().top + 2
        }, 1000, 'swing', function () {
            window.location.hash = target;
            $(document).on("scroll", onScroll);
        });
    });
});

function onScroll(event) {
    var scrollPos = $(document).scrollTop();
    $('.navbar-nav li a').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('.navbar-nav li a').removeClass("active");
            currLink.addClass("active");
        }
        else {
            currLink.removeClass("active");
        }
    });
}
const dropZone = document.getElementById('dropZone');
const fileInput = document.getElementById('fileInput');

dropZone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropZone.classList.add('drop-zone--over');
});

['dragleave', 'dragend'].forEach(type => {
    dropZone.addEventListener(type, () => {
        dropZone.classList.remove('drop-zone--over');
    });
});

dropZone.addEventListener('drop', (e) => {
    e.preventDefault();

    if (e.dataTransfer.files.length) {
        fileInput.files = e.dataTransfer.files;
        document.getElementById('dropLabel').textContent = e.dataTransfer.files[0].name;
        dropZone.classList.remove('drop-zone--over');
    }
});


fileInput.addEventListener('change', () => {
    if (fileInput.files.length) {
        document.getElementById('dropLabel').textContent = fileInput.files[0].name;
    }
});