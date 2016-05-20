<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-role="panel" id="quick-links"  data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2 class="ui-tittle-icon-linkqu">${msg['label.sport.fb.ql']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" class="li_height" data-ajax="false" style="background-color:transparent">${msg['label.sport.fb.ag']}</a></li>
			<li><a at="a" href="${ctx}/sport" class="li_height" data-ajax="false" style="background-color:transparent">${msg['label.sport.fb.as']}</a></li>
		</div>
    </div>
</div>
<script type="text/javascript">
    var ss = window.sessionStorage;
    $(function(){
        var s = JSON.parse(ss.getItem("rm_s"));
        var l = JSON.parse(ss.getItem("rm_l"));
        var m = JSON.parse(ss.getItem("rm_m"));
        if (s != null) {
            $("#rm_menu").append("<li><a at='s' href='" + s.url + "' class='li_height' data-ajax='false' style='background-color:transparent'>" + s.name + "</a></li>");
        }
        if (l != null) {
            $("#rm_menu").append("<li><a at='l' href='" + l.url + "' class='li_height' data-ajax='false' style='background-color:transparent'>" + l.name + "</a></li>");
        }
        if (m != null) {
            $("#rm_menu").append("<li><a at='m' href='" + m.url + "' class='li_height' data-ajax='false' style='background-color:transparent'>" + m.name + "</a></li>");
        }
        $("#rm_menu").listview("refresh");

        $("#rm_menu").on("click", "a[at]", function (e) {
            e.preventDefault();
            var at = $(this).attr("at");
            switch (at){
                case "a":
                    ss.removeItem("rm_s");
                case "s":
                    ss.removeItem("rm_l");
                case "l":
                    ss.removeItem("rm_m");
                    break;
                default :
                    break;
            }
            window.location.href = $(this).attr("href");
        });

    });
</script>
