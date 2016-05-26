indexApp.controller('MainCtrl', ['$scope', 'UserInfo', function ($scope, UserInfo) { // 引用我们定义的UserInfo服务
    var promise = UserInfo.videoUrl(); // 同步调用，获得承诺接口
    promise.then(function(data) {  // 调用承诺API获取数据 .resolve
        var item=data.list;
        $scope.user = item;
   /*     var data1=JSON.stringify($scope.user);*/
        console.log(item[0].title);
    }, function(data) {  // 处理错误 .reject
        $scope.user = {error: '服务请求失败！'};
    });
}]);
indexApp.controller('shopUrl', ['$scope', 'UserInfo', function ($scope, UserInfo) { // 引用我们定义的UserInfo服务
    var promise = UserInfo.shopUrl(); // 同步调用，获得承诺接口
    promise.then(function(data) {  // 调用承诺API获取数据 .resolve
        var item=data.list;
        $scope.shop = item;
    }, function(data) {  // 处理错误 .reject
        $scope.user = {error: '服务请求失败！'};
    });
}]);
indexApp.controller('secUrl', ['$scope', 'UserInfo', function ($scope, UserInfo) { // 引用我们定义的UserInfo服务
    var promise = UserInfo.secUrl(); // 同步调用，获得承诺接口
    promise.then(function(data) {  // 调用承诺API获取数据 .resolve
        var item=data.list;
        $scope.sec= item;
    }, function(data) {  // 处理错误 .reject
        $scope.user = {error: '服务请求失败！'};
    });
}]);
indexApp.controller('teachUrl', ['$scope', 'UserInfo', function ($scope, UserInfo) { // 引用我们定义的UserInfo服务
    var promise = UserInfo.teachUrl(); // 同步调用，获得承诺接口
    promise.then(function(data) {  // 调用承诺API获取数据 .resolve
        var item=data.list;
        $scope.teach= item;
    }, function(data) {  // 处理错误 .reject
        $scope.user = {error: '服务请求失败！'};
    });
}]);
indexApp.controller('articleDetail', ['$scope', 'UserInfo', function ($scope, UserInfo) { // 引用我们定义的UserInfo服务
    var promise = UserInfo.articleUrl(); // 同步调用，获得承诺接口
    promise.then(function(data) {  // 调用承诺API获取数据 .resolve
        var item=data.list;
        $scope.teach= item;
    }, function(data) {  // 处理错误 .reject
        $scope.user = {error: '服务请求失败！'};
    });
}]);