<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2015/8/27
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login Register</title>
  <script src="./res/jquery-2.1.4.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $("#registerbutton").click(function(){
        /*reset the img*/
        $("#usernameimg").attr("src","./res/empty.png");
        $("#passwordimg").attr("src","./res/empty.png");
        $("#pwdagainimg").attr("src","./res/empty.png");
        $("#remind").text(" ");
        //get input text info
        var name = $("#name").val();
        var password = $("#password").val();
        var pwdagain = $("#pwdagain").val();
        var sex = $("#sex").val();
        var address = $("#address").val();
        var code = $("#code").val();
        //check information not empty
        if(name == ""){
          $("#usernameimg").attr("src","./res/err.png");
          $("#remind").text("name can not be empty");
          return;
        }
        if(password == ""){
          $("#passwordimg").attr("src","./res/err.png");
          $("#remind").text("password cant not be empty");
          return;
        }
        if(pwdagain == ""){
          $("#pwdagainimg").attr("src","./res/err.png");
          $("#remind").text("password again");
          return;
        }
        if(pwdagain != password){
          $("#pwdagainimg").attr("src","./res/err.png");
          $("#remind").text("twice password is diff");
          return;
        }
        if(code == ""){
          $("#remind").text("code can't be empty");
          return;
        }
        if(sex == ""){
          sex = "unknown";
        }
        if(address == ""){
          address = "earth";
        }
        //connect with server by ajax
        var url = "codecheck?code="+code+"&ramdom="+Math.random();
        $.get(url,function(data,status){
          if(status != "success") {
            $("#remind").text("Server is busy");
            return;
          }
          if(data != "success"){
            $("#remind").text(data);
            $("#codeimg").attr("src","/codeimg?random="+Math.random());
            return;
          }
          //code is right and go on
          var postData = "name="+name+"&password="+password+"&sex="+sex+"&address="+address;
          $.post("register",postData,function(data,status){
            if(status != "success"){
              $("#remind").text("Server is busy");
              return;
            }
            //if ok,just refresh,the server add a attribute("name",name) in session
            if(data == "success"){

              location.reload();
              return;
            }
            $("#remind").text(data);
            return;
          });
        });
      });
      //connect with entry
      $(document).keydown(function(event){
        if(event.keyCode==13){
          $("#registerbutton").click();
        }
      });
      $("#codeimg").click(function(){
        $("#codeimg").attr("src","/codeimg?random="+Math.random());
      });
    });
  </script>
  <style type="text/css">
    #register{
      width:340px;
      height:350px;
      position:absolute;
      left:50%;
      top:50%;
      margin-left:-160px;
      margin-top:-330px;

    }
    h1{
      font-size:3em;
    }
    body{
      background-color:green
    }
    #remind{
      font-weight:bold;
      font-size:17px;

      text-align:center;
      color:#930000;

    }
    .t{
      font-size:20px;
      font-weight:bold;

    }
    .in{
    }
    .anniu{
      height:50px;
      width:320px;
      background-color:#9ACD32;
      font-size:2em;
    }

  </style>
</head>
<body>
<form  id="register" method="post" action="register">
  <h1 style="text-align:center">Register</h1>
    <table class="t">
      <tr>
        <td>&nbspusername: </td>
        <td><input id="name" type="text" size="20"/></td>
        <td><img id="usernameimg"/></td>
      </tr>
      <tr>
        <td>&nbsppassword: </td>
        <td><input id="password" type="password" size="20"/></td>
        <td><img id="passwordimg"/></td>
      </tr>
      <tr>
        <td>&nbsppwdagain: </td>
        <td><input id="pwdagain" type="password" size="20"/></td>
        <td><img id="pwdagainimg"/></td>
      </tr>
      <tr>
        <td>&nbspsex: </td>
        <td><input id="sex" type="text" size="20"/></td>
        <td><img id="seximg"/></td>
      </tr>
      <tr>
        <td>&nbspaddress: </td>
        <td><input id="address" type="text" size="20"/></td>
        <td><img id="addressimg"/></td>
      </tr>
      <tr>
        <td>&nbspcode: </td>
        <td><input id="code" type="text"maxlength="4"/> </td>
        <td><img /></td>
      </tr>
      <tr>
        <td> </td>
        <td><img src="/codeimg" id="codeimg"/></td>
      </tr>
    </table>
    <p id="remind">&nbsp</p>
    &nbsp<input class="anniu" id="registerbutton" type="button" value="register"/>
</form>
</body>
</html>
