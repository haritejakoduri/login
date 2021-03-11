{include file="head.tpl"}
<style>
    .login-main,.main-left{
        height :100vh;
    }
    .main-left{
     background-image: linear-gradient(to bottom, #3fe9f9, #00ebea, #00edd4, #00edb8, #12eb96);
    }
</style>
</head>
<body>
<div class="fluid-container login-main">
<div class="fluid-container row">
    <div class="col-6 main-left">

    </div>
    <div class="col-6 align-self-center">
        <form method="post" action='/' class="fluid-container row">
            <div class="col-12">
                <h3>Login</h3>
                <hr>
        </div>
            <div class="form-group col-12">
            <label for="username">User name</label>
            <input type="text"
                class="form-control" name="username" id="username" aria-describedby="userid-help" placeholder="user id" required>
            <small id="username-help" class="form-text text-muted"> </small>
            </div>
            <div class="form-group col-12">
                <label for="">password</label>
                <input type="password"
                    class="form-control" name="password" id="password" aria-describedby="password-help" placeholder="password" required>
                <small id="password-help" class="form-text text-muted"> </small>
                </div>
                <button type="submit" id="submit" class="btn btn-primary btn-block">Sign in</button>
            </form>
    </div>
</div>
</div>
<script>
        var login={
            username:'',
            password:''
        }
    function validate(name){
        var value=false;
        if(name=="username"&& (login.username==''||login.username.length<=6)){
            $("#username-help").text("enter a valid username");
            $("#submit").prop('disabled', true);
            return value;
        } else if(name=="password"&&(login.password==''||login.username.length<=6)){
            $("#password-help").text("enter a valid password");
            $("#submit").prop('disabled', true);
            return value;
        }
        else{
            if(
                (login.username!=''&&login.username.length>=6)
                &&
                (login.password!=''&&login.password.length>=6)
            ){  
            $("#submit").prop('disabled', false);
            }
            $("#password-help").text("");
            $("#username-help").text("");
            return login;
        }
    }
    $(function(){
        $('#username').keyup(function(){
            login.username=$("#username").val()
            console.log(validate('username'))
        })
        $('#password').keyup(function(){
            login.password=$("#password").val()
            console.log(validate('password'))
            
        })
        $('#submit').click(function(event){
            event.preventDefault();
            console.log(login)
            axios({
                method: 'post',
                url: '/signin',
                data: login
            })
            .then(function (response) {
                console.log(response);
                if(response.data==false){
                    alert("email id or password wrong! try again!")
                    $("#username").val("")
                    $("#password").val("")
                }
                if(response.data==true){
                    window.location.replace("http://localhost:8000/welcome")
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        })
        $("#submit").prop('disabled', true);
    })
</script>
</body>
</html>