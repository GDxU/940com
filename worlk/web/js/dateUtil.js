// 对Date的扩展，将 Date 转化为指定格式的String 
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
// 例子： 
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function(fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1,
        //月份 
        "d+": this.getDate(),
        //日 
        "h+": this.getHours(),
        //小时 
        "m+": this.getMinutes(),
        //分 
        "s+": this.getSeconds(),
        //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3),
        //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

function getCurrentDate() {
    return new Date();
};

/***
* 获得本月的起止时间
*/
function getCurrentMonth() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //获得当前月份0-11
    var currentMonth = currentDate.getMonth();
    //获得当前年份4位年
    var currentYear = currentDate.getFullYear();
    //求出本月第一天
    var firstDay = new Date(currentYear, currentMonth, 1);

    //当为12月的时候年份需要加1
    //月份需要更新为0 也就是下一年的第一个月
    if (currentMonth == 11) {
        currentYear++;
        currentMonth = 0; //就为
    } else {
        //否则只是月份增加,以便求的下一月的第一天
        currentMonth++;
    }

    //一天的毫秒数
    var millisecond = 1000 * 60 * 60 * 24;
    //下月的第一天
    var nextMonthDayOne = new Date(currentYear, currentMonth, 1);
    //求出上月的最后一天
    var lastDay = new Date(nextMonthDayOne.getTime() - millisecond);

    //添加至数组中返回
    startStop.push(firstDay);
    startStop.push(lastDay);
    //返回
    return startStop;
}
/***
* 获得本周起止时间
*/
getCurrentWeek = function() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //返回date是一周中的某一天
    var week = currentDate.getDay();
    //返回date是一个月中的某一天
    var month = currentDate.getDate();

    //一天的毫秒数
    var millisecond = 1000 * 60 * 60 * 24;
    //减去的天数
    var minusDay = week != 0 ? week - 1 : 6;
    //alert(minusDay);
    //本周 周一
    var monday = new Date(currentDate.getTime() - (minusDay * millisecond));
    //本周 周日
    var sunday = new Date(monday.getTime() + (6 * millisecond));
    //添加本周时间
    startStop.push(monday); //本周起始时间
    //添加本周最后一天时间
    startStop.push(sunday); //本周终止时间
    //返回
    return startStop;
};
/**
* 返回上一个月的第一天Date类型
* @param year 年
* @param month 月
**/
getPriorMonthFirstDay = function(year, month) {
    //年份为0代表,是本年的第一月,所以不能减
    if (month == 0) {
        month = 11; //月份为上年的最后月份
        year--; //年份减1
        return new Date(year, month, 1);
    }
    //否则,只减去月份
    month--;
    return new Date(year, month, 1);;
};
/**
* 获得该月的天数
* @param year年份
* @param month月份
* */
getMonthDays = function(year, month) {
    //本月第一天 1-31
    var relativeDate = new Date(year, month, 1);
    //获得当前月份0-11
    var relativeMonth = relativeDate.getMonth();
    //获得当前年份4位年
    var relativeYear = relativeDate.getFullYear();

    //当为12月的时候年份需要加1
    //月份需要更新为0 也就是下一年的第一个月
    if (relativeMonth == 11) {
        relativeYear++;
        relativeMonth = 0;
    } else {
        //否则只是月份增加,以便求的下一月的第一天
        relativeMonth++;
    }
    //一天的毫秒数
    var millisecond = 1000 * 60 * 60 * 24;
    //下月的第一天
    var nextMonthDayOne = new Date(relativeYear, relativeMonth, 1);
    //返回得到上月的最后一天,也就是本月总天数
    return new Date(nextMonthDayOne.getTime() - millisecond).getDate();
};

/**
 * 获得上一月的起止日期
* */
getPreviousMonth = function() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //获得当前月份0-11
    var currentMonth = currentDate.getMonth();
    //获得当前年份4位年
    var currentYear = currentDate.getFullYear();
    //获得上一个月的第一天
    var priorMonthFirstDay = getPriorMonthFirstDay(currentYear, currentMonth);
    //获得上一月的最后一天
    var priorMonthLastDay = new Date(priorMonthFirstDay.getFullYear(), priorMonthFirstDay.getMonth(), getMonthDays(priorMonthFirstDay.getFullYear(), priorMonthFirstDay.getMonth()));
    //添加至数组
    startStop.push(priorMonthFirstDay);
    startStop.push(priorMonthLastDay);
    //返回
    return startStop;
};

/**
* 获得上一周的起止日期
*/
getPreviousWeek = function() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //返回date是一周中的某一天
    var week = currentDate.getDay();
    //返回date是一个月中的某一天
    var month = currentDate.getDate();
    //一天的毫秒数
    var millisecond = 1000 * 60 * 60 * 24;
    //减去的天数
    var minusDay = week != 0 ? week - 1 : 6;
    //获得当前周的第一天
    var currentWeekDayOne = new Date(currentDate.getTime() - (millisecond * minusDay));
    //上周最后一天即本周开始的前一天
    var priorWeekLastDay = new Date(currentWeekDayOne.getTime() - millisecond);
    //上周的第一天
    var priorWeekFirstDay = new Date(priorWeekLastDay.getTime() - (millisecond * 6));

    //添加至数组
    startStop.push(priorWeekFirstDay);
    startStop.push(priorWeekLastDay);

    return startStop;
};
/**
 * 获取今天
 * @returns {Array}
 */
function getToday() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //添加至数组
    startStop.push(currentDate);
    startStop.push(currentDate);
    return startStop;
}
/**
 * 获取昨天
 * @returns {Array}
 */
function getYesterday() {
    //起止日期数组
    var startStop = new Array();
    //获取当前时间
    var currentDate = getCurrentDate();
    //一天的毫秒数
    var millisecond = 1000 * 60 * 60 * 24;
    var yesterday = new Date(currentDate.getTime() - millisecond);
    //添加至数组
    startStop.push(yesterday);
    startStop.push(yesterday);
    return startStop;
}