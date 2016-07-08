/**
 * Created by Administrator on 2016/7/1.
 */
var mongoose=require("mongoose");
mongoose.connect("mongodb://127.0.0.1:27017/mydb");

var schema=new mongoose.Schema({
    name:String,
    path:String
});

module.exports=mongoose.model("photo",schema);