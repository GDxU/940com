/**
 * Created by Administrator on 2016/4/27.
 */
var indexmodule=angular.module("indexmodule",[]);
var tgsystem=angular.module("tgsystem",[]);
indexmodule.controller("freeCtrl",function($scope){
   /* $scope.frees=[
        {title:"完全自然人工浏览，不同地区IP，真实流量、安全可靠",id:"1"},
        {title:"百万人同时在线，深度访问，增加店铺收藏，提高排名",id:"2"},
        {title:"专业的关键词优化，提高点击率，有点击才会有销量",id:"3"},
        {title:"轻松为您打造店铺爆款商品，从而引爆全店销量",id:"4"}
    ]*/
});
var home={
    /*免费*/
    free:function(){
        return{
            restrict:"E",
            templateUrl:'template/free.html',
            replace:false,
            link:function($scope,$elem,$attrs){
                console.log($attrs);
               /* $elem.append(1);*/
                $scope.frees=[
                    {title:"完全自然人工浏览，不同地区IP，真实流量、安全可靠",id:"1"},
                    {title:"百万人同时在线，深度访问，增加店铺收藏，提高排名",id:"2"},
                    {title:"专业的关键词优化，提高点击率，有点击才会有销量",id:"3"},
                    {title:"轻松为您打造店铺爆款商品，从而引爆全店销量",id:"4"}
                ]
            }
        }
    },
    /*视频*/
    videoList:function(){
        return{
            restrict:'E',
            templateUrl:'template/videolist.html',
            replace:false,
            link:function($scope,$element,$arrts){
                console.log($arrts);
                $scope.arr = [
                    {
                        id:"1",
                        className:"video-spacing",
                        title: "注册帐号，完善资料，绑定手机证书",
                        url: "14651978969257574452"//1
                    },
                    {
                        id:"2",
                        title: "如何发布推广任务(PC端)",
                        url: "14651978969257569568"//2
                    },
                    {
                        id:"3",
                        className:"video-spacing",
                        title: "如何发布推广任务(手机端)",
                        url: "14651978969257570292"//3
                    },
                    {
                        id:"4",
                        title: "如何发布商品链接任务",
                        url: "14651978969257572725"//4
                    },
                    {
                        id:"5",
                        className:"video-spacing",
                        title: "如何发布店铺链接任务",
                        url: "14651978969257572440"//5
                    },
                    {
                        id:"6",
                        title: "如何查关键词排名",
                        url: "14651978969257568679"//6
                    }
                        ]
            }
        }
    },
    /*推广流程系统*/
    stepShow:function(){
            return{
                restrict:"E",
                templateUrl:"template/tgSystem.html",
                replace:false,
                link:function($scope,$element,$attrs){
                    $scope.arr =[
                        {
                            id:1,
                            text:"您只需在猎流上发布流量任务，剩下的交给猎流！",
                            func:[
                                {showFunc:"淘宝电脑端任务"},
                                {showFunc:"淘宝手机APP推广"},
                                {showFunc:"天猫电脑端任务"},
                                {showFunc:"天猫手机APP推广"},
                                {showFunc:"直访店铺"},
                                {showFunc:"直访商品"}
                            ],
                            buttonText:"立即发布任务"
                        },
                        {
                            id:2,
                            text:"猎流将您的任务发布到全网各大任务推广平台！",
                            func:[
                                {showFunc:"专业的团队运作, 率先抢占无限商机"},
                                {showFunc:"快速提升店铺浏览量与商品点击率"},
                                {showFunc:"猎流汇聚海量商业需求, 让店铺营销更加高效"}
                            ],
                            buttonText:"免费下载体验"
                        },
                        {
                            id:3,
                            text:"来自全国各地的无数网客争相接收任务！",
                            func:[
                                {showFunc:"完全自然人工浏览, 不同地区IP, 真实安全"},
                                {showFunc:"多种人工流量渠道, 深度访问"},
                                {showFunc:"专业的优化提高点击率, 引爆搜索流量"}
                            ],
                            buttonText:"免费下载体验"
                        },
                        {
                            id:4,
                            text:"任务接收者根据您发布任务要求进行以下相关操作",
                            func:[
                                {showFunc:"打开搜索入口, 搜索关键字"},
                                {showFunc:"查找页数, 找到指定商品"},
                                {showFunc:"按设定停留时长浏览店内所有指定商品"},
                                {showFunc:"深度访问店铺、收藏指定宝贝"}
                            ],
                            buttonText:"免费下载体验"
                        },
                        {
                            id:5,
                            text:"恭喜，您发布的任务已完成，店铺流量已上增！",
                            func:[
                                {showFunc:"每日登录, 系统免费赠送100点积分！"},
                                {showFunc:"无需漫长等候, 瞬间即可完成"},
                                {showFunc:"您成功发布任务后, 系统将实时推广并执行任务"}
                            ],
                            buttonText:"立即领取积分"
                        }
                    ]
                }
            }
    }
}
indexmodule.directive("freeList",home.free);
indexmodule.directive("videoList",home.videoList);