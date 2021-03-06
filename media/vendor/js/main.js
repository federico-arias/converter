$(document).ready(function() {

    var mainMenu = document.getElementsByClassName('menu-main')[1];
    var w = mainMenu.offsetWidth;
    var n = mainMenu.children.length;
    var itemWidth = w/n;
    var i=0;
    mainMenu.style.height='75px';

    for (i; i < n;i++) {
        mainMenu.children[i].style.width=itemWidth + 'px';
        mainMenu.children[i].style.height= '75px';
    }

	// Menú Movil
	$("#menu-movil ul li:last-child").append("<li><a id=" + "menu-movil-cerrar" + ">Cerrar Menú</a></li>");

	$("a#menu-movil-trigger").click(function() {
		$("#menu-movil").slideToggle("fast");
	});

	$("a#menu-movil-cerrar").click(function() {
		$("#menu-movil").slideToggle("fast");
	});

    $('.accordion > details').click(function() {
        $(this).children('summary').siblings().toggle('slow');
        $(this).children('summary').toggleClass('red');
    });

	// Tamaño de fuentes en posts
	$(".fontsize a").click(function() {

		var fsize = $(this).attr('data-size');

		$(".fontsize li").removeClass('current');

		$(this).parent().addClass('current');

		$('.post .texto .contenido p').css('fontSize', fsize + 'px');

	});


    if(!document.querySelector('.tooltip')) return;
    var i=1,
        ttips = document.getElementsByClassName('tooltip'),
        l=ttips.length;

    console.log(ttips.length + ttips[0]);
    for(i;i<=l;i++) {
        //wrap it in sup with text i
        var sup = document.createTextNode('[' + i + ']'),
            ix = i - 1,
            ref = document.createElement('span');

        ref.className = 'reference';
        ref.appendChild(sup);
        ttips[ix].parentElement.insertBefore(ref, ttips[ix]);
        ref.appendChild(ttips[ix]);
        ttips[ix].parentElement.addEventListener('click', toggleTT);
    }

    function toggleTT() {
        //if visibility:visible, hide
        var tT = this.lastChild,
            l = tT.offsetWidth/2 - 5,
            t = tT.children[0].offsetHeight + tT.parentElement.offsetHeight + 5;
        
        tT.style.top = '-' + t + 'px';
        tT.style.left = '-' + l + 'px';
        tT.style.visibility = tT.style.visibility == 'visible' ? 'hidden' : 'visible';
    }

    as = Array.prototype.slice.call(document.getElementsByTagName('a'));
    as.forEach(function(a, i) {
        a.addEventListener('click', function(ev) {
            ev.stopPropagation;
        });
    });



});



function Feedback(el) {
    var self=this;
    this.el=el;
    this.isCorrect = true?
       this.el.children[0].className === "incorrect" :
       false;
    this.el.addEventListener('click', function() {
        self.el.style='display:none;';    
    });
    if (this.isCorrect) {
        feedbacktext='Esto es incorrecto. ';
    } else {
        feedbacktext='Esto es correcto. ';
    }
    this.el.children[0].innerHTML=feedbacktext + this.el.children[0].innerHTML;
}

Feedback.prototype.show = function () {
    this.el.style='display:block;';
}

Feedback.prototype.hide = function () {
    this.el.style='display:none;';
}

function CheckBox(el, options) {
   var path = document.createElementNS('http://www.w3.org/2000/svg', 'path' );
   this.el=el;
   this.svg=el.parentElement.children[2];
   this.svgpath=path;
   this.path=options.path;
   this.animation=options.animation;
   this.el.checked=false;
   this.feedback= new Feedback(el.parentElement.children[3]);
   this.listenToChange();
}

CheckBox.prototype.listenToChange = function() {
    var self = this;

    this.el.addEventListener( 'change', function() {
        if( this.checked ) {
            console.log(self);
            self.draw();
            self.feedback.show();
        }
        else {
            self.reset();
        }
    } );
}

