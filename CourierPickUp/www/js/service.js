/**
 * Created by 李鹏飞 on 2016/1/15.
 */
angular.module('starter.services', [])

.config(function(){
  AV.initialize('S7noOo9FGg70H5k47vpctpYS-gzGzoHsz', '5XmUuoLRGnsxhGgC74FAVOQA');
})

.service('userService', function ($q) {
  /**
   * 获取当前用户
   * @returns {*|AV.User}
   */
  this.getCurrent = function () {
    return AV.User.current();
  };

  /**
   * @returns {boolean}
   */
  this.isGuest = function(){
    if(this.getCurrent()){
      return false;
    }else{
      return true;
    }
  };

  /**
   * @param userInfo
   * @returns {*}
   */
  this.login = function(userInfo){
    var defer = $q.defer();

    AV.User._logInWith('weixin', {
      'authData': userInfo
    }).then(function(user) {
      defer.resolve(user);
    }, function(error) {
      defer.reject(error);
    });

    return defer.promise;
  };
})
.service('postService', function($q, userService){
  var objPost = AV.Object.extend('Post');
  var postService = this;
  this.total = 0;
  this.loadTotal = 0;
  this.limit = 30;
  this.type = null;

  var getCount = function(){
    var defer = $q.defer();

    var query = new AV.Query('Post');
    query.equalTo('user', userService.getCurrent());
    query.count().then(function(count) {
      postService.total = count;
      defer.resolve(count);
    });

    return defer.promise;
  };

  getCount();

  this.create = function(data){
    var defer = $q.defer();
    if(data.code && data.name && data.tel && data.company && data.address){
      var query = new AV.Query('Post');
      query.equalTo('code', data.code);
      query.equalTo('company', data.company);
      query.equalTo('user', userService.getCurrent());
      query.count().then(function(count) {
        if(count > 0){
          defer.reject('信息已存在，我们会尽快处理');
        }else{
          data.status = 0;
          data.isGrade = 0;

          var post = new objPost();
          post.set('user', userService.getCurrent());
          //默认设置1
          data.status = 1;
          post.save(data).then(function(){
            defer.resolve(post);
          }, function(){
            defer.reject('发送失败');
          });
        }
      });
    }else {
      defer.reject('请填写必填信息，方便我们为您配送');
    }

    return defer.promise;
  };

  this.lists = function(offset, limit, type){
    var defer = $q.defer();
    offset = offset || 0;
    limit = limit || 100;

    var query = new AV.Query('Post');
    query.equalTo('user', userService.getCurrent());
    if(type){
      query.containedIn('status', type);
    }
    query.skip(offset).limit(limit).addAscending('createdAt').find().then(function(results) {
      defer.resolve(results);
    }, function(error) {
      defer.reject('获取数据失败：'+ error.code + ' ' + error.message);
    });

    return defer.promise;
  };

  /**
   * 获取快递信息
   * @param objectId
   * @returns {*}
   */
  this.find = function(objectId){
    var defer = $q.defer();

    var query = new AV.Query('Post');
    query.get(objectId).then(function(results) {
      defer.resolve(results);
    }, function(error) {
      defer.reject('获取数据失败：'+ error.code + ' ' + error.message);
    });

    return defer.promise;
  };

  /**
   *
   * @param item
   * @returns {*}
   */
  this.delete = function(item){
    var defer = $q.defer();

    item.destroy().then(function() {
      defer.resolve('success');
    }, function(error) {
      defer.resolve('error');
    });

    return defer.promise;
  };

  /**
   * 修改订单状态
   * @param item
   * @param status
   * @returns {*}
   */
  this.changeStatus = function(item, status){
    var defer = $q.defer();

    item.set('status', status);
    item.save().then(function() {
      defer.resolve('success');
    }, function(error) {
      defer.resolve('error');
    });

    return defer.promise;
  };

  this.canLoading = function(){
    if(this.loadTotal == 0){
      return true;
    }else{
      return this.total > this.loadTotal;
    }
  };
})

