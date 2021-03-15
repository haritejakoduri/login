{include file="head.tpl"}
<style>
.cartbtn-main{
    float: right;
    top: 0px;
}
</style>
</head>
<body>
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">Dashboard</a>
  <a class="navbar-brand" href="#" id="data">Welcome</a>
  <a href="http://localhost:8000/cart" style="float: right;">
    <button type="button" class="btn btn-primary"  id="cart-go">
        CART <span class="badge bg-secondary" id="items">0</span>
      </button>
  </a>
  <button id="logout"> Logout </button>
</nav>
<div class="container row" id="container-product" style="margin: 0 auto;">

</div>
<script>
function authme(){
    var key=localStorage.getItem("key");
    axios({
                method: 'get',
                url: '/user',
                headers:{
                    auth:key
                }
            })
            .then(function (response) {
                console.log(response);
                if(response.status==200){
                    console.log(response)
                    $("#data").text('welcome '+response.data.username);
                    if(response.data.username==undefined){
                        window.location.replace("http://localhost:8000/signin")
                    }
                }
            })
            .catch(function (error) {
                console.log(error);
                window.location.replace("http://localhost:8000/signin")

            })
}
function products(){
    axios.get('https://jsonplaceholder.typicode.com/albums/1/photos')
  .then((response)=>{
    /* console.log(response.data.length);
    console.log(response); */
        response.data.forEach(element => {
            console.log(element)
            gen_product(element)
        });
  })
}
function gen_product(data){

    data.url='http://localhost:8000/showproduct/?thumbanilUrl='+data.thumbnailUrl+'&title='+data.title;

    let val='<div class="col-3"><div class="card" style="width: 14rem;"><img src="'+data.thumbnailUrl+'" class="card-img-top" alt="..."><div class="card-body"><p class="card-text" id="product-name-text">'+data.title+'</p><button href="'+data.url+'"  class="btn btn-primary" id="datanew"  tumbnailUrl="'+data.thumbnailUrl+'" title="'+data.title+'" onclick="datanew(this)">go here</button> <button onclick="cartbutton(this)" class="btn btn-primary">add cart</button> </div></div></div>'
    $("#container-product").append(val);
}
function cartbutton(data){
    let newdata=`<div class="btn-group cartbtn-main" role="group" aria-label="Basic example">
  <button type="button" id="addcartone" onclick="addcartone(this)" class="btn btn-primary">+</button>
  <button type="button" class="btn btn-primary">0</button>
  <button type="button" onclick='removecartone(this)' class="btn btn-primary">-</button>
</div>`
$( data ).replaceWith( newdata );
}
function datanew(data){
    //console.log(data)
    var thumbnailUrl=$(data).attr("tumbnailurl")
    var title=$(data).attr("title");
    //getproducts
    var producturl='http://localhost:8000/getproducts/?thumbanilUrl='+thumbnailUrl+'&title='+title;
    var showproduct='http://localhost:8000/showproduct/?thumbanilUrl='+thumbnailUrl+'&title='+title;
   console.log(producturl)
    window.localStorage.setItem("product",producturl)
    window.location.href = showproduct;
      /*   console.log("tel")
        var self = $(this);
        var href = self.attr('href')
        console.log(self)
        console.log(href)
        window.localStorage.setItem('product', href); */
};
var cartData=[]
function addcartone(data){
   var k=Number($(data).next().text())
   var name=$(data).parent().parent().children('#product-name-text').text();
    k+=1;
    var newvalue={
       name:name,
       quan:k
    }
    console.log(newvalue)
    if(cartData==[]){
        cartData.push(newvalue);
        $("#items").text(cartData.length)
        var savenew= JSON.stringify(cartData)
        window.localStorage.setItem("cart",savenew)
    }
    else{
        var test=false;
        cartData.forEach(element => {
            if(element.name==newvalue.name){
                element.quan=newvalue.quan;
                test=true;
            }
        });
        if(test==false){
            cartData.push(newvalue)
            $("#items").text(cartData.length)
            var savenew= JSON.stringify(cartData)
            window.localStorage.setItem("cart",savenew)
        }
        else{
            var savenew= JSON.stringify(cartData)
            window.localStorage.setItem("cart",savenew)
        }
    }
    
   console.log(newvalue)
   $(data).next().text(''+k)

   /* var data=JSON.stringify(data)
   window.localStorage.setItem("cart",data)
    $(data).next().text(''+k) */
}
function removecartone(data){
    var k=Number($(data).prev().text())
   var name=$(data).parent().parent().children('#product-name-text').text();
    if(k!=0&&k>0){ 
   k-=1;
    var newvalue={
       name:name,
       quan:k
    }
    $(data).prev().text(''+k)
    if(cartData==[]){
        cartData.push(newvalue);
        $("#items").text(cartData.length)
        var savenew= JSON.stringify(cartData)
        window.localStorage.setItem("cart",savenew)
    }
    else{
        var test=false;
        cartData.forEach(element => {
            if(element.name==newvalue.name){
                element.quan=newvalue.quan;
                test=true;
            }
        });
        if(test==false){
            cartData.push(newvalue)
            $("#items").text(cartData.length)
            var savenew= JSON.stringify(cartData)
            window.localStorage.setItem("cart",savenew)
        }
        else{
            var savenew= JSON.stringify(cartData)
            window.localStorage.setItem("cart",savenew)
        }
    }
   }
}

$(function(){
    authme()
    $("#logout").click(function(){
        localStorage.clear();
        window.location.replace("http://localhost:8000/signin")
    })
    

    //
    products()
})
</script>
</body>