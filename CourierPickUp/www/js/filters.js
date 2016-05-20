/**
 * Created by 李鹏飞 on 2016/2/2.
 */
angular.module('starter.filters', [])
.filter('statusName', ['$sce', function () {
  return function(status) {
    switch (status){
      case 0: return '提交成功'; break;
      case 1: return '已受理'; break;
      case 2: return '正在取件'; break;
      case 3: return '正在派送给您'; break;
      case 4: return '确认收到'; break;
      default: return '未知状态'; break;
    }
  };
}]);
