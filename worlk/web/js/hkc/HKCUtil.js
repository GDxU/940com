/**
 * Created by Ray on 2014/10/11.
 */
(function () {

    Array.prototype.intersection = function (arry) {
        var ta = new Array();
        var idx = 0;
        if (this.length > 0 && arry != undefined && arry != null && arry.length > 0) {
            for (var i = 0; i < this.length; i++) {
                for (var j = 0; j < arry.length; j++) {
                    if (this[i] == arry[j]) {
                        ta[idx] = this[i];
                        idx++;
                    }
                }
            }
        }
        return ta;
    }

    Array.prototype.contains = function (o) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == o) {
                return true;
            }
        }
        return false;
    }

    Array.prototype.takeColor = function () {
        var tc = new Array();
        var idx = 0;
        for (var i = 0; i < this.length; i++) {
            var color = null;
            var c = null;
            var num = this[i];
            if (red.contains(num)) {
                color = "red";
                c = "r";
            } else if (green.contains(num)) {
                color = "green";
                c = "g";
            } else if (blue.contains(num)) {
                color = "blue";
                c = "b";
            }
            if (color != null) {
                tc[idx] = new Array(num, color, c);
                idx++;
            }
        }
        return tc;
    }

    HKCUtil = function () {
    };

    var single, double, big, small, big_single, big_double, small_single, small_double, sum_single, sum_double, tail_big, tail_small;
    var red_single, red_double, red_big, red_small, green_single, green_double, green_big, green_small, blue_single, blue_double, blue_big, blue_small;

    var red = new Array(01, 02, 07, 08, 12, 13, 18, 19, 23, 24, 29, 30, 34, 35, 40, 45, 46);
    var green = new Array(05, 06, 11, 16, 17, 21, 22, 27, 28, 32, 33, 38, 39, 43, 44, 49);
    var blue = new Array(03, 04, 09, 10, 14, 15, 20, 25, 26, 31, 36, 37, 41, 42, 47, 48);

    var gold = new Array(01, 06, 11, 16, 21, 26, 31, 36, 41, 46);
    var wood = new Array(02, 07, 12, 17, 22, 27, 32, 37, 42, 47);
    var water = new Array(03, 08, 13, 18, 23, 28, 33, 38, 43, 48);
    var fire = new Array(04, 09, 14, 19, 24, 29, 34, 39, 44, 49);
    var soil = new Array(05, 10, 15, 20, 25, 30, 35, 40, 45);


    var mouse = new Array(07, 19, 31, 43);
    var cow = new Array(06, 18, 30, 42);
    var tiger = new Array(05, 17, 29, 41);
    var rabbit = new Array(04, 16, 28, 40);
    var loong = new Array(03, 15, 27, 39);
    var snake = new Array(02, 14, 26, 38);
    var horse = new Array(01, 13, 25, 37, 49);
    var sheep = new Array(12, 24, 36, 48);
    var monkey = new Array(11, 23, 35, 47);
    var chicken = new Array(10, 22, 34, 46);
    var dog = new Array(09, 21, 33, 45);
    var pig = new Array(08, 20, 32, 44);

    var zodiac = new Array(new Array("getMouse", "鼠", "65"), new Array("getCow", "牛", "66"), new Array("getTiger", "虎", "67"), new Array("getRabbit", "兔", "68"), new Array("getLoong", "龙", "69"), new Array("getSnake", "蛇", "70"), new Array("getHorse", "马", "71"), new Array("getSheep", "羊", "72"), new Array("getMonkey", "猴", "73"), new Array("getChicken", "鸡", "74"), new Array("getDog", "狗", "75"), new Array("getPig", "猪", "76"));
    var fiveElm = new Array(new Array("getGold", "{[{6YeR}]}", "92"), new Array("getWood", "木", "93"), new Array("getWater", "水", "94"), new Array("getFire", "火", "95"), new Array("getSoil", "土", "96"));
    var banbo = new Array(new Array("getRedSingle", "红{[{5Y2V}]}", "97"), new Array("getRedDouble", "红{[{5Y+M}]}", "98"), new Array("getRedBig", "红{[{5aSn}]}", "99"), new Array("getRedSmall", "红{[{5bCP}]}", "100"), new Array("getGreenSingle", "绿{[{5Y2V}]}", "105"), new Array("getGreenDouble", "绿{[{5Y+M}]}", "106"), new Array("getGreenBig", "绿{[{5aSn}]}", "107"), new Array("getGreenSmall", "绿{[{5bCP}]}", "108"), new Array("getBlueSingle", "蓝{[{5Y2V}]}", "101"), new Array("getBlueDouble", "蓝{[{5Y+M}]}", "102"), new Array("getBlueBig", "蓝{[{5aSn}]}", "103"), new Array("getBlueSmall", "蓝{[{5bCP}]}", "104"));
    var ballName = {"50":"{[{5Y2V}]}","51":"{[{5Y+M}]}","52":"{[{5aSn}]}","53":"{[{5bCP}]}","54":"{[{5ZCI}]}{[{5Y2V}]}","55":"{[{5ZCI}]}{[{5Y+M}]}","56":"红{[{5rOi}]}","57":"蓝{[{5rOi}]}","58":"绿{[{5rOi}]}","59":"{[{5bC+}]}{[{5aSn}]}","60":"{[{5bC+}]}{[{5bCP}]}","61":"总{[{5Y2V}]}","62":"总{[{5Y+M}]}","63":"总{[{5aSn}]}","64":"总{[{5bCP}]}","65":"鼠","66":"牛","67":"虎","68":"兔","69":"龙","70":"蛇","71":"马","72":"羊","73":"猴","74":"鸡","75":"狗","76":"猪","77":"0{[{5bC+}]}","78":"1{[{5bC+}]}","79":"2{[{5bC+}]}","80":"3{[{5bC+}]}","81":"4{[{5bC+}]}","82":"5{[{5bC+}]}","83":"6{[{5bC+}]}","84":"7{[{5bC+}]}","85":"8{[{5bC+}]}","86":"9{[{5bC+}]}","87":"0{[{5aS0}]}","88":"1{[{5aS0}]}","89":"2{[{5aS0}]}","90":"3{[{5aS0}]}","91":"4{[{5aS0}]}","92":"{[{6YeR}]}","93":"木","94":"水","95":"火","96":"土","97":"红{[{5Y2V}]}","98":"红{[{5Y+M}]}","99":"红{[{5aSn}]}","100":"红{[{5bCP}]}","101":"蓝{[{5Y2V}]}","102":"蓝{[{5Y+M}]}","103":"蓝{[{5aSn}]}","104":"蓝{[{5bCP}]}","105":"绿{[{5Y2V}]}","106":"绿{[{5Y+M}]}","107":"绿{[{5aSn}]}","108":"绿{[{5bCP}]}","999":"和","109":"{[{5Y2V}]}0","110":"{[{5Y2V}]}1","111":"{[{5Y2V}]}2","112":"{[{5Y2V}]}3","113":"{[{5Y2V}]}4","114":"{[{5Y2V}]}5","115":"{[{5Y2V}]}6","116":"{[{5Y2V}]}7","117":"{[{5Y+M}]}0","118":"{[{5Y+M}]}1","119":"{[{5Y+M}]}2","120":"{[{5Y+M}]}3","121":"{[{5Y+M}]}4","122":"{[{5Y+M}]}5","123":"{[{5Y+M}]}6","124":"{[{5Y+M}]}7","125":"{[{5aSn}]}0","126":"{[{5aSn}]}1","127":"{[{5aSn}]}2","128":"{[{5aSn}]}3","129":"{[{5aSn}]}4","130":"{[{5aSn}]}5","131":"{[{5aSn}]}6","132":"{[{5aSn}]}7","133":"{[{5bCP}]}0","134":"{[{5bCP}]}1","135":"{[{5bCP}]}2","136":"{[{5bCP}]}3","137":"{[{5bCP}]}4","138":"{[{5bCP}]}5","139":"{[{5bCP}]}6","140":"{[{5bCP}]}7","141":"234{[{6IKW}]}","142":"5{[{6IKW}]}","143":"6{[{6IKW}]}","144":"7{[{6IKW}]}","145":"总{[{6IKW}]}{[{5Y2V}]}","146":"总{[{6IKW}]}{[{5Y+M}]}","147":"红{[{5rOi}]}","148":"蓝{[{5rOi}]}","149":"绿{[{5rOi}]}","150":"和局"};


    HKCUtil.prototype = {
        constructor: HKCUtil,
        version: "1.2",
        ballName: ballName,
        zodiac: zodiac,
        fiveElm: fiveElm,
        banbo: banbo,
        getSingle: function () {
            if (single == undefined) {
                single = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    if (i % 2 != 0) {
                        single[index] = i;
                        index++;
                    }
                }
            }
            return single;
        }, getDouble: function () {
            if (double == undefined) {
                double = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    if (i % 2 == 0) {
                        double[index] = i;
                        index++;
                    }
                }
            }
            return double;
        }, getBig: function () {
            if (big == undefined) {
                big = new Array();
                var index = 0;
                for (var i = 25; i < 50; i++) {
                    big[index] = i;
                    index++;
                }
            }
            return big;
        }, getSmall: function () {
            if (small == undefined) {
                small = new Array();
                var index = 0;
                for (var i = 1; i < 25; i++) {
                    small[index] = i;
                    index++;
                }
            }
            return small;
        }, getBigSingle: function () {
            if (big_single == undefined) {
                big_single = new Array();
                var index = 0;
                var arry = this.getSingle();
                for (var i = 0; i < arry.length; i++) {
                    if (arry[i] >= 25) {
                        big_single[index] = arry[i];
                        index++;
                    }
                }
            }
            return big_single;
        }, getBigDouble: function () {
            if (big_double == undefined) {
                big_double = new Array();
                var index = 0;
                var arry = this.getDouble();
                for (var i = 0; i < arry.length; i++) {
                    if (arry[i] >= 25) {
                        big_double[index] = arry[i];
                        index++;
                    }
                }
            }
            return big_double;
        }, getSmallSingle: function () {
            if (small_single == undefined) {
                small_single = new Array();
                var index = 0;
                var arry = this.getSingle();
                for (var i = 0; i < arry.length; i++) {
                    if (arry[i] < 25) {
                        small_single[index] = arry[i];
                        index++;
                    }
                }
            }
            return small_single;
        }, getSmallDouble: function () {
            if (small_double == undefined) {
                small_double = new Array();
                var index = 0;
                var arry = this.getDouble();
                for (var i = 0; i < arry.length; i++) {
                    if (arry[i] < 25) {
                        small_double[index] = arry[i];
                        index++;
                    }
                }
            }
            return small_double;
        }, getSumSingle: function () {
            if (sum_single == undefined) {
                sum_single = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    ss = (i + "").split("");
                    if (ss.length < 2) {
                        if (i % 2 != 0) {
                            sum_single[index] = i;
                            index++;
                        }
                    } else {
                        if ((eval(ss[0]) + eval(ss[1])) % 2 != 0) {
                            sum_single[index] = i;
                            index++;
                        }
                    }
                }
            }
            return sum_single;
        }, getSumDouble: function () {
            if (sum_double == undefined) {
                sum_double = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    ss = (i + "").split("");
                    if (ss.length < 2) {
                        if (i % 2 == 0) {
                            sum_double[index] = i;
                            index++;
                        }
                    } else {
                        if ((eval(ss[0]) + eval(ss[1])) % 2 == 0) {
                            sum_double[index] = i;
                            index++;
                        }
                    }
                }
            }
            return sum_double;
        }, getTailBig: function () {
            if (tail_big == undefined) {
                tail_big = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    ss = (i + "").split("");
                    if (ss.length < 2) {
                        if (i >= 5) {
                            tail_big[index] = i;
                            index++;
                        }
                    } else {
                        if (eval(ss[1]) >= 5) {
                            tail_big[index] = i;
                            index++;
                        }
                    }
                }
            }
            return tail_big;
        }, getTailSmall: function () {
            if (tail_small == undefined) {
                tail_small = new Array();
                var index = 0;
                for (var i = 1; i < 50; i++) {
                    ss = (i + "").split("");
                    if (ss.length < 2) {
                        if (i < 5) {
                            tail_small[index] = i;
                            index++;
                        }
                    } else {
                        if (eval(ss[1]) < 5) {
                            tail_small[index] = i;
                            index++;
                        }
                    }
                }
            }
            return tail_small;
        }, getRedBall: function () {
            return red;
        }, getGreenBall: function () {
            return green;
        }, getBlueBall: function () {
            return blue;
        }, getMouse: function () {
            return mouse;
        }, getCow: function () {
            return cow;
        }, getTiger: function () {
            return tiger;
        }, getRabbit: function () {
            return rabbit;
        }, getLoong: function () {
            return loong;
        }, getSnake: function () {
            return snake;
        }, getHorse: function () {
            return horse;
        }, getSheep: function () {
            return sheep;
        }, getMonkey: function () {
            return monkey;
        }, getChicken: function () {
            return chicken;
        }, getDog: function () {
            return dog;
        }, getPig: function () {
            return pig;
        }, getRedSingle: function () {
            if (red_single == undefined) {
                red_single = red.intersection(this.getSingle());
            }
            return red_single;
        }, getRedDouble: function () {
            if (red_double == undefined) {
                red_double = red.intersection(this.getDouble());
            }
            return red_double;
        }, getRedBig: function () {
            if (red_big == undefined) {
                red_big = red.intersection(this.getBig());
            }
            return red_big;
        }, getRedSmall: function () {
            if (red_small == undefined) {
                red_small = red.intersection(this.getSmall());
            }
            return red_small;
        }, getGreenSingle: function () {
            if (green_single == undefined) {
                green_single = green.intersection(this.getSingle());
            }
            return green_single;
        }, getGreenDouble: function () {
            if (green_double == undefined) {
                green_double = green.intersection(this.getDouble());
            }
            return green_double;
        }, getGreenBig: function () {
            if (green_big == undefined) {
                green_big = green.intersection(this.getBig());
            }
            return green_big;
        }, getGreenSmall: function () {
            if (green_small == undefined) {
                green_small = green.intersection(this.getSmall());
            }
            return green_small;
        }, getBlueSingle: function () {
            if (blue_single == undefined) {
                blue_single = blue.intersection(this.getSingle());
            }
            return blue_single;
        }, getBlueDouble: function () {
            if (blue_double == undefined) {
                blue_double = blue.intersection(this.getDouble());
            }
            return blue_double;
        }, getBlueBig: function () {
            if (blue_big == undefined) {
                blue_big = blue.intersection(this.getBig());
            }
            return blue_big;
        }, getBlueSmall: function () {
            if (blue_small == undefined) {
                blue_small = blue.intersection(this.getSmall());
            }
            return blue_small;
        }, getGold: function () {
            return gold;
        }, getWood: function () {
            return wood;
        }, getWater: function () {
            return water;
        }, getFire: function () {
            return fire;
        }, getSoil: function () {
            return soil;
        }
    }

})();