<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Password Manager</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<style>

body{
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    font-size: 14px;
	background: #EEEBDA  repeat-x left top;
	margin: 0;
	overflow: scroll;
}

form {
    margin: 5px;
    width: 300px;
    height: 300px;
}

input[type=text], input[type=password] {
	width: 96%;
	padding: 5px 5px;
	background: #fff;
	border: 1px solid #222;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1);
	border-radius: 0.3em;
	margin-bottom: 10px;
}
input[type=submit] {
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

input[type=submit]:hover {
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), inset 0 -10px 10px
		rgba(255, 255, 255, 0.1);
}

input[type=text]:hover, input[type=password]:hover, label:hover ~ input[type=text],
	label:hover ~ input[type=password] {
	background: #fff;
}

input[type=text]:focus, input[type=password]:focus {
	padding: 8px 5px;
	margin-bottom: 20px;
	border: 1px solid rgba(81, 203, 238, 1);
}
#pageBody {	
    width: 28%;
    height: auto;
    margin: 0 auto;
}
#header {
	left: 130px;
	position: fixed;
	top: 0;
    width: 940px;
    height: 60px;
    margin: 0px auto;
    padding: 0px;
    background: #3D3630;
}
#footer {
	left: 130px;
	position: fixed;
	bottom: 0;
	width: 940px;
	margin: 0px auto;
	padding: 20px 0px;
	background: #3D3630;
	color: grey;
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

h1, h2, h3 {
    margin: 0;
    padding: 0;
    font-weight: normal;
    font-family: initial;
    color: white;
}
#logo h1 {
    float: left;
    width: 49%;
    color: white;
    padding-top: 14px;
    font-size: 2em;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();">

		<div id="header" class="container">
			<div id="logo"><h1>Password Manager</h1>
			</div>
		</div>
		<div style="clear: both;">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
	<div id="pageBody"  style="padding-top: 150px">
		<form action="login" method="POST">
					User ID</label> <input type="text" name="userid" id="userid">	
					Password</label> <input type="password" name="password" id="password">
					<input type="submit" name="go" id="go" value="Log in">
		</form>
	</div>
	<div id="footer">
			<p>© All rights reserved.</p>
		</div>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	function noBack() { window.history.forward(); }
	</script>

<object id="__symantecPKIClientMessenger" data-supports-flavor-configuration="true" data-extension-version="0.5.0.109" style="display: none;"></object><span id="__symantecPKIClientDetector" style="display: none;">__PRESENT</span></body>
</html>
