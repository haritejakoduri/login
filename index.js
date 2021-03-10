const express=require('express');
const nsmarty=require('nsmarty');
const util=require('util')
const app =express();
nsmarty.tpl_path=__dirname+"/template/"
app.get('/',(req,res)=>{
    var	stream = nsmarty.assign('test.tpl');
    util.pump(stream, res);
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