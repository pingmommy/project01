<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.spinner-box {
	width: 300px;
	height: 300px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: transparent;
	border: 1px solid red;
 }

.confiqure-border-1 {
	width: 115px;
	height: 115px;
	padding 3px;
	position:absolute;
	display: flex;
	justify-content: center;
	align-items: center;
	background:  #fb5b53;
	animation: configure-clockwise 3s ease-in-out 0s infinite alternate; 
	border: 10px solid blue;
	}
	
.configure-border-2 {
	width: 115px;
	height: 115px;
	paddig: 3px;
	left: 0px;
	display: flex;
	justify-content:center;
	align-items: center;
	background: rgb(63,249,220);
	transform:rotate(45deg);
	animation: configure-xclockwise 3s ease-in-out 0s infinite alternate; 
	border: 15px solid green;
 	 }
  
  configure-core {
  	width: 100%;
  	height: 100%;
  	background-color: red;
  	border: 20px solid purple;
  	}
  	
  	@keyframes configure-clockwise {
  		0%{
  			transform: rotate(0);
  		}
  		25%{
  			transform:rotate(90deg);
  		}
  		50%{
  			transform:rotate(180deg);
  		}
  		75% {
  			transform:rotate(270deg);
  		}
  		100%{
  			transform:rotate(360deg);
  		}
  	}
  	
  	@keyframes configure-xclockwise{
  	   0%{
  	   		transform:rotate(45);
  	   }
  	   25%{
  	   		transform:rotate(-45deg);
  	   }
  	   50%{
  	   		transform:rotate(-135deg);
  	   }
  	   75% {
  	   		transform:rotate(225deg);
  	   }
  	   100% {
  	   		transform:rotate(-315deg);
  	   }
  	}
  	
  		
</style>
</head>
<body>
 <div class="spinner-box">
 	<div class="confiqure-border-1">
 		
 	</div>
 	<div class="configure-border-2">
 		
 	</div>
 </div>
</body>
</html>