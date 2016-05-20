<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
  	$.base64.utf8encode = true;
    var ot_sw,ct_sw,hc_sw;//s:true,h:false;
    var ot_s,ct_s,hc_s;//s:true,h:false;
    var ot_cd,ct_cd,hc_cd;
    var ct_d = new Date();
    var ot_d = new Date();
    var req_cd;
    var isNew = true;
    var isAll = true;
    var firstLoad = true;

    function otCountDown(){
        if(ot_d.getUTCMinutes() > 0 || ot_d.getUTCSeconds() > 0) {
            ot_d.setUTCSeconds(ot_d.getUTCSeconds() - 1);
            var ms = ot_d.getUTCMinutes() < 10 ? "0" + ot_d.getUTCMinutes() : ot_d.getUTCMinutes();
            var ss = ot_d.getUTCSeconds() < 10 ? "0" + ot_d.getUTCSeconds() : ot_d.getUTCSeconds();
            if(ot_sw)
                $("#lbljkj").show();
            $("#openTime").text(ms + ":" + ss);
        }else{
            $("#lbljkj").hide();
            $("#openTime").text("正在开奖...");
        }
        if(ot_d.getUTCHours() > 0 && !hc_sw){
            $("#lbljkj").hide();
            ot_sw = false;
        }
        if(ot_sw != ot_s){
            if(ot_sw == true){
                $("#lbljkj").show();
                $("#openTime").show();
            }else{
                $("#lbljkj").hide();
                $("#openTime").hide();
            }
            ot_s = ot_sw;
        }
        ot_cd = setTimeout("otCountDown()", 1000);
    }

    function ctCountDown(){
        if((ct_d.getUTCMinutes() > 0 || ct_d.getUTCSeconds() > 0) && hc_sw) {
            ct_d.setUTCSeconds(ct_d.getUTCSeconds() - 1);
            var ms = ct_d.getUTCMinutes()<10?"0"+ct_d.getUTCMinutes():ct_d.getUTCMinutes();
            var ss = ct_d.getUTCSeconds()<10?"0"+ct_d.getUTCSeconds():ct_d.getUTCSeconds();
            $("#closeTime").text(ms+":"+ss);
            $("#lbljfp").show();
            ot_sw = false;
        }else{
            $("#lbljfp").hide();
            $("#closeTime").text("已封盘");
            hc_sw = false;
            ot_sw = true;
        }
        if(ct_sw != ct_s){
            if(ct_sw == true){
                $("#lbljfp").show();
                $("#closeTime").show();
            }else{
                $("#lbljfp").hide();
                $("#closeTime").hide();
            }
            ct_s = ct_sw;
        }
        ct_cd = setTimeout("ctCountDown()", 1000);
    }

    function hcCountDown(){
        if(hc_sw != hc_s){
            if(hc_sw == true){
                $("input[type='checkbox']").checkboxradio("enable");
            }else{
                $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                showOrderCount();
                $("label").each(function(){
                    $(this).text("0.00");
                });
                $("input[type='checkbox']").checkboxradio("disable");
            }
            hc_s = hc_sw;
        }
        hc_cd = setTimeout("hcCountDown()", 1000);
    }

    var timer = null;
    function blink(ids){
        for(var i=0;i<ids.length;i++){
            $("#"+ids[i]).prev().addClass('myBlink');
        }
        timer = setTimeout(function(){stopBlink(ids);},2000);
    }

    function stopBlink(ids){
        for(var i=0;i<ids.length;i++){
            $("#"+ids[i]).prev().removeClass('myBlink');
        }
        clearTimeout(timer);
    }

    function getRate(){
        if(firstLoad){
        	firstLoad = false;
    		showLoader();
    	}
        //var hc = $("#hcts").jqmData("cht");
        $.getJSON("${ctx}/ssc/bjsc/rate/"+(isAll?"all":"v")+"/"+new Date().getTime(),function(o) {
	        if(o.c == 0){
	            ct_d.setTime(o.closeTime);
	            ot_d.setTime(o.openTime);
	            $("#issue").text(o.issue);
	            $("#ykmoney").html(showColor1(0 == o.ykMoney ? "0.00" : o.ykMoney));
	            $("input[name='issue']").val(o.issue);
	            var ids = new Array();
	            if(o.rateMap != undefined){
	                var i = 0;
	                $.each(o.rateMap,function(k,v){
	                    $.each(v,function(kk,vv){
	                    	var old = $("label[for='"+k+"-"+kk+"']").text();
	                    	var last = Math.round(vv * 1000 )/1000;
	                    	if(old != '' && old != '0.00' && old != last){
	                    		ids[i] = k+"-"+kk;
	                    	}
							if((last + "").split(".").length == 1){
								last = last + ".00"
							}                    	
	                        $("label[for='"+k+"-"+kk+"']").text(last);
	                        i++;
	                    });
	                });
	            }
	            if(o.newIssue != undefined){
	            	if(o.newIssue != $("#nis").text()){
	            		isNew=true;
	            	}
	                $("#nis").text(o.newIssue);
	            }
	            if(o.ball != undefined && isNew){
	                var nrs = o.ball.split(",");
	                $("#nr > span").each(function(i){
	                    $(this).attr("class","number num"+nrs[i]);
	                });
	            }
	            if(ids.length > 0){
	                blink(ids);
	            }
	            if(o.hcStatus == 0 || o.hcStatus == 10 || o.closeTime < 0) {
	                isAll = true;
	                hc_sw = false;
	                req_cd = setTimeout("getRate()", 5000);
	            }else{
	                isAll = false;
	                hc_sw = true;
	                req_cd = setTimeout("getRate()", 20000);
	            }
	            if(isNew){
	                if(ct_cd != undefined)
	                    clearTimeout(ct_cd);
	                if(ot_cd != undefined)
	                    clearTimeout(ot_cd);
	                ctCountDown();
	                otCountDown();
	                isNew = false;
	            }
	       }else{
				alert(o.e);
				window.location.href = ctx + "/index";	       
	       }
        }).fail(function(jqxhr, textStatus, error) {
			if(textStatus == 'error'){
				//alert("网络中断,请检测网络！");
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}
  		}).always(function() {
   			hideLoader();
 		});
    }

    function showOrderCount(){
    	var count = $("input:checked").length;
    	if(count > 0){
			$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
    	}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
    	}
    }

    function showSelected(){
        var ods = "${obj.ods}";
        if(ods!=undefined){
            ods = ods.split(",");
            $.each(ods,function(i,v){
                $("#"+v).prop("checked",true).checkboxradio("refresh");
            });
        }
    }

    $(function(){
        hc_sw = false;
        hcCountDown();
        $("label").addClass("ui-btn-z");//pei率按钮缩小
        showSelected();
        showOrderCount();
        $("input[type='checkbox']").on("click",function(e){
            showOrderCount();
        });
        $("a[name='chc']").on("click",function(e){
            var hc = $(this).attr("hc");
            $("#hcts").attr('class', "btt-" + hc).jqmData("cht", hc);
            $("input[name='hc']").val(hc);
            $("#hdcpPopup").popup( "close" );
            first = true;
            clearTimeout(req_cd);
            req_cd = setTimeout("getRate()", 1000);
        });
        $("#orderBtn").on("click",function(e) {
            if ($("input:checked").length == 0) {
                alert("请先选择号码!");
                e.stopPropagation();
            } else {
                var tempForm = $("#tempForm");
                var items = $("#items").empty();
                $("input:checked").each(function(i){
                    var o = $("label[for='" + $(this).attr("id") + "']");
                    $("<input type='hidden'name='type' value='" + o.attr("for") + "'>").appendTo(items);
                    $("<input type='hidden'name='title' value='" + $.base64.encode(o.attr("title")) + "'>").appendTo(items);
                    $("<input type='hidden'name='rate' value='" + o.text() + "'>").appendTo(items);
                });
                clearTimeout(req_cd);
                tempForm.submit();
            }
        });
        getRate();
    });
</script>