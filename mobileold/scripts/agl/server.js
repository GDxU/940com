/**
 * Created by tt on 2016/4/29.
 */
indexApp.factory('Path',function(){
    return{
        //免费视频
        videoUrl:'http://www.940.com/videoList?page=1&line=4&type=2&callback=JSON_CALLBACK',
        //开店技巧
        shopUrl:'http://www.940.com/articleList?page=1&line=8&type=2&callback=JSON_CALLBACK',
        //成功案例
        secUrl:'http://www.940.com/articleList?page=1&line=8&type=6&callback=JSON_CALLBACK',
        //讲师团队
        teachUrl:'http://www.940.com/teacherList?page=1&line=6&callback=JSON_CALLBACK',
        //文章
        articleUrl:'http://940.com/detail'
    }
});
indexApp.factory('UserInfo', ['$http', '$q','Path',function ($http, $q,Path) {
    return {
        videoUrl : function() {
            var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
            $http.jsonp(
                Path.videoUrl,
                {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                }
            ).success(function(data, status, headers, config) {
                    deferred.resolve(data);  // 声明执行成功，即http请求数据成功，可以返回数据了
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);   // 声明执行失败，即服务器返回错误
                });
            return deferred.promise;   // 返回承诺，这里并不是最终数据，而是访问最终数据的API
        }, // end query
        shopUrl : function() {
            var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
            $http.jsonp(
                Path.shopUrl,
                {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                }
            ).success(function(data, status, headers, config) {
                    deferred.resolve(data);  // 声明执行成功，即http请求数据成功，可以返回数据了
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);   // 声明执行失败，即服务器返回错误
                });
            return deferred.promise;   // 返回承诺，这里并不是最终数据，而是访问最终数据的API
        },
        secUrl:function() {
            var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
            $http.jsonp(
                Path.secUrl,
                {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                }
            ).success(function(data, status, headers, config) {
                    deferred.resolve(data);  // 声明执行成功，即http请求数据成功，可以返回数据了
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);   // 声明执行失败，即服务器返回错误
                });
            return deferred.promise;   // 返回承诺，这里并不是最终数据，而是访问最终数据的API
        },
        teachUrl : function() {
            var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
            $http.jsonp(
                Path.teachUrl,
                {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                }
            ).success(function(data, status, headers, config) {
                    deferred.resolve(data);  // 声明执行成功，即http请求数据成功，可以返回数据了
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);   // 声明执行失败，即服务器返回错误
                });
            return deferred.promise;   // 返回承诺，这里并不是最终数据，而是访问最终数据的API
        },
        articleUrl : function() {
            var deferred = $q.defer(); // 声明延后执行，表示要去监控后面的执行
            $http.jsonp(
                Path.articleUrl,
                {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                }
            ).success(function(data, status, headers, config) {
                    deferred.resolve(data);  // 声明执行成功，即http请求数据成功，可以返回数据了
                }).
                error(function(data, status, headers, config) {
                    deferred.reject(data);   // 声明执行失败，即服务器返回错误
                });
            return deferred.promise;   // 返回承诺，这里并不是最终数据，而是访问最终数据的API
        }
    };
}]);
