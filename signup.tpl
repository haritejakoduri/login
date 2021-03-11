{include file="head.tpl"}
<style>
    .main-left{
     background-image: linear-gradient(to bottom, #3fe9f9, #00ebea, #00edd4, #00edb8, #12eb96);
    }
</style>
</head>
<body>
    <div class="fluid-container row">
        <div class="col-4 main-left">
            
        </div>
        <div class="col-8">
            <h1>Sign up</h1>
            <hr />
            <form action="/" method="post">
                <div id="form-box" class="fluid-container row">
                   <div class="form-group col-6">
                      <label for="firstname">First Name</label>
                      <input type="text" class="form-control" name="firstname" id="firstname" aria-describedby="firstname-help" placeholder="Enter Firstname" required>
                      <small id="firstname-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="lastname">Lastname Name</label>
                      <input type="text" class="form-control" name="lastname" id="lastname" aria-describedby="lastname-help" placeholder="Enter lastname" required>
                      <small id="lastname-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" name="email" id="email" aria-describedby="email-help" placeholder="Enter Email" required>
                      <small id="email-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="username">User Name</label>
                      <input type="text" class="form-control" name="username" id="username" aria-describedby="helpId" placeholder="First name" required>
                      <small id="username-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="phonenumber">Phone number</label>
                      <input type="text" class="form-control" name="phonenumber" id="phonenumber" aria-describedby="phonenumber-help" placeholder="Phone number" minlength=10 maxlength=15  oninvalid="this.setCustomValidity('phone number shuld be at least 10 at most 15')" required>
                      <small id="phonenumber-help" class="form-text text-muted"></small>
                   </div>
                   <div class="col-12">
                        <h3>Location info</h3>
                        <hr>
                   </div>
                   <div class="form-group col-6">
                      <label for="address_1">Address Line 1</label>
                      <input type="text" class="form-control" name="address_1" id="address_1" aria-describedby="address_1-help" placeholder="Address Line 1" required>
                      <small id="address_1-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="address_2">Address Line 2</label>
                      <input type="text" class="form-control" name="address_2" id="address_2" aria-describedby="address_2-help" placeholder="Address Line 2" required>
                      <small id="address_2-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="city">City</label>
                      <input type="text" class="form-control" name="city" id="city" aria-describedby="city-help" placeholder="City" required>
                      <small id="city-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="country">Country</label>
                      <input type="text" class="form-control" name="country" id="country" aria-describedby="helpId" placeholder="Country" required>
                      <small id="country-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="state">State</label>
                      <input type="text" class="form-control" name="state" id="state" aria-describedby="helpId" placeholder="State" required>
                      <small id="state-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="zipcode">Zipcode</label>
                      <input type="text" class="form-control" name="zipcode" id="zipcode" aria-describedby="helpId" placeholder="Zip Code" required>
                      <small id="zipcode-help" class="form-text text-muted"></small>
                   </div>
                   
                    <div class="col-12">
                        <h3>Password Info</h3>
                        <hr>
                   </div>
                   <div class="form-group col-6">
                      <label for="password">Password</label>
                      <input type="password" class="form-control" name="password" id="password" aria-describedby="password-help" placeholder="Password" required>
                      <small id="password-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-6">
                      <label for="password-check">Conform Password</label>
                      <input type="password" class="form-control" name="password-check" id="password-check" aria-describedby="password-check-help" placeholder="Confirm Password" required>
                      <small id="password-check-help" class="form-text text-muted"></small>
                   </div>
                   <div class="form-group col-12">
                    <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="terms" required>
                    <label class="form-check-label" for="terms">
                        Agree to all terms and conditions
                    </label>
                      <small id="terms-help" class="form-text text-muted"></small>
                    </div>
                   </div>
                        <button type="submit" id="submit" class="btn btn-primary btn-block">Sign up</button>
                   </div>
                </div>
            </form>
        </div>
    </div>
    <script>
    let formValues={}
    var values=['firstname',"email","phonenumber","zipcode",'lastname','username','address_1','address_2','city','country','state','password','password-check','terms']
    function getvalues(){
         for(i=0;i<values.length;i++){
             let now=values[i]
             if(now=='terms'){
                 $('#terms').on('change',()=>{
                    formValues[now]=$("#terms").prop("checked")
                    console.log(formValues)
                    validate(now)

                 })
                return ;
             }
            $("#"+now).keyup(function() {
                formValues[now]=$(this).val()
                console.log(formValues)
                validate(now)
            });     
        }
    }
    function stopButton(){
            $("#submit").prop('disabled', true);
    }
    function startButton(){
            $("#submit").prop('disabled', false);
    }
    function validate(name){
        if(name=="firstname" && formValues[name].length<4){
            $("#firstname-help").text("name shoud be more than 3 characters");
            stopButton()
        }
        else{
            if(name=="firstname"){
                startButton()
            }
             $("#firstname-help").text("")
        }
        if(name=="lastname" && formValues[name].length<4){
            $("#lastname-help").text("name shoud be more than 3 characters");
            stopButton()
        }
        else{
             $("#lastname-help").text("")
             if(name=="lastname"){
                 startButton()
             }
        }
        if(name=="phonenumber" && formValues[name].length<10 && formValues[name].length>=16){
            $("#phonenumber-help").text("please enter a valid numbers");
            stopButton()
        }
        else{
             $("#phonenumber-help").text("")
             if(name=="phonenumber"){
                 startButton()
             }
        }
        if(name=="zipcode" && formValues[name].length!=6){
            $("#zipcode-help").text("please enter a valid 6 digit zipcode");
            stopButton()
        }
        else{
            if(name=="zipcode"){
                startButton()
            }
             $("#zipcode-help").text("")
        }
        if(name=="username" && formValues[name].length<6){
            stopButton()
            $("#username-help").text("username should be more than 5 letters");
        }
        else{
            if(name=="username"){
                startButton()
            }
             $("#username-help").text("")
        }
        if(name=="address_1" && formValues[name].length<=15){
            $("#address_1-help").text("address 1 should be valid");
            stopButton()
        }
        else{
            if(name=='add-line-1'){
                startButton()
            }
             $("#address_1-help").text("")
        }
        if(name=="address_2" && formValues[name].length<=15){
            $("#address_2-help").text("address 2 should be valid");
            stopButton()
        }
        else{
            if(name=='address_2'){
                startButton()
            }
             $("#address_2-help").text("")
        }
        if(name=="city" && formValues[name].length<=3){
           stopButton()
            $("#city-help").text("city 2 should be valid");
        }
        else{
             if(name=="city"){
                startButton()
            }
             $("#city-help").text("")
        }
        if(name=="country" && formValues[name].length<=3){
            stopButton()
            $("#country-help").text("country 2 should be valid");
        }
        else{
             if(name=="country"){
                startButton()
            }
             $("#country-help").text("")
        }
        if(name=="state" && formValues[name].length<=3){
            stopButton()
            $("#state-help").text("state 2 should be valid");
        }
        else{
             if(name=="state"){
                startButton()
            }
             $("#state-help").text("")
        }
        if(name=="password"&& formValues[name].length<8){
            stopButton()
            $("#password-help").text("password should be valid");
        }
        else{
             if(name=="password"){
                startButton()
            }
             $("#password-help").text("")
        }
        if(name=="password-check"&&formValues[name]!=formValues["password"]){
            stopButton()
            $("#password-check-help").text("password should match");
        }
        else{
             if(name=="password-check"){
                startButton()
            }
             $("#password-check-help").text("");
        }
        if(name=='terms'&& formValues[name]==false){
            $("#terms-help").text("please accept terms and conditions")
            stopButton()
        }
        else{
            if(!formValues["terms"]){
            $("#terms-help").text("please accept terms and conditions")
            }
            if(name=='terms'){
                startButton()
            }
             $("#terms-help").text("");
        }
        if (name=='email' && !/.+@.+\..+/.test(formValues[name]))
        {
            $("#email-help").text("please enter valid email")
            stopButton()
        }
        else{
            $("#email-help").text("");
             if(name=="email"){
                startButton()
            }
        }
         if(!formValues["terms"]){
            $("#terms-help").text("please accept terms and conditions")
            }
    }
    $(function(){
        getvalues()
        $('#submit').click(function(event){
            event.preventDefault();
            axios({
                method: 'post',
                url: '/signup',
                data: formValues
            })
            .then(function (response) {
                console.log(response);
                if(response.status==200){
                    window.location.replace("http://localhost:8000/signin")
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