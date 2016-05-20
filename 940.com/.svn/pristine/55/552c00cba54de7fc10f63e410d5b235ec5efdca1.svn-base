var lh = location.href;
var ih = lh.indexOf(".");
if (ih != -1) {
	var body = document.getElementsByTagName('body')[0];
	var bizqq = document.createElement('script');
	bizqq.type = 'text/javascript';
	bizqq.src = 'http://wpa.b.qq.com/cgi/wpa.php';
	bizqq.onreadystatechange = function() {
		if (this.readyState == 'complete') {
			fn_main();
		}
	}
	bizqq.onload = function() {
		fn_main();
	}
	body.appendChild(bizqq);
}
function fn_main() {
	$("body").append('');
	BizQQWPA.add({
		aty: '1',
		a: '1001',
		type: '1',
		ty: '1',
		nameAccount: '4001000940',
		parent: 'buttom'
	});
	setTimeout(function() {
		click_qq_chat();
	}, 500);
}
function click_qq_chat() {console.log($("#buttom"))
	
	$("iframe").contents().find("#launchBtn")[0].click();
}