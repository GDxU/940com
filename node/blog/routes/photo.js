/**
 * Created by Administrator on 2016/7/1.
 */
var Photo=require("../models/photos");
var path=require("path");
var fs=require("fs");
var join=path.join;


var photos=[];
photos.push({
    name:"nodejs  logo",
    path:"images/bank_find.png"
});
photos.push({
    name:"people",
    path:"images/center_user.png"
});

exports.list=function(req,res){
    res.render("photos",{
        title:"photo",
        photos:photos
    })
};
exports.form=function(req,res){
    res.render("upload",{
        title:"upload file"
    });
};
exports.submit=function(dir){
       return function(req,res,next){
           var img=req.files.photo.image;
           var name=req.body.photo.name||img.name;
           var path=join(dir,img.name);
           fs.rename(img.path,path,function(err){
               if(err){
                   return next(err);
               }
               Photo.create({
                   name:name,
                   path:img.path
               },function(err){
                    if(err){
                        return next(err);
                        fs.redirect("/");
                    }
               })
           })
       }
}