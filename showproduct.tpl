{include file="head.tpl"}
</head>
<body>
   <div class="fluid-container" id="full-view">
       <h1>full view</h1>
   </div>
</body>
<script>
    function newData(){
        axios.get('http://localhost:8000/getproducts/?thumbanilUrl="{$thumbanilUrl}"&title="{$title}"')
  .then((response)=>{
    /* console.log(response.data.length);
    console.log(response); */
    $("#full-view").append("<img src="+response.data.thumbanilUrl+" style='width:100%;height:300px'/><p>"+response.data.title+"</p>")
       console.log(response)
  })}
  $(function(){
      newData()
  })
</script>
</head>