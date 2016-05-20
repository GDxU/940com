/*左侧菜单*/
var slideout = new Slideout({
    'panel': document.getElementById('main'),
    'menu': document.getElementById('menu'),
    'padding': 256,
    'tolerance': 70,
    'side': 'right'
});

document.querySelector('.js-slideout-toggle').addEventListener('click', function() {
    slideout.toggle();
});

document.querySelector('.menu').addEventListener('click', function(eve) {
    if (eve.target.nodeName === 'A') { slideout.close(); }
});
function aload(t){"use strict";t=t||window.document.querySelectorAll("[data-aload]"),void 0===t.length&&(t=[t]);var a,e=0,r=t.length;for(e;r>e;e+=1)a=t[e],a["LINK"!==a.tagName?"src":"href"]=a.getAttribute("data-aload"),a.removeAttribute("data-aload");return t}
window.onload = function(){
    aload();
    document.querySelector('.iphone').className += ' shown';
};



