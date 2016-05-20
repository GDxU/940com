angular.module('starter.controllers', [])

.controller('FetchCtrl', function($scope, $ionicModal, $rootScope, postService, localStorage, ionicDatePicker) {

  /**
   * {{company: string, code: string, note: string, address: string}}
   */
  var date = new Date();
  var month = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1);
  var day = date.getDate();
  $scope.postData = localStorage.getObject('postData', {"company": "顺丰", "location": "南院", "arrived_at": month + '月' + day + '号'});

  $ionicModal.fromTemplateUrl('templates/fetch/post.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  /**
   * 关闭取件单modal
   */
  $scope.closePost = function() {
    $scope.modal.hide();
  };

  /**
   * 打开取件单modal
   */
  $scope.post = function() {
    $scope.modal.show();
  };

  /**
   * 创建一个取件单
   */
  $scope.createPost = function() {
    postService.create($scope.postData).then(function(post){
      $scope.$broadcast('$ionicView.beforeEnter');
      $scope.modal.hide();

      //reset不需要存储的数据
      $scope.postData.code = '';
      $scope.postData.note = '';
      $scope.postData.arrived_at = '';
      localStorage.setObject('postData', $scope.postData);

      $rootScope.quickNotify('成功啦~马上为您派送快递哟~');

    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  var dateOptions = {
    inputDate: date,
    callback: function (val) {
      var selectDate = new Date(val);
      var selectMonth = (selectDate.getMonth()+1 < 10 ? '0'+(selectDate.getMonth()+1) : selectDate.getMonth()+1);
      var selectDay = selectDate.getDate();
      $scope.postData.arrived_at = selectMonth + '月' + selectDay + '号';
      dateOptions.inputDate = selectDate;
    }
  };

  $scope.openDatePicker = function(){
    ionicDatePicker.openDatePicker(dateOptions);
  };
})

.controller('FetchHomeCtrl', function($scope, $rootScope, postService, $stateParams, localStorage) {
  $scope.$on('$ionicView.beforeEnter', function(e) {
    $scope.items = [];
    $scope.refreshItems();
  });

  /**
   * 加载更多数据
   */
  $scope.addItems = function() {
    postService.lists(postService.loadTotal, postService.limit, postService.type).then(function(result){
      $scope.items = $scope.items.concat(result);
      postService.loadTotal += postService.limit;
      $scope.$broadcast('scroll.infiniteScrollComplete');
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  /**
   * 刷新列表
   */
  $scope.refreshItems = function() {
    postService.lists(0, postService.limit, postService.type).then(function(result){
      $scope.items = result;
      postService.loadTotal = postService.limit;
      $scope.$broadcast('scroll.refreshComplete');
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  /**
   * 列表是否需可以刷新
   * @returns {boolean}
   */
  $scope.canLoading = function(){
    return postService.canLoading();
  };

  /**
   * 删除一个项目
   * @param index
   */
  $scope.delete = function (index) {
    postService.delete($scope.items[index]).then(function (res) {
      $scope.items.splice(index,1);
    }, function (error) {
      $rootScope.quickNotify(error);
    });
  };

  //规则提示
  var isAlert = localStorage.get('is_alert', 1);
  if(isAlert == 1){
    $rootScope.ruleAlert();
  }
})

.controller('FetchViewCtrl', function($scope, $stateParams, $ionicModal, postService, gradeService, $rootScope) {
  $scope.post = {};
  $scope.grade = {};
  $scope.gradeForm = {rating: 1, note: ''};

  postService.find($stateParams.id).then(function (post) {
    $scope.post = post;
    var grade = $scope.post.get('grade');
    if(grade){
      grade.fetch().then(function(grade) {
        $scope.grade = grade;
        $scope.gradeForm.rating = $scope.grade.get('rating');
        $scope.gradeForm.note = $scope.grade.get('note');
      });
    }
  }, function (msg) {
    $rootScope.quickNotify(msg);
  });

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/fetch/grade.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeGrade = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.openGrade = function() {
    $scope.modal.show();
  };

  $scope.postGrade = function(){
    gradeService.gradePost($scope.post, $scope.gradeForm).then(function(grade){
      $scope.grade = grade;
      $scope.gradeForm.rating = grade.get('rating');
      $scope.gradeForm.note = grade.get('note');
      $scope.modal.hide();
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  $scope.color = 'energized';
  $scope.selectedStar = function(rating){
    $scope.gradeForm.rating = rating;
  };

  $scope.receive = function () {
    postService.changeStatus($scope.post, 4).then(function (res) {
      $scope.post.status = 4;
    }, function (error) {
      $rootScope.quickNotify(error);
    });
  }
})

.controller('CarryCtrl', function($scope, $ionicModal, $rootScope, carryService, localStorage) {

  /**
   * {{company: string, code: string, note: string, address: string}}
   */
  $scope.form = localStorage.getObject('carryForm', {"company": "顺丰"});

  $ionicModal.fromTemplateUrl('templates/carry/post.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  /**
   * 关闭取件单modal
   */
  $scope.close = function() {
    $scope.modal.hide();
  };

  /**
   * 打开取件单modal
   */
  $scope.open = function() {
    $scope.modal.show();
  };

  /**
   * 创建一个取件单
   */
  $scope.create = function() {
    carryService.create($scope.form).then(function(data){
      //向root发送广播
      $scope.$broadcast('$ionicView.beforeEnter');
      $scope.modal.hide();
      localStorage.setObject('carryForm', $scope.form);
      $rootScope.quickNotify('成功啦~我们马上联系您~');
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };
})

.controller('CarryHomeCtrl', function($scope, carryService, $rootScope){
  $scope.$on('$ionicView.beforeEnter', function(e) {
    $scope.items = [];
    $scope.refreshItems();
  });

  /**
   * 加载更多数据
   */
  $scope.addItems = function() {
    carryService.lists(carryService.loadTotal, carryService.limit).then(function(result){
      $scope.items = $scope.items.concat(result);
      carryService.loadTotal += carryService.limit;
      $scope.$broadcast('scroll.infiniteScrollComplete');
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  /**
   * 刷新列表
   */
  $scope.refreshItems = function() {
    carryService.lists(0, carryService.limit).then(function(result){
      $scope.items = result;
      carryService.loadTotal = carryService.limit;
      $scope.$broadcast('scroll.refreshComplete');
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  /**
   * 是否可以加载
   * @returns {boolean}
   */
  $scope.canLoading = function(){
    return carryService.canLoading();
  };

  /**
   * 删除一个项目
   * @param index
   */
  $scope.delete = function (index) {
    carryService.delete($scope.items[index]).then(function (res) {
      $scope.items.splice(index,1);
    }, function (error) {
      $rootScope.quickNotify(error);
    });
  };
})

.controller('CarryViewCtrl', function($scope, $stateParams, $ionicModal, carryService, gradeService) {
  $scope.post = {};
  $scope.grade = {};
  $scope.gradeForm = {rating: 1, note: ''};

  carryService.find($stateParams.id).then(function (post) {
    $scope.post = post;
    var grade = $scope.post.get('grade');
    if(grade){
      grade.fetch().then(function(grade) {
        $scope.grade = grade;
        $scope.gradeForm.rating = $scope.grade.get('rating');
        $scope.gradeForm.note = $scope.grade.get('note');
      });
    }
  }, function (msg) {
    $rootScope.quickNotify(msg);
  });

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/carry/grade.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeGrade = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.openGrade = function() {
    $scope.modal.show();
  };

  $scope.postGrade = function(){
    gradeService.gradePost($scope.post, $scope.gradeForm).then(function(grade){
      $scope.grade = grade;
      $scope.gradeForm.rating = grade.get('rating');
      $scope.gradeForm.note = grade.get('note');
      $scope.modal.hide();
    }, function (msg) {
      $rootScope.quickNotify(msg);
    });
  };

  $scope.color = 'energized';
  $scope.selectedStar = function(rating){
    $scope.gradeForm.rating = rating;
  };

  $scope.receive = function () {
    postService.changeStatus($scope.post, 4).then(function (res) {
      $scope.post.status = 4;
    }, function (error) {
      $rootScope.quickNotify(error);
    });
  }
})

.controller('UserCtrl', function($scope, $rootScope){

})

.controller('UserHomeCtrl', function($scope, userService){
  $scope.user = userService.getCurrent();
});
