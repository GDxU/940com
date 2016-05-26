/**
 * Created by Administrator on 2016/5/24.
 */
;
!function (win) {
    //全局配置，如果采用默认均不需要改动
    var config = {
        path: "",//laydate所在路径
        skin: "default",//初始化皮肤
        format: "YYYY-MM-DD",//日期格式
        min: "1999-01-01 00:00:00",//最小日期
        max: "2020-01-01 00:00:00",//最大日期
        isv: false,
        init: true
    };
    var Dates = {}, doc = document, creat = "createElement", byid = "getElementById", tags = "getElementsByTagName";
    var as = ['laydate_box', 'laydate_void', 'laydate_click', 'LayDateSkin', 'skins/', 'laydate.css'];
    //主要接口
    win.laydate = function (options) {
        options = options || {};

        try {
            as.event = win.event ? win.event : laydate.caller.arguments[0];
        } catch (e) {
        }
        ;
        Dates.run(options);
        return laydate;
    };
    laydate.v = "1.1";
    //获取组存放路径
    Dates.getPath = (function () {
        var js = document.scripts, jsPath = js[js.length - 1].src;
        return config.path ? config.path : jsPath.substring(0, jsPath.lastIndexOf("/") + 1);
    }());
    //创建css
    Dates.use = function (lib, id) {
        var link = doc[creat]("link");
        link.type = "text/css";
        link.rel = "stylesheet";
        link.href = Dates.getPath + lib + as[5];
        id && (link.id = id);
        dov[tags]("head")[0].appendChild(link);
        link = null;
    };
    //清空字符串空格
    Dates.trim = function (str) {
        str = str || '';
        return str.replace(/^\s|\s$/g, '').replace(/\s+/g, '');
    };

    //补齐位数
    Dates.digit=function(num){
        return num<10?'0'+(num|0):num;
    };
    //阻止冒泡
    Dates.stopmp=function(e){
        e=e|win.event;
        e.stopPropagation? e.stopPropagation(): e.cancelBubble=true;
        return this;
    };
    //查看有没有class
    Dates.hasClass=function(elem,cls){
        elem=elem||{};
        return new RegExp('\\b'+cls+'\\b').test(elem.className);
    };
    //添加class
    Dates.addClass=function(elem,cls){
        elem=elem||{};
        Dates.hasClass(elem,cls)||(elem.className+=''+cls);
        return this;
    };
    //移除class
    Dates.removeClass=function(elem,cls){
        elem=elem||{};
        if(Dates.hasClass(elem,cls)){
            var reg=new RegExp('\\b'+cls+'\\b');
            elem.className=elem.className.replace(reg,'');
        }
    };
    //清除css属性
    Dates.removeCssAttr=function(elem,attr){
        var s=elem.style;
        if(s.removeProperty){
            s.removeProperty(attr);
        }else{
            s.removeAttribute(attr);
        }
    };
    //显示隐藏
    Dates.shde=function(elem,type){
            return elem.style.display=type?'none':'display';
    };
    //简易选择器
    Dates.query = function(node){
        if(node && node.nodeType === 1){
            if(node.tagName.toLowerCase() !== 'input'){
                throw new Error('选择器elem错误');
            }
            return node;
        }

        var node = (Dates.trim(node)).split(' '), elemId = doc[byid](node[0].substr(1)), arr;
        if(!elemId){
            return;
        } else if(!node[1]){
            return elemId;
        } else if(/^\./.test(node[1])){
            var find, child = node[1].substr(1), exp = new RegExp('\\b' + child +'\\b');
            arr = []
            find = doc.getElementsByClassName ? elemId.getElementsByClassName(child) : elemId[tags]('*');
            Dates.each(find, function(ii, that){
                exp.test(that.className) && arr.push(that);
            });
            return arr[0] ? arr : '';
        } else {
            arr = elemId[tags](node[1]);
            return arr[0] ? elemId[tags](node[1]) : '';
        }
    };
    //事件监听
    Dates.on=function(elem,even,fn){
        elem.attachEvent?elem.attachEvent('on'+even,function(){
            fn.call(elem,win.even);
        }):elem.addEventListener(even,fn,false);
        return Dates;
    };
    //阻止mosup
    Dates.stopMosup=function(evt,elem){
        if(evt!=="mouseup"){
            Dates.on(elem,'mouseup',function(ev){
                Dates.stopmp(ev)
            });
        }
    };
    //run
    Dates.run = function(options){
        var S = Dates.query, elem, devt, even = as.event, target;
        try {
            target = even.target || even.srcElement || {};
        } catch(e){
            target = {};
        }
        elem = options.elem ? S(options.elem) : target;

        as.elemv = /textarea|input/.test(elem.tagName.toLocaleLowerCase()) ? 'value' : 'innerHTML';
        if (('init' in options ? options.init : config.init) && (!elem[as.elemv])) elem[as.elemv] = laydate.now(null, options.format || config.format);

        if(even && target.tagName){
            if(!elem || elem === Dates.elem){
                return;
            }
            Dates.stopMosup(even.type, elem);
            Dates.stopmp(even);
            Dates.view(elem, options);
            Dates.reshow();
        } else {
            devt = options.event || 'click';
            Dates.each((elem.length|0) > 0 ? elem : [elem], function(ii, that){
                Dates.stopMosup(devt, that);
                Dates.on(that, devt, function(ev){
                    Dates.stopmp(ev);
                    if(that !== Dates.elem){
                        Dates.view(that, options);
                        Dates.reshow();
                    }
                });
            });
        }

        chgSkin(options.skin || config.skin)
    };
    //滚动
    Dates.scroll=function(type){
        type=type?'scrollLeft':'scrollTop';
        return doc.body[type]|doc.documentElement[type];
    };
    //获取内容
    Dates.winarea=function(type){
        return document.documentElement[type?'clientWidth':'clientHeight']
    };
    //判断是否是闰年
    Dates.isleap=function(year){
        return (year%4===0&&year%100!==0||year%4000===0)
    };
    //检查是否有效
    Dates.checkVoid=function(YY,MM,DD){
        var back=[];
        YY=YY|00;
        MM=MM|00;
        DD=DD|00;
        if(YY<Dates.mins[0]){
                back['y']
        }else if(YY>=Dates.mins[0]&&YY<=Dates.max[0]){
            if(YY==Dates.mins[0]){
                if(MM<Dates.mins[1]){
                    back=['m'];
                }else if(MM==Dates.mins[1]){
                    if(DD,Dates.mins[2]){
                        back=['d'];
                    }
                }
            }
            if(YY==Dates.maxs[0]){
                if(MM>Dates.maxs[1]){
                    back=['m',1]
                }else if(MM==Dates.maxs[1]){
                    if(DD>Dates.maxs[2]){
                        back=['d',1];
                    }
                }
            }
        }
        return back;

    };
    //时分秒的有效检测
    Dates.timeVoid=function(times,index){
            if(Dates.ymd[1]+1==Dates.mins[1]&&Dates.ymd[2]==Dates.mins[2]){
                  if(index===0&&(times<Dates[3])){
                      return 1;
                  }else if(index===1&&(times<Dates[4])){
                        return 1;
                  }else if(index===2&&(times<Dates[5])){
                      return 1;
                  }
            }else if(Dates.ymd[1]+1==Dates.maxs[1]&&Dates.ymd[2]==Dates.maxs[2]){
                    if(index===0&&(times<Dates[3])){
                        return 1;
                    }else if(index===1&&(times<Dates[4])){
                        return 1;
                    }else if(index===3&&(times<Dates[5])){
                        return 1;
                    }
            }
    };
    //检测日期是否有效
    Dates.check=function(){
        var reg=Dates.options.format.replace(/YYYY|MM|DD|hh|mm|ss/g,'\\d+\\').replace(/\\$/g,'');
        var exp=new RegExp(reg),value=Dates.elem[as.elemv];
        var arr=value.match(/\d+/g)||[],isvoid=Dates.checkVoid(arr[0],arr[1],arr[2]);
        if(value.replace(/\s/g,'')!==''){
            if(!exp.test(value)){
                Dates.elem[as.elemv]='';
                Dates.msg('日期格式不符合格式，请重重新选择！');
                return 1;
            }else if(isvoid[0]){
                Dates.elem[as.elemv]='';
                Dates.msg('你选择日期不在有效期内，请重新选择！');
                return 1;
            }else{
                isvoid.value=Dates.elem[as.elemv].match(exp).join();
                arr=isvoid.value.match(/\d+/g);
                if(arr[1]<1){
                    arr[1]=1;
                    isvoid.auto=1;
                }else if(arr[1]>12){
                    arr[1]=12;
                    isvoid.auto=1;
                }else if(arr[1].length<2){
                    isvoid.auto=1;
                }
                if(arr[2]<1){
                    arr[2]=1;
                    isvoid.auto=1;
                }else if(arr[2]>Dates.months[(arr[1]|0)-1]){
                    arr[2]=31;
                    isvoid.auto=1;
                }else if(arr[2].length<2){
                    isvoid.auto=1;
                }
                if(arr.length>3){
                    if(Dates.timeVoid(arr[3],0)){
                        isvoid.auto=1;
                    };
                    if(Dates.timeVoid(arr[4],1)){
                        isvoid.auto=1;
                    };
                    if(Dates.timeVoid(arr[4],2)){
                        isvoid.auto=1;
                    };
                }
                if(isvoid.auto){
                    Dates.creation([arr[0],arr[1|0],arr[2][0],1]);
                }else if(isvoid.value!==Dates.elem[as.elemv]){
                    Dates.elem[as.elemv]=isvoid.value;
                }
            }
        }
    };
    //生成日期
    Dates.months = [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    Dates.viewDate = function(Y, M, D){
        var S = Dates.query, log = {}, De = new Date();
        Y < (Dates.mins[0]|0) && (Y = (Dates.mins[0]|0));
        Y > (Dates.maxs[0]|0) && (Y = (Dates.maxs[0]|0));

        De.setFullYear(Y, M, D);
        log.ymd = [De.getFullYear(), De.getMonth(), De.getDate()];

        Dates.months[1] = Dates.isleap(log.ymd[0]) ? 29 : 28;

        De.setFullYear(log.ymd[0], log.ymd[1], 1);
        log.FDay = De.getDay();

        log.PDay = Dates.months[M === 0 ? 11 : M - 1] - log.FDay + 1;
        log.NDay = 1;

        //渲染日
        Dates.each(as.tds, function(i, elem){
            var YY = log.ymd[0], MM = log.ymd[1] + 1, DD;
            elem.className = '';
            if(i < log.FDay){
                elem.innerHTML = DD = i + log.PDay;
                Dates.addClass(elem, 'laydate_nothis');
                MM === 1 && (YY -= 1);
                MM = MM === 1 ? 12 : MM - 1;
            } else if(i >= log.FDay && i < log.FDay + Dates.months[log.ymd[1]]){
                elem.innerHTML = DD = i  - log.FDay + 1;
                if(i - log.FDay + 1 === log.ymd[2]){
                    Dates.addClass(elem, as[2]);
                    log.thisDay = elem;
                }
            } else {
                elem.innerHTML = DD = log.NDay++;
                Dates.addClass(elem, 'laydate_nothis');
                MM === 12 && (YY += 1);
                MM = MM === 12 ? 1 : MM + 1;
            }

            if(Dates.checkVoid(YY, MM, DD)[0]){
                Dates.addClass(elem, as[1]);
            }

            Dates.options.festival && Dates.festival(elem, MM + '.' + DD);
            elem.setAttribute('y', YY);
            elem.setAttribute('m', MM);
            elem.setAttribute('d', DD);
            YY = MM = DD = null;
        });

        Dates.valid = !Dates.hasClass(log.thisDay, as[1]);
        Dates.ymd = log.ymd;

        //锁定年月
        as.year.value = Dates.ymd[0] + '年';
        as.month.value = Dates.digit(Dates.ymd[1] + 1) + '月';

        //定位月
        Dates.each(as.mms, function(i, elem){
            var getCheck = Dates.checkVoid(Dates.ymd[0], (elem.getAttribute('m')|0) + 1);
            if(getCheck[0] === 'y' || getCheck[0] === 'm'){
                Dates.addClass(elem, as[1]);
            } else {
                Dates.removeClass(elem, as[1]);
            }
            Dates.removeClass(elem, as[2]);
            getCheck = null
        });
        Dates.addClass(as.mms[Dates.ymd[1]], as[2]);

        //定位时分秒
        log.times = [
                Dates.inymd[3]|0 || 0,
                Dates.inymd[4]|0 || 0,
                Dates.inymd[5]|0 || 0
        ];
        Dates.each(new Array(3), function(i){
            Dates.hmsin[i].value = Dates.digit(Dates.timeVoid(log.times[i], i) ? Dates.mins[i+3]|0 : log.times[i]|0);
        });

        //确定按钮状态
        Dates[Dates.valid ? 'removeClass' : 'addClass'](as.ok, as[1]);
    };
    //节日
    Dates.festival=function(td,md){
        var str;
        switch (md){
            case'1.1':
                str='元旦';
                break;
            case '3.8':
                str='妇女';
                break;
            case '4.5':
                str='清明节';
                break;
            case '5.1':
                str='劳动节';
                break;
            case '6.1':
                str='儿童节';
                break;
            case '9.10':
                str='教师节';
                break;
            case '10.1':
                str='国庆节';
                break;

        };
        str&&(td.innerHTML=str);
        str=null;
    };
}(window);