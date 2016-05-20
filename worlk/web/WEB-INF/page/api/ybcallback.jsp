<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script type="text/javascript">
//执行调用客户端事件
    try {
        mobileJS.paySucceed();
    } catch(e) {}
    try {
        //window.webkit.messageHandlers.XXOO.postMessage("BackHome");
        quit.ext();
    } catch(e) {}		
</script>