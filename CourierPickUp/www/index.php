<?php
/**
 * User: 李鹏飞 <523260513@qq.com>
 * Date: 2016/2/1
 * Time: 15:08
 */

$app = require __DIR__ . '/../php/app.php';
$oauth = $app->oauth;
$js = $app->js;

if(!isset($_SESSION['CourierPickUp_Wechat'])){
    $oauth->redirect()->send();
}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <title></title>
    <link href="css/ionic.app.min.css" rel="stylesheet">
    <!-- ionic/angularjs js -->
    <script src="lib/ionic/js/ionic.bundle.min.js"></script>
    <!-- cordova script (this will be a 404 during development) -->
    <!--<script src="cordova.js"></script>-->
    <script>
      var wechatAuth = <?= json_encode($_SESSION['CourierPickUp_Wechat'])?>;
    </script>
    <!-- your app's js -->
    <script src="js/app.js"></script>
    <script src="js/filters.js"></script>
    <script src="js/service.js"></script>
    <script src="js/factories.js"></script>
    <script src="js/controllers.js"></script>
    <script src="lib/ionic-rating/rate.js"></script>
    <script src="lib/leancloud-jssdk.js/dist/av-mini.js"></script>
    <script src="lib/ionic-datepicker/dist/ionic-datepicker.bundle.min.js"></script>
    <script src="lib/ionic-city-picker/ionic-city-pricker.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
      wx.config(<?php echo $js->config(['chooseWXPay']) ?>);
    </script>
  </head>

  <body ng-app="starter">
    <ion-nav-bar class="bar-stable bar-assertive">
      <ion-nav-back-button>
      </ion-nav-back-button>
    </ion-nav-bar>
    <ion-nav-view></ion-nav-view>
  </body>
</html>
