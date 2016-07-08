/**
 * Created by Administrator on 2016/7/8.
 */
/*
 JS是lx用的JS
 不做说明一般都支持IE/FF
 $是基于jquery-1.3.2.min.js库
 Date:2011-09
 Author:yxl.cn
 */

var ExamCount = ExamCount || "50";
//$('#ViewExamCount').text(ExamCount);
//$('#order').attr('maxlength',ExamCount.toString().length);

var ExamKssj=45;	if(km=='kms'){ExamKssj=30;}
var ExamM=ExamKssj;
var ExamS=0;
var ExamEnter=0;
var LastTime=new Date('2999/11/12 01:01:01');	/*最后答题的时间*/
function AutoTime()
{
    if (ExamS==-1)
    {
        ExamM-=1;
        ExamS=59;
    }
    if (ExamM==-1 || ExamEnter==1)
    {
        if (ExamM==-1) {alert('亲:)　不好意思，时间到了！');TimeStop('时间到！');}else{TimeStop('已交卷！');}
        ExamSubmit();ExamEnter=1;
        return false;
    }
    var Emm,Ess;
    Emm='0'+ExamM;
    Ess='0'+ExamS;
    if (Emm.length==3) {Emm=ExamM};
    if (Ess.length==3) {Ess=ExamS};
    $('#ViewTime').html('<b>'+Emm+':'+Ess+'</b>');
    ExamS-=1;

    setTimeout("AutoTime()",1000);
}
function TimeStop(str)
{
    var str=str||'时间到！';
    Wink('ViewTime','<i>'+str+'</i>',300);
}

var orderTmp=1;
function vEO(order)
{//view ExamOrder
//进度框显示控制
    //if (isNaN(order)) {$('#order').attr('value','');return false;};
    //order=Math.abs(order);
    if (ExamEnter==1) {return false;}
    if (orderTmp>0)
    {
        var YouKeyVal=ExamDaSel[orderTmp];	//$("#yxl").html(orderTmp+'\n'+YouKeyVal);
        if (YouKeyVal!='&nbsp;' && YouKeyVal!=' ' && YouKeyVal!='') {$('#EOV'+orderTmp).attr('class','ExamOrderViewVisited');} else {$('#EOV'+orderTmp).attr('class','ExamOrderViewWait');}
    }
    $('#EOV'+order).attr('class','ExamOrderViewHover');

    if (orderTmp==order) {return false;}

    //$('#LI'+order).attr('class','Exam_bg_over');
    //$('#LI'+orderTmp).attr('class','Exam_bg_out');

    orderTmp=order;
}


function gotoExam(order)
{//
    order=Math.abs(order);
    vEO(order);

    orderT=Math.abs(order-1);	if(orderT==0){orderT=1;}
    var pos = $('#LI'+orderT).offset().top;
    pos=pos-20;
    $("html,body").animate({scrollTop: pos}, 200);

}
function gotoKey(order,key)
{//
    order=Math.abs(order);
    if(ExamTx[order]==3)
    {//多选题
        EDS=ExamDaSel[order];
        EDS=formatKey(EDS);
        if(key=='A'){if (EDS.indexOf('A')>=0){EDS=EDS.replace(/A/g, '');}else{EDS=EDS+'A';}}
        if(key=='B'){if (EDS.indexOf('B')>=0){EDS=EDS.replace(/B/g, '');}else{EDS=EDS+'B';}}
        if(key=='C'){if (EDS.indexOf('C')>=0){EDS=EDS.replace(/C/g, '');}else{EDS=EDS+'C';}}
        if(key=='D'){if (EDS.indexOf('D')>=0){EDS=EDS.replace(/D/g, '');}else{EDS=EDS+'D';}}
        EDS=formatKey(EDS);
        ExamDaSel[order] = EDS;
    }
    else
    {
        ExamDaSel[order]=""+key+"";
    }

    vEO(order);

    if(order<ExamCount&&ExamTx[order]!=3){gotoExam(order+1);}
}
function formatKey(sv)
{//整理多选答案
    if(!sv){return '';}
    sv=sv.toUpperCase();
    svT='';
    if (sv.indexOf('A')>=0){svT=svT+'A';}
    if (sv.indexOf('B')>=0){svT=svT+'B';}
    if (sv.indexOf('C')>=0){svT=svT+'C';}
    if (sv.indexOf('D')>=0){svT=svT+'D';}
    return svT;
}

function MaxEmTp(tp)
{//考试原图
    var EmTp=tp;
    EmTp=EmTp.replace('/s','');
    MaskHtml=$('#EmTpAreaHtml').html();
    MaskHtml=MaskHtml.replace(/img=/i,"img="+EmTp+"");
    YXL_Mask_Show(MaskHtml,850,450);
    MaskHtml='';
}

function ExamStart()
{
    try
    {
        $('#ELzjlx').click(function (){openwin('http://www.jsyks.com/'+km+'-zjlx/','',1080);});
        $('#ELsxlx').click(function (){openwin('http://www.jsyks.com/'+km+'-sxlx/','',1080);});
        $('#ELsjlx').click(function (){openwin('http://www.jsyks.com/'+km+'-sjlx/','',1080);});
        $('#ELctlx').click(function (){openwin('http://www.jsyks.com/'+km+'-ctj/','',1080);});
        $('#ELmnks').click(function (){openwin('http://app.ybjk.com/ybjk/xc_'+km+'_mnks/','',700,530);});
        $('#ELfzks').click(function (){openwin('http://www.jsyks.com/'+km+'-fzks/','',1080);});
    }
    catch (e)
    {
    }

    vEO(1);
    AutoTime();

    $('#ExamResult').hide();
    //$('body,html').animate({scrollTop: 0}, 800);
}
setTimeout("ExamStart()",1000);

