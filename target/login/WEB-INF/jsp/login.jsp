<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<meta http-equiv="Content-Type" content="text/html;charset=gbk" />

	<script src="./res/jquery-2.1.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").click(function(){
				//get input text username and password
				var name = $("#name").val();
				var password = $("#password").val();
				/*check username not empty*/
				if(name == null||name == ""){
					var error = "username can't be empty!";
					$("#remind").text(error);
					return;
				}
				/*check password not empty*/
				if(password == null || password == ""){
					var error = "password can't be empty!";
					$("#remind").text(error);
					return;
				}
				//connect with server
				var da = "name="+name+"&password="+password;
				$.post("LoginCheck",da,function(data,status){
					/*server wrong*/
					if(status != "success"){
						$("#remind").text("Server is busy");
						return;
					}
					//login fail
					if(data == "success"){
						location.reload();
						return;
					}
					//login success

					$("#remind").text(data);
					return;});

			});
			$("#register").click(function(){
				top.location = "register.html";
			});
			$(document).keydown(function(event){
				if(event.keyCode==13){
					$("#submit").click();
				}
			});
		});

	</script>

	<style type="text/css">
		#login{
			width:300px;
			height:210px;
			position:absolute;
			left:50%;
			top:50%;
			margin-left:-150px;
			margin-top:-105px;
			background-image:url("./res/bk.png");
		}
		#login_div{
			text-align:center;
		}
		body{
			background-image:url("./res/freshfruit3.jpg");
		}
		#remind{
			color:red;
			font-size:1em;
		}
	</style>

</head>
<body>
<form name="formid" method="post" id=login action="LoginCheck">
	<fieldset >
		<legend><h2>Login</h2></legend>
		<div id=login_div>
			Username<input id="name" name="name" type="text" size="30" /><br />
			Password<input id="password" name="password" type="password" size="30" /><br />
			<p  id="remind">&nbsp&nbsp</p>
			<input type="button"  id="submit" value="submit" />
			<input type="button"   value="register"/>
		</div>
	</fieldset>
</form>
</body>
</html>