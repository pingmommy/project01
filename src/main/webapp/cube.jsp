<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube4.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

body {

	height: 1000px;
}

.perspective {
/* 	 border: 20px dashed plum;
 */	 display: inline-block;
	 margin: 200px 0px 0px 200px;
	
 	perspective: 500px;
 
	
}

.cube {
	/* border: 10px dotted gray; */
	display: inline-block;
	transform-style: preserve-3d;
	
	/* animation : rotate 10s infinite linear; */
	
	 transform: rotateX(45deg);
}

.base {
	/* border: 2px solid pink; */
	width:200px;
	height: 200px;
	/* background: pink; */
	text-align: center;
	font-size: 1em;
	line-height: 200px;	
	
}

.front,.back,.left,.right,.top,.bottom {
	position: absolute;
	top:0px;
	left:0px; 
	
	box-shadow: 0px 0px 50px 10px gray;
}

.front {

	transform: translateZ(100px);
	background: lightpink;
}

.back {

	transform: rotateY(180deg) translateZ(100px);
	background: lightgray;
}

.left {
	transform: rotateY(-90deg) translateZ(100px);
	background: lightsalmon;
	
}

.right {
	transform: rotateY(90deg) translateZ(100px);
	background: plum;
	
}

.top {
	transform: rotateX(90deg) translateZ(100px);	
}

.bottom {
	transform: rotateX(-90deg) translateZ(100px);	
}

@keyframes rotate {
	from {
		transform: rotateX(0deg) rotateY(360deg) rotateZ(0deg);
	}
	
	to {
		transform: rotateX(360deg) rotateY(0deg) rotateZ(360deg);	
	}
}

td {
	position: relative;
	 width: 30px;
	height: 30px; 
}

</style>
<script type="text/javascript">

count=0;
class Alpha {
	static color =[
		'#ff9bc1',
		'#fffe72',
		'#9af54c',
		'#b2f9ea',
		'#fc9738',
		'#b7adf0',
		]
	constructor() {
		this.line = parseInt(Math.random()*6);
		this.column = parseInt(Math.random()*6);
		this.bg = Alpha.color[parseInt(Math.random()*6)];
	}
	show(){
		let td = t_front.rows[this.line].cells[this.column];
		td.style.background=this.bg;
	  }
	}


function run() {
	console.log("show..");
	let count =0;
	let tid = setInterval(function() {
		if(count==36){
			clearInterval(tid);
			return;
		}
	 let a = new Alpha();
	 let td = t_front.rows[a.line].cells[a.column];
	if(td.style.background=='black'){
		count++; 			
	}
	td.style.background=a.bg;
	}, 100)
	
}

window.onload = function(){
	create.onclick = function(){
		run();
	}
}
</script>


</head>


<body class="white">
<h1 class="text_center t_purple">CSS 3D 응용 큐브 만들기</h1>
<button id="create">Create</button>
<section class="perspective">
	<article class="cube">
		<div class="base"></div>	
		<div class="base front">
		<table id="t_front">
				<tbody>
			<c:forEach var="i" begin="0" end="5">
			<tr>
				<c:forEach var="j" begin="0" end="5">
					<td style="background: black; color:red"></td>
				</c:forEach>
			</tr>		
			</c:forEach>
			</tbody>
		</table>
		</div>	
		<div class="base back">
			<table>
				<tbody>
				<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="5">
						<td style="background: black; color:red"></td>
					</c:forEach>
				</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<div class="base left">
			<table>
				<tbody>
				<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="5">
						<td style="background: black; color:red"></td>
					</c:forEach>
				</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<div class="base right">
			<table>
				<tbody>
				<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="5">
						<td style="background: black; color:red"></td>
					</c:forEach>
				</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<div class="base top">
			<table>
				<tbody>
				<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="5">
						<td style="background: black; color:red"></td>
					</c:forEach>
				</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<div class="base bottom">
			<table>
				<tbody>
				<c:forEach var="i" begin="0" end="5">
				<tr>
					<c:forEach var="j" begin="0" end="5">
						<td style="background: black; color:red"></td>
					</c:forEach>
				</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>	
	</article>
</section>
</body>
</html>