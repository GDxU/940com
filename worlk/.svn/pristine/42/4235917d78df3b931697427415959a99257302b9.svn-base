/**
 * Created by Administrator on 2016/4/9.
 */
window.addEventListener('load', function() {
    var initX;
    var moveX;
    var X = 0;
    var objX = 0;
    var temp;
    window.addEventListener('touchstart', function(event) {
        // event.preventDefault();
        var obj = event.target.parentNode;
        if (obj.className == "chatroom-li"||obj.className == "chatroom-li-add") {
            initX = event.targetTouches[0].pageX;
            objX = (obj.style.WebkitTransform.replace(/translateX\(/g, "").replace(/px\)/g, "")) * 1;
        }
        if (objX == 0) {
            window.addEventListener('touchmove', function(event) {
                // event.preventDefault();
                var obj = event.target.parentNode;
                if (obj.className == "chatroom-li") {
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X > 0) {
                        obj.style.WebkitTransform = "translateX(" + 0 + "px)";
                    } else if (X < 0) {

                        var l = Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + -l*2 + "px)";
                        if (l > 80) {
                            l = 80;
                            obj.style.WebkitTransform = "translateX(" + -l*2 + "px)";
                            /* console.log(temp !== obj);*/
                            if(temp && temp !== obj){
                                temp.style.WebkitTransform = "translateX(" + 0 + "px)";
                            }
                        }
                    }
                }else if(obj.className == "chatroom-li-add"){
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X > 0) {
                        obj.style.WebkitTransform = "translateX(" + 0 + "px)";
                    } else if (X < 0) {

                        var l = Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + -l + "px)";
                        if (l > 80) {
                            l = 80;
                            obj.style.WebkitTransform = "translateX(" + -l + "px)";
                            /* console.log(temp !== obj);*/
                            if(temp && temp !== obj){
                                temp.style.WebkitTransform = "translateX(" + 0 + "px)";
                            }
                        }
                    }
                }
            });
        } else if (objX < 0) {
            window.addEventListener('touchmove', function(event) {
                // event.preventDefault();
                var obj = event.target.parentNode;
                if (obj.className == "chatroom-li") {
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X > 0) {
                        var r = -80 + Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + r*2 + "px)";
                        if (r > 0) {
                            r = 0;
                            obj.style.WebkitTransform = "translateX(" + r*2 + "px)";
                        }
                    } else { //向左滑动
                        obj.style.WebkitTransform = "translateX(" + -80 + "px)";
                    }
                }else if(obj.className == "chatroom-li-add"){
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X > 0) {
                        var r = -80 + Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + r + "px)";
                        if (r > 0) {
                            r = 0;
                            obj.style.WebkitTransform = "translateX(" + r + "px)";
                        }
                    } else { //向左滑动
                        obj.style.WebkitTransform = "translateX(" + -80 + "px)";
                    }
                }
            });
        }

    });
    window.addEventListener('touchend', function(event) {
        // event.preventDefault();
        var obj = event.target.parentNode;
        if (obj.className == "chatroom-li") {
            objX = (obj.style.WebkitTransform.replace(/translateX\(/g, "").replace(/px\)/g, "")) * 1;
            if (objX > -40) {
                obj.style.WebkitTransform = "translateX(" + 0 + "px)";
            } else {
                obj.style.WebkitTransform = "translateX(" + -160 + "px)";
                if(temp && temp !== obj){
                    temp.style.WebkitTransform = "translateX(" + 0 + "px)";
                }
                temp = obj;
            }
        }else if(obj.className == "chatroom-li-add"){
            objX = (obj.style.WebkitTransform.replace(/translateX\(/g, "").replace(/px\)/g, "")) * 1;
            if (objX > -40) {
                obj.style.WebkitTransform = "translateX(" + 0 + "px)";
            } else {
                obj.style.WebkitTransform = "translateX(" + -80 + "px)";
                if(temp && temp !== obj){
                    temp.style.WebkitTransform = "translateX(" + 0 + "px)";
                }
                temp = obj;
            }
        }
    });
    $(".chatroom-delete").on('touchend', function(e) {
        e.preventDefault();
        $(this).parents('ul').slideUp('fast', function() {
            $(this).remove();
        })
    });
});