.service('gradeService', function($q){
  var objGrade = AV.Object.extend('Grade');

  this.gradePost = function(post, data){
    var defer = $q.defer();

    if(data.rating){
      var grade = new objGrade();
      grade.set('rating', data.rating);
      grade.set('note', data.note);

      post.set('isGrade', 1);
      post.set('grade', grade);
      post.save().then(function(){
        defer.resolve(grade);
      }, function(){
        defer.reject('发送失败');
      });
    }else{
      defer.reject('请为我们的服务打星');
    }

    return defer.promise;
  };
})

.service('carryService', function($q, userService){
  var model = 'Carry';
  var objPost = AV.Object.extend(model);
  var carryService = this;
  this.items = [];
  this.total = 0;
  this.loadTotal = 0;
  this.limit = 30;

  /**
   * 获取总数
   * @returns {*}
   */
  var getCount = function(){
    var defer = $q.defer();

    var query = new AV.Query(model);
    query.equalTo('user', userService.getCurrent());
    query.count().then(function(count) {
      carryService.total = count;
      defer.resolve(count);
    });

    return defer.promise;
  };

  getCount();

  /**
   * 创建寄件订单
   * @param data
   * @returns {*}
   */
  this.create = function(data){
    var defer = $q.defer();
    if(data.name && data.tel && data.company && data.address && data.to && data.weight){
      var query = new AV.Query(model);
      query.equalTo('company', data.company);
      query.equalTo('user', userService.getCurrent());
      query.equalTo('weight', data.weight);
      query.equalTo('to', data.to);
      query.count().then(function(count) {
        if(count > 0){
          defer.reject('信息已存在，我们会尽快处理');
        }else{
          var post = new objPost();
          data.status = 1;
          post.set('user', userService.getCurrent());
          post.save(data).then(function(){
            defer.resolve(post);
          }, function(){
            defer.reject('发送失败');
          });
        }
      });
    }else {
      defer.reject('请填写必填信息，方便我们为您配送');
    }

    return defer.promise;
  };

  /**
   * 获取列表
   * @param offset
   * @param limit
   * @returns {*}
   */
  this.lists = function(offset, limit){
    var defer = $q.defer();
    offset = offset || 0;
    limit = limit || 100;

    var query = new AV.Query(model);
    query.equalTo('user', userService.getCurrent());
    query.skip(offset).limit(limit).addAscending('createdAt').find().then(function(results) {
      defer.resolve(results);
    }, function(error) {
      defer.reject('获取数据失败：'+ error.code + ' ' + error.message);
    });

    return defer.promise;
  };

  /**
   * 获取快递信息
   * @param objectId
   * @returns {*}
   */
  this.find = function(objectId){
    var defer = $q.defer();

    var query = new AV.Query(model);
    query.get(objectId).then(function(results) {
      defer.resolve(results);
    }, function(error) {
      defer.reject('获取数据失败：'+ error.code + ' ' + error.message);
    });

    return defer.promise;
  };

  /**
   *
   * @param item
   * @returns {*}
   */
  this.delete = function(item){
    var defer = $q.defer();

    item.destroy().then(function() {
      defer.resolve('success');
    }, function(error) {
      defer.resolve('error');
    });

    return defer.promise;
  };

  /**
   * 修改订单状态
   * @param item
   * @param status
   * @returns {*}
   */
  this.changeStatus = function(item, status){
    var defer = $q.defer();

    item.set('status', status);
    item.save().then(function() {
      defer.resolve('success');
    }, function(error) {
      defer.resolve('error');
    });

    return defer.promise;
  };

  /**
   * 是否可以加载
   * @returns {boolean}
   */
  this.canLoading = function(){
    if(this.loadTotal == 0){
      return true;
    }else{
      return this.total > this.loadTotal;
    }
  };
});
