<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%response.setHeader("Cache-Control","no-cache");    
response.setHeader("Pragma","no-cache"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Password Manager</title>

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,400,300,600&subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
<style>

body {
	margin: 0;
	padding: 0;
	background: #EEEBDA  repeat-x left top;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #4D4D4D;
	overflow: scroll;
}

h1, h2, h3 {
	margin: 0;
	padding: 0;
	font-weight: normal;
    font-family: initial;
    color: white;
}

#header {
	left: 130px;
	top: 0;
	width: 940px;
	height: 60px;
	margin: 0px auto;
	padding: 0px;
	background: #3D3630;
	position: fixed;
}

/* #logo h1 {
    padding: 7px 5px 5px 0px;
    font-size: 35px;
} */

#page {		
	width: 940px;
	margin: 0px auto;
	padding: 30px 0px;
}

#content {
	float: right;
	width: 592px;
	padding: 0px 30px;
}

#sidebar {	
	float: left;
	width: 288px;
	margin: 0px;
	color: #726B63;
}

#footer {
	left: 130px;
	width: 940px;
	margin: 0px auto;
	padding: 20px 0px;
	background: #3D3630;
	color: grey;
	position: fixed;
	bottom: 0;
}

#footer p {
	margin: 0;
	line-height: normal;
	letter-spacing: 2px;
	text-align: center;
	text-decoration: none;
	text-align: center;
	text-transform: uppercase;
	font-family: 'Arvo', serif;
	font-weight: normal;
	font-size: 10px;
}
.hiddenTable {
	position: relative;
	align: bottom;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.getPassword {
	position: absolute;
	align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

input[type=button] {
	padding: 5px 20px;
	border: 1px solid rgba(0, 0, 0, 0.4);
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), inset 0 10px 10px
		rgba(255, 255, 255, 0.1);
	border-radius: 0.3em;
	background: #0184ff;
	color: white;
	float: right;
	font-weight: bold;
	cursor: pointer;
	font-size: 13px;
}

input[type=button]:hover {
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), inset 0 -10px 10px
		rgba(255, 255, 255, 0.1);
}
select {
    width: 100%;
    padding: 8px 8px;
    margin: 5px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
userdetails {
	font-family: 'Open Sans', sans-serif;
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

#userdetails th {
	font-size: 15px;
	font-weight: 100 text-align: left;
	background-color: #5c9cd8;
	color: white;
	padding: 5px;
}
#userdetails td {
	font-size: 12px;
	border: 1px solid #ddd;
	padding: 2px 15px;
}

userdetailsmodified {
	font-family: 'Open Sans', sans-serif;
	border-collapse: collapse;
	width: 70%;
	text-align: center;
	height: 200px;
}

#userdetailsmodified th {
	font-size: 17px;
	font-weight: 100 text-align: left;
	background-color: #5c9cd8;
	color: white;
	padding: 5px;
}

#userdetailsmodified td {
	font-size: 14px;
	border: 1px solid #ddd;
	padding: 2px 15px;
}

#logo h1, #user {
    float: left;
    width: 49%;
    color: white;
    padding-top: 12px;
}
#user {
    color: white;
    height: 27px;
    padding-top: 22px;
	text-align: -webkit-right;
}
a#logout {
	    color: red;
}
h2.pwdRes {
	padding-bottom: 10px;
}

.box{
        overflow: hidden;
        background: #5c9cd8;
		padding: 5px;
    }