/*
 document.write ("<form id='ExamSubmitFrm' name='ExamSubmitFrm' action='Upshot/' method='POST' target='ifrm'>");
 document.write ("<input type='hidden' name='Drive' id='Drive' value=''>");
 document.write ("<input type='hidden' name='URL' id='URL' value=''>");
 document.write ("<input type='hidden' name='ExamID' id='ExamID' value=''>");
 document.write ("<input type='hidden' name='ExamDa' id='ExamDa' value=''>");
 document.write ("<input type='hidden' name='ExamDaSel' id='ExamDaSel' value=''>");
 document.write ("<input type='hidden' name='ExamTimeV' id='ExamTimeV' value=''>");
 document.write ("<input type='hidden' name='ExamCode' id='ExamCode' value=''>");
 document.write ("<input type='hidden' name='ExamDT' id='ExamDT' value=''>");
 document.write ("<input type='hidden' name='ExamMark' id='ExamMark' value=''>");
 document.write ("</form>");
 */

var Exam_ErrIDs='';
var Exam_ErrIDs_SortID='';
function ExamSubmit()
{//对试卷进行处理 交卷

    var ExamDaSelStr='';
    for (ExmC in ExamIDsArr){DaSel=ExamDaSel[ExmC];if(!DaSel){DaSel='_';}ExamDaSelStr=ExamDaSelStr+','+DaSel;}

    //var esf=document.getElementById('ExamSubmitFrm');
    //esf.ExamDaSel.value=ExamDaSelStr;
    //esf.submit();

    //计算分数
    var Exam_RightIDs='';
    Exam_ErrIDs='';
    var Point=0;
    for (var k=1;k<=ExamCount;k++)
    {
        $('#kInput'+k).hide();	//隐藏答案选项

        ExamIDTmp=ExamIDsArr[k];

        var YouKeyVal=ExamDaSel[k];
        if (YouKeyVal==ExamDa[k])
        {
            Point++;
            DaICO="icoRight";
            Exam_RightIDs=Exam_RightIDs+","+ExamIDTmp;
        }
        else
        {
            DaICO="icoError";
            if(YouKeyVal){Exam_ErrIDs=Exam_ErrIDs+","+ExamIDTmp;Exam_ErrIDs_SortID=Exam_ErrIDs_SortID+","+SortIDsArr[k];}
            $('#EOV'+k).addClass('ExamOrderViewErr');
        }
        if(YouKeyVal){YouKeyVal="<b>"+YouKeyVal+"</b>";}else{YouKeyVal="<i>没有答题</i>";}
        $('#Result'+k).html("<dl class='fcc'><dt><a href='javascript:void(0);' onclick=\"addCTJ('"+ExamIDTmp+"','"+SortIDsArr[k]+"');return false;\" class=\"dn\">加入我的错题集</a><i id='ctj"+ExamIDTmp+"'></i></dt><dd>您的答案："+YouKeyVal+"<img src='"+ICOPath+"transparent.gif' class='"+DaICO+"'> 　　标准答案：<b>"+ExamDa[k]+"</b> 　　<a href='javascript:void(0);' onclick=\"stfx('"+ExamIDTmp+"');return false;\">本题解释</a></dd></dl>");
    }

    if (kTiku==6013) {Point=Point*2;}	//复驾题库只有50题 每题2分
    var PointVal=Point;
    if(Point>=90){
        $("#imgPass").show();$("#imgPass2").show();if(Point==100){PointVal="<strong>"+Point+"</strong>";}else{PointVal="<b>"+PointVal+"</b>";}
    }else{
        $("#imgNoPass").show();$("#imgNoPass2").show();
    }
    $("#PointVal").html(PointVal);

    //接下来展示层处理
    $('#ExamResult').show();

    $('body,html').animate({scrollTop: 20000}, 800);
}


function JDKTop()
{
    var JDKpos = $('#JDKck').offset().top;
    xzval=0;	//修正值 距离顶部的
    $('#JDKck').css("height",xzval+"px");
    JDKpos=parseFloat(Math.abs(JDKpos+xzval));
    var scrollTopV=parseFloat($(window).scrollTop());
    if(scrollTopV>JDKpos)
    {
        $('#JDK').css("top",xzval+"px");
    }
    else
    {
        $('#JDK').css("top",parseFloat(JDKpos-scrollTopV)+"px");
    }
}

$(window).bind("scroll", function(){JDKTop();});


$(document).ready(function(){
    try
    {
        $(".km1zj").bind("click",function(){window.open("http://www.ybjk.com/kmy-zjlx/");});
        $(".km1sx").bind("click",function(){window.open("http://www.ybjk.com/kmy-sxlx/");});
        $(".km1sj").bind("click",function(){window.open("http://www.ybjk.com/kmy-sjlx/");});
        $(".km1zx").bind("click",function(){window.open("http://www.ybjk.com/kmy-zxlx/");});
        $(".km1mn").bind("click",function(){window.open("http://www.ybjk.com/kmy-fzks/");});
        $(".km4zj").bind("click",function(){window.open("http://www.ybjk.com/kms-zjlx/");});
        $(".km4sx").bind("click",function(){window.open("http://www.ybjk.com/kms-sxlx/");});
        $(".km4sj").bind("click",function(){window.open("http://www.ybjk.com/kms-sjlx/");});
        $(".km4zx").bind("click",function(){window.open("http://www.ybjk.com/kms-zxlx/");});
        $(".km4mn").bind("click",function(){window.open("http://www.ybjk.com/kms-fzks/");});
    }
    catch (e)
    {
    }

});



document.writeln('<script type="text/javascript" src="'+document.location.href+'RC.js?'+Math.random()+'"></script>');