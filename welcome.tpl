{include file="head.tpl"}
</head>
<body>
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">Dashboard</a>
  <a class="navbar-brand" href="#" id="data">Welcome</a>
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
    let val='<div class="col-3"><div class="card" style="width: 14rem;"><img src="'+data.thumbnailUrl+'" class="card-img-top" alt="..."><div class="card-body"><p class="card-text">'+data.title+'</p><button href="'+data.url+'"  class="btn btn-primary" id="datanew"  tumbnailUrl="'+data.thumbnailUrl+'" title="'+data.title+'" onclick="datanew(this)">go here</button></div></div></div>'
    $("#container-product").append(val);
}

function datanew(data){
    console.log(data)
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
$(function(){
    authme()
    $("#logout").click(function(){
        localStorage.clear();
        window.location.replace("http://localhost:8000/signin")
    })
    products()
   $("#newclick").click(function(){
        localStorage.clear();
        window.location.replace("http://localhost:8000/signin")
    })

    
})
</script>
</body>