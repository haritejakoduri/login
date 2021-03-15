{include file="head.tpl"}
</head>
<body>
<h1>cart page</h1>
<div class="container">
    <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">item</th>
            <th scope="col">quantity</th>
          </tr>
        </thead>
        <tbody id="to-push-data">

        </tbody>
    </table>
    <button type="button" name="" id="" class="btn btn-primary btn-lg btn-block">Check Out</button>
</div>
<script>
function getCart(){
    var cart=window.localStorage.getItem('cart')
    var cart=JSON.parse(cart)
    cart.forEach((element,index) => {
        val=index+1;
        $("#to-push-data").append(" <tr><th scope='row'>"+val+"</th><td>"+element.name+"</td><td>"+element.quan+"</td></tr>")
    });
    console.log(cart);
}
$(function(){
    getCart()
})

</script>
</body>
</html>