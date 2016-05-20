<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/hkc/combet.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<%@include file="/WEB-INF/page/hkc/games/hkcutil.jsp"%>
<script type="text/javascript">
$(function(){
	$("label").addClass("ui-btn-z");//赔率按钮缩小
	$("label").addClass("ui-btn-visible");
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gamec").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	//getRateInfo();
	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
	$("#tc_" + tcode).addClass('ui-btn-active');
	changeGame($("#gamec").val(),0);
	setOpenBall($("#oball").val());
	countdown();
	$("[name='ball']").each(function(){//给每个球增加样式
		var tcl = '';//ball red-ball
		if(hkcutil.getRedBall().contains($(this).html())){
			tcl = 'ball red-ball';
		}else if(hkcutil.getBlueBall().contains($(this).html())){
			tcl = 'ball blue-ball';
		}else if(hkcutil.getGreenBall().contains($(this).html())){
			tcl = 'ball green-ball';
		}
		$(this).addClass(tcl);
	});
	$("#cancelBtn").on("click",function(){//取消下{[{5rOo}]}按钮
		initParam();//取消下{[{5rOo}]}时需要把已经设置的提交参数取消掉
		$.mobile.changePage("#rateInfoPage", {changeHash:false, transition:'none'});
		$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
		$("#tc_" + tcode).addClass('ui-btn-active');
	});
	$("#submitBtn").on("click",function(){//提交{[{5rOo}]}{[{5Y2V}]}
		subch();
	});
	$("input[type='checkbox']").on("click",function(){
		if(tcode == '02'){//拖{[{5aS0}]}投{[{5rOo}]}
			if(ttn<minn-1){//拖{[{5aS0}]}投{[{5rOo}]}的{[{5aS0}]}点击后就固定{[{5LiN}]}能修改，并且改变颜色
				$(this).parent().parent().addClass("ui-state-disabled");
				$(this).prev().css("color","red");
				ttn++;
			}
		}else if(tcode == '05'){
			var qts = 0;
			$("[name='qry']").each(function(){
    			if($(this).prop("checked")){
    				qts++;
    			}
    		});
    		if(qts>10){
    			//alert('A区最多只能选择10个号码！');
				$(this).prop("checked",false).checkboxradio("refresh");
				setTimeout("alert('A区最多只能选择10个号码！');",200);
				return;
    		}
    		var hts = 0;
			$("[name='hry']").each(function(){
    			if($(this).prop("checked")){
    				hts++;
    			}
    		});
    		if(hts>10){
    			//alert('B区最多只能选择10个号码！');
				$(this).prop("checked",false).checkboxradio("refresh");
				setTimeout("alert('B区最多只能选择10个号码！');",200);
				return;
    		}
		}else{
			if($("input:checked").length>10){
				//alert('最多只能选择10个号码！');
				$(this).prop("checked",false).checkboxradio("refresh");
				setTimeout("alert('最多只能选择10个号码！');",200);
				return;
			}
		}
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
        	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
    $("input[type='radio']").on("click",function(e){//{[{5Y2V}]}选按钮各种{[{5a+5}]}碰
        var name = this.name;//name="swsq" id="sq-76"   name="swwh" id="wh-1"
        var tnum = this.id.split('-')[1];//号码
        if('q'==name.substring(name.length-1,name.length)){
        	if(dpmk['h']['vm'] != tnum){//dpmk{[{5Lit}]}保存了{[{5a+5}]}碰玩法{[{5Lit}]}后一个号码的信息，{[{5a+5}]}碰{[{5LiN}]}能前一个号码与后一个号码一样
        		if(dpq != name){//记录{[{5rOo}]}{[{5Y2V}]}数
	        		dpn++;
		        	dpq = name;
	        	}
	        	if(sxns[tnum]){//
	        		var nums = eval("hkcutil."+sxns[tnum]+"()");
	        		var tnums = '';
	        		for(var i=0;i<nums.length;i++){
	        			var temn = nums[i];
	        			if(temn<10){
	        				temn = '0' + temn;
	        			}
	        			if(i!=nums.length-1){
	        				tnums += temn + ',';
	        			}else{
	        				tnums += temn;
	        			}
	        		}
	        		dpmk['q']['num'] = tnums;//生{[{6IKW}]}或{[{5bC+}]}数所代表的号码，如鼠{[{5a+5}]}应07,19,31,43
	        		dpmk['q']['vm'] = tnum;//生{[{6IKW}]}或{[{5bC+}]}数的号码，如65 鼠
	        	}else{
	        		dpmk['q']['num'] = wsmk[tnum].num;
	        		dpmk['q']['vm'] = tnum;
	        	}
        	}else{
        		$(this).prop("checked",false).checkboxradio("refresh");
        		if(dpmk['q']['num'].length>0){
        			dpmk['q']['nm'] = {};
	        		dpmk['q']['num'] = {};
	        		dpmk['q']['vm'] = {};
	        		dpq = '';
	        		dpn--;
        		}
        		setTimeout(function(){
        			var btem = replaceAllHtml('{[{5LiN}]}能选择相同的生{[{6IKW}]}或{[{5bC+}]}数,请重新选择！');
        			alert(btem);
        		},200);
        		//alert('{[{5LiN}]}能选择相同的生{[{6IKW}]}或{[{5bC+}]}数,请重新选择！');
        	}
        }else if('h'==name.substring(name.length-1,name.length)){
        	if(dpmk['q']['vm'] != tnum){
        		if(dph != name){
	        		dpn++;
		        	dph = name;
	        	}
	        	if(sxns[tnum]){
	        		var nums = eval("hkcutil."+sxns[tnum]+"()");
	        		var tnums = '';
	        		for(var i=0;i<nums.length;i++){
	        			var temn = nums[i];
	        			if(temn<10){
	        				temn = '0' + temn;
	        			}
	        			if(i!=nums.length-1){
	        				tnums += temn + ',';
	        			}else{
	        				tnums += temn;
	        			}
	        		}
	        		dpmk['h']['num'] = tnums;
	        		dpmk['h']['vm'] = tnum;
	        	}else{
	        		dpmk['h']['num'] = wsmk[tnum].num;
	        		dpmk['h']['vm'] = tnum;
	        	}
        	}else{
        		$(this).prop("checked",false).checkboxradio("refresh");
        		if(dpmk['h']['num'].length>0){
        			dpmk['h']['nm'] = {};
	        		dpmk['h']['num'] = {};
	        		dpmk['h']['vm'] = {};
	        		dph = '';
	        		dpn--;
        		}
        		setTimeout(function(){
        			var btem = replaceAllHtml('{[{5LiN}]}能选择相同的生{[{6IKW}]}或{[{5bC+}]}数,请重新选择！');
        			alert(btem);
        		},200);
        		//alert('{[{5LiN}]}能选择相同的生{[{6IKW}]}或{[{5bC+}]}数,请重新选择！');
        	}
        }
        $("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").addClass('spnicon').text(dpn);
    });
    $("#orderBtn").on("click",function(){
    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");//提交{[{5rOo}]}{[{5Y2V}]}按钮取消失效状态
   		var qv = '';
   		var hv = '';
    	if((tcode == '01' || tcode == '02') && $("input:checked").length < minn){//{[{5aSN5byP}]}或拖{[{5aS0}]}
   			var btem = replaceAllHtml('请至少选择' + minn + '个号码！');
   			alert(btem);
   			return;
    	}else if(tcode == '03' || tcode == '04' || tcode == '06'){//生{[{6IKW}]}{[{5a+5}]}碰 {[{5bC+}]}数{[{5a+5}]}碰 生{[{5bC+}]}{[{5a+5}]}碰
    		if(dpmk['q']['num'].length == undefined || dpmk['h']['num'].length == undefined){
	    		var btem = replaceAllHtml('请选择{[{5a+5}]}碰的生{[{6IKW}]}或{[{5bC+}]}数！');
	    		alert(btem);
	    		return;
    		}
    	}else if(tcode == '05'){//任意{[{5a+5}]}碰 
    		var ql = 0;
    		var hl = 0;
    		$("[name='qry']").each(function(){
    			if($(this).prop("checked")){
    				ql++;
    				qv += this.id.split('-')[1] + ',';
    			}
    		});
    		$("[name='hry']").each(function(){
    			if($(this).prop("checked")){
    				hl++;
    				hv += this.id.split('-')[1] + ',';
    			}
    		});
    		if(ql == 0){
    			alert('A区至少选择一个号码！');
    			return;
    		}
    		if(ql == 0 || hl == 0){
    			alert('B区至少选择一个号码！');
    			return;
    		}
    		if(ql == 1 && hl == 1 && hv == qv){
    			alert('如果只选一个号码，A区和B区不能选择一个相同的号码！');
	    		return;
    		}
    	}
    	
    	if(tcode == '03' || tcode == '04' || tcode == '06'){//生{[{6IKW}]}{[{5a+5}]}碰 {[{5bC+}]}数{[{5a+5}]}碰 生{[{5bC+}]}{[{5a+5}]}碰
    		//根据号码获取{[{6LWU546H}]}数据
    		var tqn = dpmk['q']['num'].split(',');
    		var qrate = '';
    		for(var i=0;i<tqn.length;i++){
    			var o = $("label[for='" + tqn[i] + "']");
    			if(i!=tqn.length-1){
    				qrate += o.text() + ', ';
    			}else{
    				qrate += o.text();
    			}
    		}
    		var thn = dpmk['h']['num'].split(',');
    		var hrate = '';
    		for(var i=0;i<thn.length;i++){
    			var o = $("label[for='" + thn[i] + "']");
    			if(i!=thn.length-1){
    				hrate += o.text() + ', ';
    			}else{
    				hrate += o.text();
    			}
    		}
    		//下{[{5rOo}]}页面展示号码已经{[{6LWU546H}]}数据
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	        str += "前球号：</span><span class='font-size12'>" + dpmk['q']['num'] + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + qrate + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += "后球号：</span><span class='font-size12'>" + dpmk['h']['num'] + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + hrate + "</span></td></tr>";
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		//根据前位号码以及后位号码组{[{5ZCI}]}，并展示组{[{5ZCI}]}信息
    		var rzh = dpzh(dpmk['q']['num'],qrate,dpmk['h']['num'],hrate)
    		str = '<div class="mainframe01 mgtop6">';
    		for(var i=0;i<rzh.length;i++){
    			str += '<div class="border-result">' + rzh[i] + '</div>';
    		}
    		str += '</div>';
    		$("#zdl").html(str);
    		$("#zdn").html(rzh.length);
    		//根据玩法类型设置提交参数（具体依据网页版设置）
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_betType").val(tcode);
    		$("#p_betBallStr").val(dpmk['q']['num'] + '#' + dpmk['h']['num']);
    		$("#p_noteCount").val(rzh.length);
    		$("#p_pgameCode").val('15');
    		$("#p_rateStr").val(qrate + '#' + hrate);
    		
	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    	getUserInfo();
    	}
    	
    	if(tcode == '05'){//任意{[{5a+5}]}碰
    		//获取号码{[{6LWU546H}]}数据
    		var tqn = qv.substring(0, qv.length-1).split(',');
    		var qrate = '';
    		for(var i=0;i<tqn.length;i++){
    			var o = $("label[for='" + tqn[i] + "']");
    			if(i!=tqn.length-1){
    				qrate += o.text() + ', ';
    			}else{
    				qrate += o.text();
    			}
    		}
    		var thn = hv.substring(0, hv.length-1).split(',');
    		var hrate = '';
    		for(var i=0;i<thn.length;i++){
    			var o = $("label[for='" + thn[i] + "']");
    			if(i!=thn.length-1){
    				hrate += o.text() + ', ';
    			}else{
    				hrate += o.text();
    			}
    		}
    		//下{[{5rOo}]}页面展示号码{[{6LWU546H}]}数据
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	        str += "前球号：</span><span class='font-size12'>" + qv.substring(0, qv.length-1) + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + qrate + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += "后球号：</span><span class='font-size12'>" + hv.substring(0, hv.length-1) + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + hrate + "</span></td></tr>";
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		//根据前位号码以及后位号码组{[{5ZCI}]}，并展示组{[{5ZCI}]}信息
    		var rzh = dpzh(qv.substring(0, qv.length-1),qrate,hv.substring(0, hv.length-1),hrate)
    		str = '<div class="mainframe01 mgtop6">';
    		for(var i=0;i<rzh.length;i++){
    			str += '<div class="border-result">' + rzh[i] + '</div>';
    		}
    		str += '</div>';
    		$("#zdl").html(str);
    		$("#zdn").html(rzh.length);
    		//根据玩法类型设置提交参数（具体依据网页版设置）
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_betType").val(tcode);
    		$("#p_betBallStr").val(qv.substring(0, qv.length-1) + '#' + hv.substring(0, hv.length-1));
    		$("#p_noteCount").val(rzh.length);
    		$("#p_pgameCode").val('15');
    		$("#p_rateStr").val(qrate + "#" + hrate);
    		
	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    	getUserInfo();
    	}
    	
    	if(tcode == '01'){//{[{5aSN5byP}]}
    		var parr = new Array();
    		var n = 0;
    		$("[name='fstt']").each(function(){
    			if($(this).prop("checked")){
    				parr[n++] = this.id;
    			}
    		});
    		var nra = [];
    		var nst = '';
    		var rst = '';
    		for(var i=0;i<parr.length;i++){
    			var o = $("label[for='" + parr[i] + "']");
    			nra[parr[i]] = o.text();
    			if(i+1 != parr.length){
    				nst += parr[i] + ', ';
    				rst += o.text() + ', ';
    			}else{
    				nst += parr[i];
    				rst += o.text() ;
    			}
    		}
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	        str += "球号：</span><span class='font-size12'>" + nst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		var rarr = new Array();
    		getComb(0,'',parr,minn,rarr);
    		str = '<div class="mainframe01 mgtop6">';
    		for(var i=0;i<rarr.length;i++){
    			var tn = rarr[i].substring(0,rarr[i].length-1);
    			var tr = Number.MAX_VALUE;
    			var tr1 = tr;
    			var tr2 = tr;
    			var tar = tn.split(',');
    			var temtn = '';
    			for(var j=0;j<tar.length;j++){
    				if(!isNaN(nra[tar[j]])){
	    				tr = Math.min(tr,nra[tar[j]]);
    				}else{
    					var tem = nra[tar[j]].split('/');
    					tr1 = Math.min(tr1,tem[0]);
    					tr2 = Math.min(tr2,tem[1]);
    					tr = tr1 + '/' + tr2;
    				}
    				if(j<tar.length-1){
    					temtn += temtn + ', '
    				}
    			}
    			str += '<div class="border-result">' + tn + ' (' + tr + ')</div>';
    		}
    		str += '</div>';
    		//console.log(str);
    		$("#zdl").html(str);
    		$("#zdn").html(rarr.length);
    		
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_betType").val(tcode);
    		$("#p_betBallStr").val(nst);
    		$("#p_noteCount").val(rarr.length);
    		$("#p_pgameCode").val('15');
    		$("#p_rateStr").val(rst);
    		
	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    	getUserInfo();
    	}
    	
    	if(tcode == '02'){//拖{[{5aS0}]}
    		var parr = new Array();
    		var tarr = new Array();
    		var n = 0;
    		var m = 0;
    		$("[name='fstt']").each(function(){
    			if($(this).prop("checked")){
    				if($(this).prev().attr("style").indexOf("red")>-1){
    					tarr[m++] = this.id;
    				}else{
    					parr[n++] = this.id;
    				}
    			}
    		});
    		parr = tarr.concat(parr);//拖{[{5aS0}]}投{[{5rOo}]}{[{5aS0}]}{[{5bC+}]}的号码
    		var nra = [];
    		var nst = '';
    		var rst = '';
    		//拖{[{5aS0}]}投{[{5rOo}]}组{[{5ZCI}]}算法
    		for(var i=0;i<parr.length;i++){
    			var o = $("label[for='" + parr[i] + "']");
    			nra[parr[i]] = o.text();
    			if(i+1 != parr.length){
    				nst += parr[i] + ', ';
    				rst += o.text() + ', ';
    			}else{
    				nst += parr[i];
    				rst += o.text() ;
    			}
    		}
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	        str += "球号：</span><span class='font-size12'>" + nst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		var rarr = new Array();
    		if(minn == 4){
    			for(var i=3;i<parr.length;i++){
	    			rarr.push(parr[0] + ',' + parr[1] + ',' + parr[2] + ',' + parr[i]);
	    		}
    		}else if(minn == 3){
    			for(var i=2;i<parr.length;i++){
	    			rarr.push(parr[0] + ',' + parr[1] + ',' + parr[i]);
	    		}
    		}else if(minn == 2){
    			for(var i=1;i<parr.length;i++){
	    			rarr.push(parr[0] + ',' + parr[i]);
	    		}
    		}
    		str = '<div class="mainframe01 mgtop6">';
    		for(var i=0;i<rarr.length;i++){
    			var tn = rarr[i];
    			var tr = Number.MAX_VALUE;
    			var tr1 = tr;
    			var tr2 = tr;
    			var tar = tn.split(',');
    			for(var j=0;j<tar.length;j++){
    				if(!isNaN(nra[tar[j]])){
	    				tr = Math.min(tr,nra[tar[j]]);
    				}else{
    					var tem = nra[tar[j]].split('/');
    					tr1 = Math.min(tr1,tem[0]);
    					tr2 = Math.min(tr2,tem[1]);
    					tr = tr1 + '/' + tr2;
    				}
    			}
    			str += '<div class="border-result">' + tn + ' (' + tr + ')</div>';
    		}
    		str += '</div></div>';
    		$("#zdl").html(str);
    		$("#zdn").html(rarr.length);
    		
    		$("#p_betBallStr").val(nst);
    		$("#p_betType").val(tcode);
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_noteCount").val(rarr.length);
    		$("#p_pgameCode").val('15');
    		$("#p_rateStr").val(rst);
    		$("#p_tuoType").val(gmmk[$("#gamec").val()]-1);
    		
	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    	getUserInfo();
    	}
    });
});

//切换盘口，重新加载赔率
function changeHandType(){
	isAll = true;
	getRateInfo();
}
	
function getComb(i,str,parr,n,rarr){//{[{5aSN5byP}]}投{[{5rOo}]}组{[{5ZCI}]}算法
	if(n==0){
		rarr.push(str);
		return;
	}
	if(i==parr.length){
		return;
	}
	getComb(i+1,str+parr[i]+",",parr,n-1,rarr);
	getComb(i+1,str,parr,n,rarr);
}

function dpzh(qn,qr,hn,hr){//生{[{6IKW}]}{[{5a+5}]}碰，{[{5bC+}]}数{[{5a+5}]}碰，生{[{5bC+}]}{[{5a+5}]}碰组{[{5ZCI}]}算法
	var qna = qn.split(',');//前位号码组{[{5ZCI}]}
	var qra = qr.split(',');//前卫{[{6LWU546H}]}组{[{5ZCI}]}
	var hna = hn.split(',');//后位号码组{[{5ZCI}]}
	var hra = hr.split(',');//后位号码组{[{5ZCI}]}
	var rzh = [];
	var k = 0;
	var temzuh = new Array();
	for(var i=0;i<qna.length;i++){
		for(var j=0;j<hna.length;j++){
			if(qna[i] != hna[j] && temzuh.indexOf(hna[j] + qna[i])<0){//前位号码跟后位号码{[{5LiN}]}能一样 或者 03,07与07,03
				temzuh.push(qna[i] + hna[j]);
				if(!isNaN(qra[i])){//号码为{[{5Y2V}]}个{[{6LWU546H}]}
					rzh[k++] = qna[i] + ',' + hna[j] + '(' + Math.min(qra[i],hra[j]) + ')';
				}else{//号码为多个{[{6LWU546H}]} 53/36
					rzh[k++] = qna[i] + ',' + hna[j] + '(' + Math.min(qra[i].split('/')[0],hra[j].split('/')[0]) + '/' + Math.min(qra[i].split('/')[1],hra[j].split('/')[1]) +')';
				}
			}
		}
	}
	return rzh;
}

function changeGame(gm,flag){
	subGammeCode = gm
	if(1==flag){
		tcode = '01';
	}
	isAll = true;
	$("#gamec").val(gm);
	$("#tc_" + tcode).trigger("click");
	//changeTcode(tcode);
	//getRateInfo();
	minn = gmmk[gm];
	if(minn>2 || gm =="1507" || gm =="1508" || gm =="1509" || gm =="1510"){//玩法{[{5rOo}]}{[{5Y2V}]}数{[{5aSn}]}于3的没有生{[{6IKW}]}{[{5a+5}]}碰等玩法
		$("#tc_03").hide();
		$("#tc_04").hide();
		$("#tc_05").hide();
		$("#tc_06").hide();
	}else{
		$("#tc_03").show();
		$("#tc_04").show();
		$("#tc_05").show();
		$("#tc_06").show();
	}
}
function changeTcode(tc){
	var tsdiv = tcodeO[tc];
	for(var o in tcodeO){
		$("#" + tcodeO[o]).hide();
	}
	$("#" + tsdiv).show();
	for(var i=1;i<7;i++){
		$("#tc_0" + i).removeClass('ui-btn-active');
	}
	tcode = tc;
	$("#tc_" + tcode).addClass('ui-btn-active');
	isAll = true;
	getRateInfo();
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	//拖{[{5aS0}]}玩法的投按钮失效解除以及{[{6LWU546H}]}{[{54m5}]}殊颜色恢复
	$("[name='fstt']").each(function(){
		$(this).parent().parent().removeClass("ui-state-disabled");
		$(this).prev().css("color","black");
	});
	$("input[type='radio']").prop("checked",false).checkboxradio("refresh");
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
	dpq = '';
	dph = '';
	dpn = 0;
	dpmk = {'q':{'nm':{},'num':{},'vn':{}},'h':{'nm':{},'num':{},'vn':{}}};
	ttn = 0;
}

var hkcutil = new HKCUtil();
var dpq = '';//生{[{6IKW}]}，{[{5bC+}]}数，生{[{5bC+}]}{[{5a+5}]}碰{[{5Lit}]}，选择前位号码
var dph = '';//生{[{6IKW}]}，{[{5bC+}]}数，生{[{5bC+}]}{[{5a+5}]}碰{[{5Lit}]}，选择后位号码
var dpn = 0;//{[{5a+5}]}碰计数
var dpmk = {'q':{'nm':{},'num':{},'vn':{}},'h':{'nm':{},'num':{},'vn':{}}};
var tcode= '01';
var minn = 2;
var gmmk = {'1503':2,'1504':2,'1505':2,'1501':3,'1502':3,'1506':4,'1507':2,'1508':3,'1509':3,'1510':4};//各种玩法{[{5a+5}]}应每{[{5rOo}]}号码个数
var tcodeO = {'01':'fstt', '02':'fstt','03':'sxdp', '04':'swdp','05':'rydp','06':'wsdp'};//子玩法{[{5a+5}]}应DIV的ID，用于控制展示
var ttn = 0;
var subGammeCode = "1503";

//号码{[{5a+5}]}应生{[{6IKW}]}数组
var sxns = {'65':'getMouse','66':'getCow','67':'getTiger',
'68':'getRabbit','69':'getLoong','70':'getSnake','71':'getHorse',
'72':'getSheep','73':'getMonkey','74':'getChicken','75':'getDog','76':'getPig'};

//号码{[{5a+5}]}应{[{5bC+}]}数数组
var wsmk = {'0':{'nm':'0{[{5bC+}]}','num':'10,20,30,40'},'1':{'nm':'1{[{5bC+}]}','num':'01,11,21,31,41'},'2':{'nm':'2{[{5bC+}]}','num':'02,12,22,32,42'},'3':{'nm':'3{[{5bC+}]}','num':'03,13,23,33,43'},'4':{'nm':'4{[{5bC+}]}','num':'04,14,24,34,44'},
'5':{'nm':'5{[{5bC+}]}','num':'05,15,25,35,45'},'6':{'nm':'6{[{5bC+}]}','num':'06,16,26,36,46'},'7':{'nm':'7{[{5bC+}]}','num':'07,17,27,37,47'},'8':{'nm':'8{[{5bC+}]}','num':'08,18,28,38,48'},'9':{'nm':'9{[{5bC+}]}','num':'09,19,29,39,49'}};

var otime = ${obj.interval / 1000};//开盘请求间隔时间
var ctime = 60;//封盘请求间隔时间
var stime = otime;
var flagrate = 0;
setInterval(function(){
	if(flagrate == 1){
		if(s == 0){
			stime--;
			if(stime<=0){
				stime=ctime;
				getRateInfo();
			}
			$("#close_id").html(' 已封盘');
			$("#cdt").html('');
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			$("input[type='radio']").checkboxradio("disable");
		}else if(s == 1){
			stime--;
			if(stime<=0){
				stime=otime;
				getRateInfo();
			}
			$("#close_id").html('');
			if(fd == 1){
				$("input[type='checkbox']").checkboxradio("enable");
				if(minn<=2 && !(subGammeCode =="1507" || subGammeCode =="1508" || subGammeCode =="1509" || subGammeCode =="1510")){
					$("#tc_03").show();
					$("#tc_04").show();
					$("#tc_05").show();
					$("#tc_06").show();
				}
			}else{
				$("#tc_03").hide();
				$("#tc_04").hide();
				$("#tc_05").hide();
				$("#tc_06").hide();
			}
			$("input[type='radio']").checkboxradio("enable");
		}
	}
},1000);

var isAll = true;
var cv;
var s = 1;//0：封盘；1：开盘
var fd = 1;
function getRateInfo(){
	var url = ctx + '/hkc/rate/' + $("#gamec").val() + "/" + (isAll?"a":cv);
	$.getJSON(url, {t:new Date().getTime()}, function(obj){
		if(obj.c==0){
			flagrate = 1;
			s = obj.s;
			var ids = new Array();
			var k = 0;
			var rmap = obj.r;
			for(o in obj.r){
				if(tcode=='05'){//任意{[{5a+5}]}碰{[{6LWU546H}]}{[{54m5}]}殊处理
					var qor = $('[for="q-'+ o +'"]');
					var hor = $('[for="h-'+ o +'"]');
					var trate = rmap[o][0];
					if(0 != rmap[o][1]){
						trate += '/' + rmap[o][1];
					}
					if($("#q-"+o).length>0 && qor.text() != '0.00' && qor.text() != trate){
						ids[k++] = 'q-' + o;
						ids[k++] = 'h-' + o;
					}
					qor.text(trate);
					hor.text(trate);
				}else{
					var or = $('[for="'+ o +'"]');
					var trate = rmap[o][0];
					if(0 != rmap[o][1]){
						trate += '/' + rmap[o][1];
					}
					if($("#"+o).length>0 && or.text() != '0.00' && or.text() != trate){
						ids[k++] = o;
					}
					if(0 == rmap[o][2]){
						or.text('封单');
						$("#"+o).prev().css('color','red');
						$("#"+o).checkboxradio("disable");
						fd = 0;
					}else{
						fd = 1;
						$("#"+o).prev().css('color','#000000');
						if(s==1){
							$("#"+o).checkboxradio("enable");
						}
						or.text(trate);
					}
				}
			}
			if(ids.length>0&&!isAll){
				blink(ids);
			}
			cv = obj.v;
			if(isAll){
            	isAll = false;
            }
		}else{
			alert(obj.e);
			window.location.href = ctx + "/index";
		}
		hideLoader();
	},"json").fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = ctx + "/login";
		}     		
	});
}

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

