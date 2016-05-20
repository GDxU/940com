var home={
    freeList:function(){
        return{
            restrict:"E",
            templateUrl:"template/viewList.html",
            replace:true,
            controller:'MainCtrl',
           /* scope:{
                getContent:'&'
            },
            controller:function($scope){
                $scope.user=$scope.getContent();    //调用无参函数
            },*/
            link:function($scope,$element,$attr){
                /* console.log($attr);*/
                if($attr+1 % 2 == 0){
                    $element.classname="free-cont1";
                }else{
                    $element.classname="free-cont2";
                }
            }
        }
    },
    shopList:function(){
        return{
            restrict:"E",
            templateUrl:"template/itemList.html",
            replace:true,
            controller:'shopUrl',
            $transclude: true,
            link:function($scope,$element,$attrs,$transclude){
                $scope.$watch('shop',function(){
                    // shop
                    var LanMu = $(".shop-list");
                    var lanMuSun = LanMu.children('li');
                    if ((lanMuSun.size()) > 5) {
                        LanMu.children("li:gt(3)").hide();
                        $(".listmore").show();
                    }
                    $element.bind("click", function() {
                        if (!$(".listmore").hasClass('ListMoreOn')) {
                            $(".listmore").addClass('ListMoreOn');
                            LanMu.children("li:gt(3)").slideDown();
                            $(".s-xguide-down").css("background-image", "url('content/images/940/s-xguide-up.png')");

                        } else {
                            $(".listmore").removeClass('ListMoreOn');
                            LanMu.children("li:gt(3)").slideUp();
                            $(".s-xguide-down").css("background-image", "url('content/images/940/s-xguide-down.png')");
                        }
                    });
                });
            }
        }
    },
    sucList:function(){
        return{
            restrict:"E",
            templateUrl:"template/itemListSc.html",
            replace:true,
            $transclude: true,
            controller:'secUrl',
            link:function($scope,$element){
                $scope.$watch('sec',function(){
                    // successes
                    var LanMt = $(".successes-list");
                    var lanMtSun = LanMt.children('li');
                    if ((lanMtSun.size()) > 5) {
                        LanMt.children("li:gt(3)").hide();
                        $(".listmoru").show();
                    }
                    $element.bind("click", function() {
                        if (!$(".listmoru").hasClass('listmoruOn')) {
                            $(".listmoru").addClass('listmoruOn');
                            LanMt.children("li:gt(3)").slideDown();
                            $(".s-xguide-down2").css("background-image", "url('content/images/940/s-xguide-up.png')");

                        } else {
                            $element.removeClass('listmoruOn');
                            LanMt.children("li:gt(3)").slideUp();
                            $(".s-xguide-down2").css("background-image", "url('content/images/940/s-xguide-down.png')");
                        }
                    });
                });
            }
        }
    },
    teachList:function() {
        return{
            restrict: "E",
            templateUrl: "template/teachList.html",
            replace: true,
            controller:'teachUrl',
            link: function ($scope, $element) {
                /*筛选*/
                $scope.$watch('teach',function(){
                    var teachListf=$(".teacher");
                    var teachListc=$(".teacher").children("dl");
                    if((teachListc.size())>3){
                       $(".lectuers-teacher2").append(teachListf.children("dl:gt(2)"));
                    }
                });
            }
        }
    },
    articleDetail:function(){
        return{
            restrict:"E",
            templateUrl:"template/itemList.html",
            replace:true,
            controller:'MainCtrl',
            link:function($scope,$element){
                if(2 % 2 == 0){
                    $element.classname="free-cont1";
                }else{
                    $element.classname="free-cont2";
                }

            }
        }
    }
};
indexApp.directive("freeList",home.freeList);
indexApp.directive("shopList",home.shopList);
indexApp.directive("sucList",home.sucList);
indexApp.directive("teachList",home.teachList);
indexApp.directive("articleDetail",home.articleDetail);