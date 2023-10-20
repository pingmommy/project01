<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style type="text/css">

  @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');


img {
	margin:10px;
    margin-left: 500px;
  
 /* border: 1px solid red; */
}

div {
/*  border: 1px solid green; */
   margin-top: 150px;
   margin-left: 1000px;
   font-size: xx-large;
   opacity: 0.8; 
   font-family: 'Black Han Sans', sans-serif;
   color: gray;  
}

span {
	width:70px;
	font-weight: 900;
	opacity: 1.0;
	animation : rotate 3s infinite alternate;
	 font-size: 50px;
}

@keyframes rotate {
from {color: pink;}
  to {color: yellow;}
}

</style>

<script type="text/javascript">
 $(document).ready(
		setInterval(function () {
		   $('img').fadeOut(0).fadeIn(5000).delay(2000).fadeOut(4000),1000
	})
		)

</script>

</head>
<body>
<div> <span>조아라</span> 입니다.</div>
<img alt="xxx" src="/media/hello.jpg">
</body>
</html>