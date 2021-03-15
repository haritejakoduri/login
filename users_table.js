const mysql=require('mysql')
const bcrypt =require('bcrypt')
const jwt=require('jsonwebtoken')
const connection =mysql.createConnection({
    host:'localhost',
    user:'root',
    database:"users"
})
connection.connect(function(err){
    if(err){
        console.log('error connecting:' +err.stack);
        return;
    }
    console.log('connected as id' + connection.threadId);
});
/* const data={
    address_1: "csdlfjsldfjsdsdfsdfa",
    address_2: "sdkfjsdjfasdjfsdlfj",
    city: "chennai",
    country: "India",
    email: "lsdfjslkf@ldksjf.com",
    firstname: "lsdfjlj",
    lastname: "sdlfkjsdlfj",
    password: "asdfasdf88",
    phonenumber: "1231231231",
    state: "thamilnadu",
    terms: true,
    username: "saassdlfasdjasksdljf",
    zipcode: "522502"
} */
 function registerNewUser(data){
    /* saltRound should have to store in env variables */
const saltRounds = 10;
const myPlaintextPassword=data.password;
/* Q.fcall(bcrypt.genSalt,10)
 .then(bcrypt.hash,,myPlaintextPassword)
 .then(f)
 */
bcrypt.genSalt(saltRounds, function(err, salt) {
    bcrypt.hash(myPlaintextPassword, salt, function(err, hash) {
        connection.query(
            `INSERT INTO details (firstname,lastname,email,username,phonenumber,address_1,address_2,city,country,state,zipcode,password) VALUES('${data.firstname}','${data.lastname}','${data.email}','${data.username}','${data.phonenumber}','${data.address_1}','${data.address_2}','${data.city}','${data.country}','${data.state}','${data.zipcode}','${hash}');`
            , function (error, results, fields) {
            if (error){
                console.log(error.code);
                if(error.code=='ER_DUP_ENTRY'){
                    console.log("please enter diffrent user name")
                }
            }
        });
    });
});
}
function loginUser(user,req,res){
    var loggin;
    connection.query(`SELECT * FROM details WHERE username='${user.username}'`,
    function (error, results, fields) {
        if (error){
            console.log(error.code);
        }
     try{
        const hash=results[0].password;
        bcrypt.compare(user.password, hash, function(err, result) {
            if(err){
                console.log(err)
                result={
                    result:false
                }
            }
            if(result==true){
                var jwt = require('jsonwebtoken');
                var token = jwt.sign({ username:user.username,password:hash }, 'secret_key_shoud_be_stored_in_env_variables');
                result={
                    key:token,
                    result:true
                }
            }
            //console.log(result)
            res.send(result)
        });
     }
     catch(err){
         res.send({
             result:false
         })
         console.log('something problem');
     }
    })
    //callback(loggin)
   /*  bcrypt.compare(user.password, hash, function(err, result) {
        // result == true
    }); */
}
module.exports={
    registerNewUser:registerNewUser,
    loginUser:loginUser
}