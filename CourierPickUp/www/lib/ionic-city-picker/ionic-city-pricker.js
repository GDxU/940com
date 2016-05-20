/**
 * Created by 李鹏飞 on 2016/3/31.
 */
angular.module('pavle.cityPicker', [])
  .directive('cityPicker', [
    function() {
      'use strict';

      return {
        restrict: 'AEC',
        replace: false,
        template: '<input type="text" name="{{cityAttributeName}}" ng-model="city" ng-click="open()" readonly><input type="hidden" name="{{cityIdAttributeName}}" ng-model="cityId">',
        scope: {
          city: '=',
          cityId: '=',
          cityAttributeName: '=',
          cityIdAttributeName: '='
        },
        controller : function($scope, $ionicModal, $http) {
          $scope.city = $scope.city || '请选择城市';
          $scope.cityId = $scope.cityId || 0;
          $scope.cityAttributeName = $scope.cityAttributeName || 'city';
          $scope.cityIdAttributeName = $scope.cityIdAttributeName || 'cityId';

          $scope.items = {};
          $http.get('data/city.json').success(function(data){
            $scope.items = data;
          });

          $ionicModal.fromTemplateUrl('lib/ionic-city-picker/modal.html', {
            scope: $scope
          }).then(function(modal) {
            $scope.modal = modal;
          });

          /**
           * 关闭modal
           */
          $scope.close = function() {
            $scope.modal.hide();
          };

          /**
           * 打开modal
           */
          $scope.open = function() {
            $scope.modal.show();
          };

          $scope.select = function(item){
            $scope.city = item.name;
            $scope.cityId = item.id;

            $scope.close();
          }
        }
      };
    }
  ]);