</script>
</head>
<c:set var="page_title" value="{[{6L+e}]}{[{56CB}]}" scope="request"/>
<body>
	<div  data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/hkc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<input type="hidden" id="gamec" value="${obj.game}">
		<input type="hidden" id="oball" value="${obj.oball}">
		<input type="hidden" id="sealTime" value="${obj.sealTime}">
		<div data-role="content" id="rateRefInfo">
			<div style="text-align: center;">
			<div class="ui-on-lottery">	
	            <div id="openball" alt="ob" class="ob">
	            </div>
	           
	            <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" >${obj.iss}</span> {[{5pyf}]} <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
	            </div>
	        </div>
	        <div class="list_dingtime">
			<div data-role="navbar">
				<!--  
			    <ul>
			        <li><a href="#" id="gamec_1503" onclick="changeGame('1503','1')" data-ajax="false">二全{[{5Lit}]}</a></li>
			        <li><a href="#" id="gamec_1504" onclick="changeGame('1504','1')" data-ajax="false">二{[{5Lit}]}{[{54m5}]}</a></li>
			        <li><a href="#" id="gamec_1505" onclick="changeGame('1505','1')" data-ajax="false">{[{54m5}]}串</a></li>
			    </ul>
			    <ul>
			    	<li><a href="#" id="gamec_1501" onclick="changeGame('1501','1')" data-ajax="false">三全{[{5Lit}]}</a></li>
			        <li><a href="#" id="gamec_1502" onclick="changeGame('1502','1')" data-ajax="false">三{[{5Lit}]}二</a></li>
			    	<li></li>
			    </ul>
			    -->
			    <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
			    	${i.first ? "<ul>":""}
			    	<c:choose>
			    	<c:when test="${pc.gameCode == null}"><li>&nbsp;&nbsp;</li></c:when>
			    	<c:otherwise><li><a href="#" id="gamec_${pc.gameCode}" onclick="changeGame('${pc.gameCode}','1')" ${i.index == 0 ? "class='ui-btn-active'":""}>${pc.gameName}</a></li></c:otherwise>
			    	</c:choose>
                	${((i.index + 1) % obj.perLineNum == 0 && !i.last) ? "</ul><ul>":""}
                	${i.last ? "</ul>":""}
                </c:forEach>
		
			</div>
			<div class="mgtop6"></div>
			<div data-role="navbar">
			    <ul>
			        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
			        <li><a href="#" id="tc_02" data-ajax="false" onclick="changeTcode('02')">拖{[{5aS0}]}投{[{5rOo}]}</a></li>
			        <li><a href="#" id="tc_03" data-ajax="false" onclick="changeTcode('03')">生{[{6IKW}]}{[{5a+5}]}碰</a></li>
			    </ul>
			    <ul>
			    	<li><a href="#" id="tc_06" data-ajax="false" onclick="changeTcode('06')">{[{5bC+}]}数{[{5a+5}]}碰</a></li>
			        <li><a href="#" id="tc_04" data-ajax="false" onclick="changeTcode('04')">生{[{5bC+}]}{[{5a+5}]}碰</a></li>
			    	<li><a href="#" id="tc_05" data-ajax="false" onclick="changeTcode('05')">任意{[{5a+5}]}碰</a></li>
			    </ul>
			</div>
			 <div class="table-cotent-lottery">
			<div id="fstt">
				<div class="mainframe01 mgtop6">
				   	<div class="min-overflow">
				   		<div class="div01">
				   			<div class="o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   		<div class="div02">
				   			<div class="o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   	</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">01</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="01" data-mini="true"><label for="01">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">02</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="02" data-mini="true"><label for="02">0.00</label></fieldset></div>
					</div>
					<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">03</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="03" data-mini="true"><label for="03">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">04</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="04" data-mini="true"><label for="04">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">05</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="05" data-mini="true"><label for="05">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">06</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="06" data-mini="true"><label for="06">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">07</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="07" data-mini="true"><label for="07">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">08</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="08" data-mini="true"><label for="08">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">09</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="09" data-mini="true"><label for="09">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">10</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="10" data-mini="true"><label for="10">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">11</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="11" data-mini="true"><label for="11">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">12</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="12" data-mini="true"><label for="12">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">13</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="13" data-mini="true"><label for="13">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">14</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="14" data-mini="true"><label for="14">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">15</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="15" data-mini="true"><label for="15">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">16</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="16" data-mini="true"><label for="16">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">17</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="17" data-mini="true"><label for="17">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">18</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="18" data-mini="true"><label for="18">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">19</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="19" data-mini="true"><label for="19">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">20</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="20" data-mini="true"><label for="20">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">21</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="21" data-mini="true"><label for="21">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">22</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="22" data-mini="true"><label for="22">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">23</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="23" data-mini="true"><label for="23">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">24</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="24" data-mini="true"><label for="24">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">25</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="25" data-mini="true"><label for="25">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">26</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="26" data-mini="true"><label for="26">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">27</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="27" data-mini="true"><label for="27">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">28</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="28" data-mini="true"><label for="28">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">29</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="29" data-mini="true"><label for="29">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">30</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="30" data-mini="true"><label for="30">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">31</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="31" data-mini="true"><label for="31">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">32</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="32" data-mini="true"><label for="32">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">33</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="33" data-mini="true"><label for="33">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">34</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="34" data-mini="true"><label for="34">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">35</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="35" data-mini="true"><label for="35">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">36</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="36" data-mini="true"><label for="36">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">37</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="37" data-mini="true"><label for="37">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">38</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="38" data-mini="true"><label for="38">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">39</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="39" data-mini="true"><label for="39">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">40</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="40" data-mini="true"><label for="40">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">41</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="41" data-mini="true"><label for="41">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">42</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="42" data-mini="true"><label for="42">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">43</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="43" data-mini="true"><label for="43">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">44</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="44" data-mini="true"><label for="44">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">45</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="45" data-mini="true"><label for="45">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">46</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="46" data-mini="true"><label for="46">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">47</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="47" data-mini="true"><label for="47">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">48</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="48" data-mini="true"><label for="48">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">49</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="49" data-mini="true"><label for="49">0.00</label></fieldset></div>	
					</div>
					<div class="clear"></div>          	
			   </div>
			</div>
		   <div id="sxdp" style="display: none">
			   <div class="mainframe-b01 color1 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-65" data-mini="true"><label for="q-65">鼠</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-66" data-mini="true"><label for="q-66">牛</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-67" data-mini="true"><label for="q-67">虎</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-68" data-mini="true"><label for="q-68">兔</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-69" data-mini="true"><label for="q-69">龙</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-70" data-mini="true"><label for="q-70">蛇</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-71" data-mini="true"><label for="q-71">马</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-72" data-mini="true"><label for="q-72">羊</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-73" data-mini="true"><label for="q-73">猴</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-74" data-mini="true"><label for="q-74">鸡</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-75" data-mini="true"><label for="q-75">狗</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxq" id="q-76" data-mini="true"><label for="q-76">猪</label></fieldset></div>
				   	</div>
				   	<div class="clear"></div>
			   </div>
			   <div class="mainframe-b01 color2 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-65" data-mini="true"><label for="h-65">鼠</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-66" data-mini="true"><label for="h-66">牛</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-67" data-mini="true"><label for="h-67">虎</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-68" data-mini="true"><label for="h-68">兔</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-69" data-mini="true"><label for="h-69">龙</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-70" data-mini="true"><label for="h-70">蛇</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-71" data-mini="true"><label for="h-71">马</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-72" data-mini="true"><label for="h-72">羊</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-73" data-mini="true"><label for="h-73">猴</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-74" data-mini="true"><label for="h-74">鸡</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-75" data-mini="true"><label for="h-75">狗</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="sxh" id="h-76" data-mini="true"><label for="h-76">猪</label></fieldset></div>
				   	</div>
				   	<div class="clear"></div>
			   </div>
		   </div>
		   <div id="wsdp" style="display: none">
			   <div class="mainframe-b01  color1 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-0" data-mini="true"><label for="qw-0">0{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-1" data-mini="true"><label for="qw-1">1{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-2" data-mini="true"><label for="qw-2">2{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-3" data-mini="true"><label for="qw-3">3{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-4" data-mini="true"><label for="qw-4">4{[{5bC+}]}</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-5" data-mini="true"><label for="qw-5">5{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-6" data-mini="true"><label for="qw-6">6{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-7" data-mini="true"><label for="qw-7">7{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-8" data-mini="true"><label for="qw-8">8{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsq" id="qw-9" data-mini="true"><label for="qw-9">9{[{5bC+}]}</label></fieldset></div>
				   	</div>
				   	<div class="clear"></div>
			   </div>
			   <div class="mainframe-b01  color2 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-0" data-mini="true"><label for="hw-0">0{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-1" data-mini="true"><label for="hw-1">1{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-2" data-mini="true"><label for="hw-2">2{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-3" data-mini="true"><label for="hw-3">3{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-4" data-mini="true"><label for="hw-4">4{[{5bC+}]}</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-5" data-mini="true"><label for="hw-5">5{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-6" data-mini="true"><label for="hw-6">6{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-7" data-mini="true"><label for="hw-7">7{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-8" data-mini="true"><label for="hw-8">8{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="wsh" id="hw-9" data-mini="true"><label for="hw-9">9{[{5bC+}]}</label></fieldset></div>
				   	</div>	
				   	<div class="clear"></div>
			   </div>
		   </div>
		   <div id="swdp" style="display: none">
			   <div class="mainframe-b01  color1 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-65" data-mini="true"><label for="sq-65">鼠</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-66" data-mini="true"><label for="sq-66">牛</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-67" data-mini="true"><label for="sq-67">虎</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-68" data-mini="true"><label for="sq-68">兔</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-69" data-mini="true"><label for="sq-69">龙</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-70" data-mini="true"><label for="sq-70">蛇</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-71" data-mini="true"><label for="sq-71">马</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-72" data-mini="true"><label for="sq-72">羊</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-73" data-mini="true"><label for="sq-73">猴</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-74" data-mini="true"><label for="sq-74">鸡</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-75" data-mini="true"><label for="sq-75">狗</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swsq" id="sq-76" data-mini="true"><label for="sq-76">猪</label></fieldset></div>
				   	</div>
				   	<div class="clear"></div>
			   </div>
			   <div class="mainframe-b01  color2 mgtop6">
			   		<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-0" data-mini="true"><label for="wh-0">0{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-1" data-mini="true"><label for="wh-1">1{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-2" data-mini="true"><label for="wh-2">2{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-3" data-mini="true"><label for="wh-3">3{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-4" data-mini="true"><label for="wh-4">4{[{5bC+}]}</label></fieldset></div>
				   	</div>
				   	<div class="table-row">
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-5" data-mini="true"><label for="wh-5">5{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-6" data-mini="true"><label for="wh-6">6{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-7" data-mini="true"><label for="wh-7">7{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-8" data-mini="true"><label for="wh-8">8{[{5bC+}]}</label></fieldset></div>
				   		<div class="col"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="swwh" id="wh-9" data-mini="true"><label for="wh-9">9{[{5bC+}]}</label></fieldset></div>
				   	</div>
				   	<div class="clear"></div>	
			   </div>
		   </div>
		   <div id="rydp" style="display: none">
		   		<div class="mainframe01  color3 mgtop6">
		   			<div class="divz">A区</div>
		   			<!--  
		   			<div class="min-overflow">
				   		<div class="div01">
				   			<div class="o-o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   		<div class="div02">
				   			<div class="o-o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-o-number20 title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   	</div>
				   	-->
			   		<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">01</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-01" data-mini="true"><label for="q-01">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">02</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-02" data-mini="true"><label for="q-02">0.00</label></fieldset></div>
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">03</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-03" data-mini="true"><label for="q-03">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">04</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-04" data-mini="true"><label for="q-04">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">05</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-05" data-mini="true"><label for="q-05">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">06</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-06" data-mini="true"><label for="q-06">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">07</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-07" data-mini="true"><label for="q-07">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">08</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-08" data-mini="true"><label for="q-08">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">09</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-09" data-mini="true"><label for="q-09">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">10</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-10" data-mini="true"><label for="q-10">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">11</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-11" data-mini="true"><label for="q-11">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">12</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-12" data-mini="true"><label for="q-12">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">13</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-13" data-mini="true"><label for="q-13">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">14</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-14" data-mini="true"><label for="q-14">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">15</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-15" data-mini="true"><label for="q-15">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">16</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-16" data-mini="true"><label for="q-16">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">17</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-17" data-mini="true"><label for="q-17">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">18</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-18" data-mini="true"><label for="q-18">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">19</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-19" data-mini="true"><label for="q-19">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">20</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-20" data-mini="true"><label for="q-20">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">21</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-21" data-mini="true"><label for="q-21">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">22</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-22" data-mini="true"><label for="q-22">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">23</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-23" data-mini="true"><label for="q-23">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">24</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-24" data-mini="true"><label for="q-24">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">25</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-25" data-mini="true"><label for="q-25">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">26</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-26" data-mini="true"><label for="q-26">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">27</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-27" data-mini="true"><label for="q-27">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">28</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-28" data-mini="true"><label for="q-28">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">29</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-29" data-mini="true"><label for="q-29">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">30</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-30" data-mini="true"><label for="q-30">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">31</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-31" data-mini="true"><label for="q-31">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">32</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-32" data-mini="true"><label for="q-32">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">33</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-33" data-mini="true"><label for="q-33">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">34</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-34" data-mini="true"><label for="q-34">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">35</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-35" data-mini="true"><label for="q-35">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">36</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-36" data-mini="true"><label for="q-36">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">37</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-37" data-mini="true"><label for="q-37">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">38</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-38" data-mini="true"><label for="q-38">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">39</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-39" data-mini="true"><label for="q-39">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">40</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-40" data-mini="true"><label for="q-40">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">41</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-41" data-mini="true"><label for="q-41">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">42</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-42" data-mini="true"><label for="q-42">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">43</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-43" data-mini="true"><label for="q-43">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">44</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-44" data-mini="true"><label for="q-44">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">45</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-45" data-mini="true"><label for="q-45">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">46</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-46" data-mini="true"><label for="q-46">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">47</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-47" data-mini="true"><label for="q-47">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">48</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-48" data-mini="true"><label for="q-48">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">49</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="qry" id="q-49" data-mini="true"><label for="q-49">0.00</label></fieldset></div>	
					</div>
					<!--div-clearing--><div class="clear"></div><!--div-clearing-->
			   	</div>
			   	<div class="mainframe01  color2 mgtop6">
			   		<div class="divz">B区</div>
			   		<!--  
			   		<div class="min-overflow">
				   		<div class="div01">
				   			<div class="o-number title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   		<div class="div02">
				   			<div class="o-number title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number title-setting brl-1">号码</div>
					   		<div class="b-number30 title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   	</div>
				   	-->
			   		<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">01</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-01" data-mini="true"><label for="h-01">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">02</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-02" data-mini="true"><label for="h-02">0.00</label></fieldset></div>
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">03</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-03" data-mini="true"><label for="h-03">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">04</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-04" data-mini="true"><label for="h-04">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">05</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-05" data-mini="true"><label for="h-05">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">06</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-06" data-mini="true"><label for="h-06">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">07</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-07" data-mini="true"><label for="h-07">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">08</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-08" data-mini="true"><label for="h-08">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">09</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-09" data-mini="true"><label for="h-09">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">10</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-10" data-mini="true"><label for="h-10">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">11</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-11" data-mini="true"><label for="h-11">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">12</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-12" data-mini="true"><label for="h-12">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">13</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-13" data-mini="true"><label for="h-13">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">14</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-14" data-mini="true"><label for="h-14">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">15</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-15" data-mini="true"><label for="h-15">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">16</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-16" data-mini="true"><label for="h-16">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">17</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-17" data-mini="true"><label for="h-17">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">18</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-18" data-mini="true"><label for="h-18">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">19</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-19" data-mini="true"><label for="h-19">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">20</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-20" data-mini="true"><label for="h-20">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">21</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-21" data-mini="true"><label for="h-21">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">22</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-22" data-mini="true"><label for="h-22">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">23</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-23" data-mini="true"><label for="h-23">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">24</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-24" data-mini="true"><label for="h-24">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">25</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-25" data-mini="true"><label for="h-25">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">26</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-26" data-mini="true"><label for="h-26">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">27</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-27" data-mini="true"><label for="h-27">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">28</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-28" data-mini="true"><label for="h-28">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">29</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-29" data-mini="true"><label for="h-29">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">30</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-30" data-mini="true"><label for="h-30">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">31</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-31" data-mini="true"><label for="h-31">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">32</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-32" data-mini="true"><label for="h-32">0.00</label></fieldset></div>	
					</div>  
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">33</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-33" data-mini="true"><label for="h-33">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">34</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-34" data-mini="true"><label for="h-34">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">35</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-35" data-mini="true"><label for="h-35">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">36</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-36" data-mini="true"><label for="h-36">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">37</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-37" data-mini="true"><label for="h-37">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">38</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-38" data-mini="true"><label for="h-38">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">39</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-39" data-mini="true"><label for="h-39">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">40</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-40" data-mini="true"><label for="h-40">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">41</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-41" data-mini="true"><label for="h-41">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">42</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-42" data-mini="true"><label for="h-42">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">43</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-43" data-mini="true"><label for="h-43">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">44</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-44" data-mini="true"><label for="h-44">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">45</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-45" data-mini="true"><label for="h-45">0.00</label></fieldset></div>	
				   		<div class="o-number20 brl-1"><div name="ball">46</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-46" data-mini="true"><label for="h-46">0.00</label></fieldset></div>
				   	</div>
				   	<div class="div02">
				   		<div class="o-number20 brl-1"><div name="ball">47</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-47" data-mini="true"><label for="h-47">0.00</label></fieldset></div>
				   		<div class="o-number20 brl-1"><div name="ball">48</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-48" data-mini="true"><label for="h-48">0.00</label></fieldset></div>	
					</div>
					<div class="div01">
				   		<div class="o-number20 brl-1"><div name="ball">49</div></div>
				   		<div class="b-number30 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="hry" id="h-49" data-mini="true"><label for="h-49">0.00</label></fieldset></div>	
					</div>
					<!--div-clearing--><div class="clear"></div><!--div-clearing-->
			   	</div>
		   </div>
		   <a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="top">返回顶部</a></p>
		   </div>
		   </div>
		</div>
	</div>
	<%@ include file="/WEB-INF/page/hkc/com_s_bet.jsp" %>
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>