CheckBox.prototype.draw = function () {
    this.svg.appendChild(this.svgpath);
    this.svgpath.setAttributeNS( null, 'd', this.path );
    var length = this.svgpath.getTotalLength();
    // Clear any previous transition
    //path.style.transition = path.style.WebkitTransition = path.style.MozTransition = 'none';
    // Set up the starting positions
    this.svgpath.style.strokeDasharray = length + ' ' + length;
    this.svgpath.style.strokeDashoffset = Math.floor( length ) - 1;
    // Trigger a layout so styles are calculated & the browser
    // picks up the starting position before animating
    this.svgpath.getBoundingClientRect();
    // Define our transition
    this.svgpath.style.transition = this.svgpath.style.WebkitTransition = this.svgpath.style.MozTransition  = 'stroke-dashoffset ' + this.animation.speed + 's ' + this.animation.easing + ' ' + '0s';
    // Go!
    this.svgpath.style.strokeDashoffset = '0';
    
}

CheckBox.prototype.reset = function () {
    this.svgpath.parentNode.removeChild( this.svgpath );
}

var checkboxes = Array.prototype.slice.call(document.getElementsByClassName('checkbox'));

var options = {
    path: ['M6.987,4.774c15.308,2.213,30.731,1.398,46.101,1.398 c9.74,0,19.484,0.084,29.225,0.001c2.152-0.018,4.358-0.626,6.229,1.201c-5.443,1.284-10.857,2.58-16.398,2.524 c-9.586-0.096-18.983,2.331-28.597,2.326c-7.43-0.003-14.988-0.423-22.364,1.041c-4.099,0.811-7.216,3.958-10.759,6.81 c8.981-0.104,17.952,1.972,26.97,1.94c8.365-0.029,16.557-1.168,24.872-1.847c2.436-0.2,24.209-4.854,24.632,2.223 c-14.265,5.396-29.483,0.959-43.871,0.525c-12.163-0.368-24.866,2.739-36.677,6.863c14.93,4.236,30.265,2.061,45.365,2.425 c7.82,0.187,15.486,1.928,23.337,1.903c2.602-0.008,6.644-0.984,9,0.468c-2.584,1.794-8.164,0.984-10.809,1.165 c-13.329,0.899-26.632,2.315-39.939,3.953c-6.761,0.834-13.413,0.95-20.204,0.938c-1.429-0.001-2.938-0.155-4.142,0.436 c5.065,4.68,15.128,2.853,20.742,2.904c11.342,0.104,22.689-0.081,34.035-0.081c9.067,0,20.104-2.412,29.014,0.643 c-4.061,4.239-12.383,3.389-17.056,4.292c-11.054,2.132-21.575,5.041-32.725,5.289c-5.591,0.124-11.278,1.001-16.824,2.088 c-4.515,0.885-9.461,0.823-13.881,2.301c2.302,3.186,7.315,2.59,10.13,2.694c15.753,0.588,31.413-0.231,47.097-2.172 c7.904-0.979,15.06,1.748,22.549,4.877c-12.278,4.992-25.996,4.737-38.58,5.989c-8.467,0.839-16.773,1.041-25.267,0.984 c-4.727-0.031-10.214-0.851-14.782,1.551c12.157,4.923,26.295,2.283,38.739,2.182c7.176-0.06,14.323,1.151,21.326,3.07 c-2.391,2.98-7.512,3.388-10.368,4.143c-8.208,2.165-16.487,3.686-24.71,5.709c-6.854,1.685-13.604,3.616-20.507,4.714 c-1.707,0.273-3.337,0.483-4.923,1.366c2.023,0.749,3.73,0.558,5.95,0.597c9.749,0.165,19.555,0.31,29.304-0.027 c15.334-0.528,30.422-4.721,45.782-4.653'],
    animation: { speed : 0.2, easing : 'ease-in-out' },
}

checkboxes.forEach(function(el, i) {new CheckBox(el, options);});






