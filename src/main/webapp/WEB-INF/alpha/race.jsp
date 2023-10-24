<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<title>race.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">
#table1 {
	border-collapse: collapse;
	font-size: 2em;
	font-family: monospace;
	background-image: url("/media/fubao.jpg");
	background-size: 100%;
	background-repeat: no-repeat;
}

#startbtn {
	padding: 5px 10px 5px 10px;
}

td {
	text-align: center;
}

div {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	
}
div > table {
	float: left;
	margin: 10px;
}

#Th, #round, #count, #ellipse {
	font-size: 1.5em;
	
}

</style>

<script type="text/javascript">

$(function (){	 
	a=[];
	startbtn.onclick = e => {
				
		fetch('/alpha/data')
		.then(r => r.json())
		.then(alpha => {
			console.log(alpha)
				
		a.push(alpha);
		console.log(a);
			race(alpha);					
		}); }
	
	tb.onclick = list_click;
	
});

function race(alpha){
	
	console.log(alpha);
	//let cnt =0;
	let speed = Math.random()*1000+10;
	alpha.line =1;
	alpha.column =1;
	let direction = 0;  //0 :right 1: left 2: up 3: down 

	
	let td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;

	
	 let tr = document.createElement('tr');
	 let tdNo = document.createElement('td');
	 let tdAlpha = document.createElement('td');
	 let tdCount = document.createElement('td');
		 
	 tr.append(tdNo);
	 tr.append(tdAlpha);
	 tr.append(tdCount);
	
	 
	 stat.tBodies[0].append(tr);
	
	 tdNo.innerText = tr.parentElement.rows.length;
	 tdAlpha.innerText = alpha.ch;
	 tdAlpha.style.color = alpha.fg;
	 tdAlpha.style.background = alpha.bg;
	 tdCount.innerText = 0;
	 
	 
	tid=[];
	
	tt = setTimeout(function move() {
	tid.push(tt);
	/* console.log(tid); */
	let td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = 'black';
	td.style.background = 'black';

	switch(direction){
	case 0: //right
		alpha.column++;
		break;
	case 1: //left
		alpha.column--;
		break;
	case 2: // up
		alpha.line--;
		break;
	case 3: //down
		alpha.line++;
		break;
	}
	
	if(alpha.line == 1 && alpha.column == 1){
		direction =0; //right
		round.innerText = ++round.innerText;
		tdCount.innerText = ++tdCount.innerText;
	
		
	}
	else if(alpha.line == 20 && alpha.column == 40){
		direction =1;	//left	
	}
	else if(alpha.line == 20 && alpha.column == 1){
		direction =2; //up		
	}
	else if(alpha.line == 1 && alpha.column == 40){
		direction =3; //down		
	}

	td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
	
	tt=setTimeout(move, 100)
	}, 100);
	
	count.innerText = ++count.innerText;
	if(count.innerText==1){
		setInterval(function() {
			ellipse.innerText = ++ellipse.innerText;
		}, 1000)
	}
}

function list_click(e){
	let td = e.target;
	console.log(e.target.previousElementSibling.innerText);
	console.log(a[e.target.previousElementSibling.innerText-1]);
	td.remove();
	d= document.querySelector('#stat');
	for(let i=0; i<d.tBodies[0].rows.length;i++){
	    if(d.tBodies[0].rows[i].cells.length<3){
	       d.tBodies[0].rows[i].remove();
	       console.log(i);
	       a[i].bg='Black';
	       clearTimeout(tt);
	       console.log(a)}
	}
	console.log(this);
	console.log(a);

	console.log(e.target.innerText);
	
/* 	for(let i=0;i<a.length;i++){
		if(a[i].bg== 'Cyan'){
			a[i].bg='black';
		}
	}
	 */
	for(let i=0;i<a.length;i++){
		if(a[i].ch== 'Q'){
			a[i].bg='black';
		}
	}
	
	
	 
	 /* 참조 
	 for(let i = 0; i < arr.length; i++) {
  if(arr[i] === 'b')  {
    arr.splice(i, 1);
    i--;
  }
}
	 
	 */
}

</script>

</head>
<body style="background: white; ">
<h1 class="center">RAICING ALPHA</h1>

<button id="startbtn" class="button_2 green t-white">start</button>

<div style="text-align: center;">
<table class="center">
<thead id ="Th">
	<th>round</th><th>count</th><th>second</th>
</thead>
<tbody>
	<td id="round">0</td><td id="count">0</td><td id="ellipse">0</td>
</tbody>
</table>
<table id="table1" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}" />
			<td style="background:black; color:black; opacity:0.5">${alpha.ch}</td>			
		</c:forEach>
		</tr>
	</c:forEach>
</tbody>
</table>
<table width="200"  id="stat">
 <thead>
 <tr>
 	<th>no</th><th>Alpha</th><th>roundCount</th>
 </tr>
 </thead>
 <tbody id="tb">
 </tbody>
</table>
</div>
</body>
</html>