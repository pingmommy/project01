<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.example{
	animation: example 2s infinite;
	
}
@keyframes example {
  from {
      transform: scale(1);
      }
  to {
  transform: scale(3);
  }
}
.vibration{
	animation: vibration 0.1s infinite;
	
}


@keyframes vibration {
  from {
    transform: rotate(2deg);
  }
  to {
    transform: rotate(-2deg);
  }
}

</style>
<script type="text/javascript">
function example(target){
	console.log("ccc");
	target.classList.add("vibration");
	
	setTimeout(function(){
		target.classList.remove("vibration");
	},400);
}
</script>
</head>
<body>
<div id="div" style="border: 1px solid red; width: 100px; height: 100px;" onclick="example(this)">
https://gurtn.tistory.com/170
</div>
</body>
</html>