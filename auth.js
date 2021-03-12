/* const express=require('express');
//to validate key
const jwt=require('jsonwebtoken')
exports.auth=function(req,res,next){
    try{
        var token=req.headers.auth;
        var decoded = jwt.verify(token, 'secret_key_shoud_be_stored_in_env_variables');
        console.log(decoded.username)
        next();
    }
    catch(err){
        console.log(err)
    }
    
} */
const jwt=require('jsonwebtoken')
function auth(req,res,next){
    const token=req.header('auth');
    if(!token){
       return res.status(400).send("there is no token")
    }
    try{
        var decoded = jwt.verify(token, 'secret_key_shoud_be_stored_in_env_variables');
        req.user=decoded;
        next();
    }
    catch(ex){
        res.send('Invalid token');
    }

}
module.exports=auth;