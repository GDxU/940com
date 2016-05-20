// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.services', 'starter.filters', 'starter.factories', 'ionRate', 'ionic-datepicker', 'pavle.cityPicker'])

.run(function($ionicPlatform, $rootScope, $ionicLoading, $window, userService, $ionicPopup, postService, localStorage) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });

  /**
   * 显示信息
   * @param text
   */
  $rootScope.show = function(text) {
    $rootScope.loading = $ionicLoading.show({
      template: text ? text : 'Loading...',
      animation: 'fade-in',
      showBackdrop: true,
      maxWidth: 500,
      showDelay: 0
    });
  };

  /**
   * 隐藏信息
   */
  $rootScope.hide = function() {
    $ionicLoading.hide();
  };

  /**
   * 长提示
   * @param text
   */
  $rootScope.longNotify = function(text) {
    $rootScope.show(text);
    $window.setTimeout(function() {
      $rootScope.hide();
    }, 2999);
  };

  /**
   * 短提示
   * @param text
   */
  $rootScope.quickNotify = function(text) {
    $rootScope.show(text);
    $window.setTimeout(function() {
      $rootScope.hide();
    }, 999);
  };

  /**
   * 公告
   * @returns {*}
   */
  $rootScope.ruleAlert = function() {
    return $ionicPopup.confirm({
      title: '快递免费代取说明',
      template: '亲爱的用户您好：【微校校园】快递免费代取业务采取固定时间配送。您的快递将在当天的<b>中午11点—13点</b>和<b>下午17点—19点</b>之间为您配送至宿舍，超过18点后的订单将顺延至第二天为您送到。寄快递首重最低8元起，大家可在平台相应功能下下单哦！',
      buttons: [
        {
          text: '取消'
        },
        {
          text: '不再提醒',
          type: 'button-assertive',
          onTap: function(e) {
            localStorage.set('is_alert', 0);
          }
        }
      ]
    });
  };

  if(!userService.getCurrent()){
    userService.login(wechatAuth.auth).then(function (user) {
      user.set('username', wechatAuth.info.nickname);
      user.set('weixinUserInfo', wechatAuth.info);
      user.save();
      $rootScope.$broadcast('user.login', user);
    }, function (error) {
      $rootScope.longNotify(error);
    });
  }
})

.config(function($stateProvider, $urlRouterProvider, ionicDatePickerProvider) {
  $stateProvider

  .state('fetch', {
    url: '/fetch',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'FetchCtrl'
  })

  .state('fetch.home', {
    url: '/home',
    views: {
      'fetch': {
        templateUrl: 'templates/fetch/home.html',
        controller: 'FetchHomeCtrl'
      }
    }
  })

  .state('fetch.view', {
    url: '/view/:id',
    views: {
      'fetch': {
        templateUrl: 'templates/fetch/view.html',
        controller: 'FetchViewCtrl'
      }
    }
  })

  .state('carry', {
    url: '/carry',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'CarryCtrl'
  })

  .state('carry.home', {
    url: '/home',
    views: {
      'carry': {
        templateUrl: 'templates/carry/home.html',
        controller: 'CarryHomeCtrl'
      }
    }
  })

  .state('carry.view', {
    url: '/view/:id',
    views: {
      'carry': {
        templateUrl: 'templates/carry/view.html',
        controller: 'CarryViewCtrl'
      }
    }
  })

  .state('user', {
    url: '/user',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'UserCtrl'
  })

  .state('user.home', {
    url: '/home',
    views: {
      'user': {
        templateUrl: 'templates/user/home.html',
        controller: 'UserHomeCtrl'
      }
    }
  });

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/fetch/home');

  var datePickerObj = {
    inputDate: new Date(),
    setLabel: '设置',
    todayLabel: '今天',
    closeLabel: '关闭',
    mondayFirst: false,
    weeksList: ["S", "M", "T", "W", "T", "F", "S"],
    monthsList: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    templateType: 'popup',
    from: new Date(2016, 1, 1),
    to: new Date(2018, 8, 1),
    showTodayButton: true,
    dateFormat: 'MM月dd号',
    closeOnSelect: true
  };
  ionicDatePickerProvider.configDatePicker(datePickerObj);
});