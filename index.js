const express=require('express');
const nsmarty=require('nsmarty');
const mysql=require('mysql')
const bcrypt =require('bcrypt')
const jwt=require('jsonwebtoken')
const auth=require('./middleware/auth')
const util=require('util')
const app =express();
const registerNewUser=require("./db/users_table").registerNewUser
const loginUser=require("./db/users_table").loginUser;
nsmarty.tpl_path=__dirname+"/template/"
app.use(express.json());
app.use(express.urlencoded({extended:true}))
app.get('/signup',(req,res)=>{
    var	stream = nsmarty.assign('signup.tpl');
    util.pump(stream, res);
})
app.post('/signup',(req,res)=>{
  registerNewUser(req.body)
  res.send(req.body)
})
app.get('/signin',(req,res)=>{
  var stream= nsmarty.assign('signin.tpl');
  util.pump(stream,res);
})
app.post('/signin',(req,res)=>{
  loginUser(req.body,req,res);
})
app.get('/user',auth,(req,res)=>{
  res.send(req.user);
})
app.get("/welcome",(req,res)=>{
    var stream= nsmarty.assign('welcome.tpl');
    util.pump(stream,res);
})
app.get('/showproduct',(req,res)=>{
  var $app=req.query
  var stream=nsmarty.assign('showproduct.tpl',$app);
  util.pump(stream,res)
})
app.get('/cart',(req,res)=>{
  var stream=nsmarty.assign('added_cart.tpl');
  util.pump(stream,res)
})
app.get('/getproducts',(req,res)=>{
  res.send(req.query);
})

app.listen(8000)
/* var done = false

const isItDoneYet = new Promise((resolve, reject) => {
  if (done) {
    const workDone = 'Here is the thing I built'
    resolve(workDone)
  } else {
    const why = 'Still working on something else'
    reject(why)
  }
})
 */
/* const Q=require('q')
function myNew(v){
    var k=v;
    return k;
}
function second(v){
    return v+'teja'
}
function third(v) { 
    return v+' koduri'
 }

Q.fcall(myNew,'hari').then(second).then(third).done(function(val){
    console.log(val)
}) */