/* Add padding and border to inner content
for better animation effect */
.box-inner {
	width: 600px;
	padding: 10px;	
}
.searchCriteria {
	font-size: 15px;
	font-weight: 100 text-align: left;	
	color: white;
	padding: 2px;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();">
<div id="wrapper">

		<div id="header" class="container">
			<div id="logo"><h1>Password Manager</h1>
				<div id="user">logged in as ${user} &nbsp;
				<a id="logout" onclick="logout()" href="javascript:void(0);">logout</a>
				</div>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
					
					<div style="clear: both;">&nbsp;</div>
					<div id="hiddenTable" style="padding-top: 150px"class="box-inner" align="center"></div>
					<div style="clear: both;">&nbsp;</div>
			</div>
			<!-- end #content -->
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			
			<button type="button" class="slide-left" id= "Hide" value="Hide">&lt;&lt;Hide</button>
			<button type="button" class="slide-right" id= "Show" value="Show">Show&gt;&gt;</button>
			<div>&nbsp;</div>
			<div id="sidebar" class="box">
				<div class="panel-group" id="pwm">
				<form action="retrieveUser" id="submitForm">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
							  <a data-toggle="collapse" data-parent="#pwm" href="#collapse1">Search Criteria</a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body" style="overflow: scroll; height: 300px">
						<label for="userList">User List</label>
							<select id="userList" name="userList">
								<option value="select">select</option>
								<option value="YantraUber">YantraUber</option>
								<option value="BIZ_CONFIG_USER">BIZ_CONFIG_USER</option>
								<option value="BIZ_CONFIG_LEAD">BIZ_CONFIG_LEAD</option>
							</select>
							
							<label for="releaseList">Release List</label>
							<select id="releaseList" name="releaseList">
								<option value="select">select</option>
								<option value="18.41">18.41</option>
								<option value="18.43">18.43</option>
							</select>
							
							<label for="environmentList">Environment List</label>
							<select id="environmentList" name="environmentList">
								<option value="select">select</option>
								<option value="QA01">QA01</option>
								<option value="QA02">QA02</option>
								<option value="QA03">QA03</option>
								<option value="QA04">QA04</option>
								<option value="CIT01">CIT01</option>
								<option value="CIT02">CIT02</option>
							</select>
							
							<label for="applicationList">Application List</label>
							<select id="applicationList" name="applicationList">
								<option value="select">select</option>
								<option value="console">console</option>
								<option value="coreblue">coreblue</option>
								<option value="api tester">api tester</option>
							</select>
				<div>&nbsp;</div>
			<div id="getPassword">
				<input type="button" value="Get Password" onclick="crunchifyAjax()">
			</div>
			</div>
			</div>
			</div>
			<div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#pwm" href="#collapse2">Saved Search</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet</div>
      </div>
    </div>
			</form>
			</div>			
			</div>
		
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
		<div id="footer">
			<p>© All rights reserved.</p>
		</div>
	</div>	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src='<%=request.getContextPath()%>/resources/js/index.js'></script>
	<script type="text/javascript">
	
	function crunchifyAjax() {

    	var rel = $('#releaseList').val();
    	var env= $('#environmentList').val();
    	var app = $('#applicationList').val();
    	var user= $('#userList').val();
	
    	if(validateValues(rel,env,app,user)){
			$.ajax({
				url : 'retrieveUser',
				type: 'POST',
				data: "user="+user+"&application="+app+"&environment="+env+"&release="+rel,
				success : function(result) {            	
					$('#hiddenTable').html(result);
				}
			});
		}
    }
	
    function validateValues(rel,env,app,user){
		if(rel!="select" && env!="select" && app!="select" && user!="select" )
		{
			return true;
			
		} else{
			alert("Please select options for all required fields");
			return false;
		}
	}
    
    function copyToClipboard() {

    	   var textArea = document.createElement( "textarea" );
    	   textArea.value = document.getElementById("pwd").value;
    	   document.body.appendChild( textArea );

    	   textArea.select();

    	   try {
    	      var successful = document.execCommand( 'copy' );
    	      console.log('Copied');
    	   } catch (err) {
    	      console.log('Oops, unable to copy');
    	   }

    	   document.body.removeChild( textArea );
    	}
    
    function logout() {
    	//alert("logging out");
    	//var req = new XMLHttpRequest();
    	//req.open("GET", "login", true);
    	//req.withCredentials = true;
    	//req.send();
    	document.getElementById("submitForm").action="login";
    	document.getElementById("submitForm").method = "GET";
    	document.getElementById("submitForm").submit();
    	//self.close(this.window);
    }
    
    
    function noBack() { 
		window.history.forward(); 
		document.getElementById("Show").style.visibility="hidden";
		
	}
	
	
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        var boxWidth = $(".box").width();
        $(".slide-left").click(function(){
            $(".box").animate({
                width: 0
            });
			$(".box-inner").animate({
				width: 400
			});
			document.getElementById("hiddenTable").style.width="600px";
			document.getElementById("Hide").style.visibility="hidden";
			document.getElementById("Show").style.visibility="visible";
			//$(".box).padding = "0px";
        });
        $(".slide-right").click(function(){
            $(".box").animate({
                width: boxWidth
            });
			$(".box-inner").animate({
				width: boxWidth
			});
			document.getElementById("Show").style.visibility="hidden";
			document.getElementById("Hide").style.visibility="Visible";
        });
    });
</script>
</body>
</html>
