<!DOCTYPE html>
<html oncontextmenu=self.event.returnValue=false>
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
				$.post("login",da,function(data,status){
					/*server wrong*/
					if(status != "success"){
						$("#remind").text("Server is busy");
						return;
					}
					//login success
					if(data == "success"){
						location.reload();
						return;
					}
					//login fail

					$("#remind").text(data);
					return;});

			});
			$("#register").click(function(){
				location.href = "register";
			});
			$(document).keydown(function(event){
				if(event.keyCode==13){
					$("#submit").click();
				}
			});
			init();
		});
		function init(){
			images = [];
			t =0;
			perNo = 0;
			nowNo = 0;
			for(i=1;i<14;i++){
				images[i] = new Image();
				images[i].src = "./res/freshfruit"+i+".jpg";
			}
			bki();
		}
		//change the backgroundImage random
		function bki(){
			var len = images.length;
			do {
				var no = Math.floor(len * Math.random());
			}while(no == 0);
			preNo = nowNo;
			nowNo = no;

			document.body.style.backgroundImage = 'url("'+images[no].src+'")';
			t=setTimeout("bki()",3000);
		}

		//body onclick()
		function bodyclick(event){
			var btnNum = event.button;
			changebk(btnNum);
		}

		//set backgoundImage by no;
		function bki_i(i){
			if(i<0||i>(images.length-1)){
				t = bki();
			}else{
				document.body.style.backgroundImage = 'url("'+images[i].src+'")';
			}
		}

		//change the background
		function changebk(w){
			//1---next
			clearTimeout(t);
			if(0 == w){
				bki();
			}else if(2 == w){
				bki_i(preNo);
			}
		}

	</script>

	<style type="text/css">
		input{
			background:rgba(255,255,255,0.2);
		}

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

		#remind{
			color:red;
			font-size:1em;
		}
	</style>

</head>
<body>
<form name="formid" method="post" id="login" action="logincheck">
	<fieldset >
		<legend><h2>Login</h2></legend>
		<div id=login_div>
			Username<input id="name" name="name" type="text" size="30" /><br />
			Password<input id="password" name="password" type="password" size="30" /><br />
			<p  id="remind">&nbsp&nbsp</p>
			<input type="button"  id="submit" value="submit" />
			<input type="button" id="register"  value="register"/>
		</div>
	</fieldset>
</form>
</body>
</html>