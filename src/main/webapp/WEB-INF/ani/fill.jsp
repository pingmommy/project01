<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani.fill</title>
<style type="text/css">

table {
	border-collapse:collapse;
 	font-family: monospace;
 	font-size: 1.5em;
 	background: url("/media/favicon.png");
 	background-repeat: repeat-x;
}

#surface td {
 	position: relative;
 	transition : left 3s, transform 4s;
    transition-delay : 500ms;
 	
 	
 	top: 0px;
 	left:0px;
}


</style>

<script type="text/javascript">

window.onload = function() {
	
	surface.oncontextmenu = function(e) {
		e.preventDefault();
	}
}

function startBtn_click(e){
	console.log("start..");
		start.disabled = true;
		clear.disabled = true;
		
	let sid =  setInterval(function() {
		seconds.innerText = ++seconds.innerText;
	}, 1000)	
		
	let tid = setInterval(function() {
			
		forecount.innerText= ++forecount.innerText;	
		
		if(count.innerText == 800){
			clearInterval(tid);
			clearInterval(sid);
			start.disabled = false;
			clear.disabled = false;
			return;
		}
			
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/alpha/data')
		xhr.responseType='json';
		
		// 비동기방식으로 진행하는데, xhr이 제대로 동작하면 온로드가 수행된다. 
		xhr.onload = e =>{
			let alpha =  xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color =='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
					
					td.style.left = "700px";
					td.style.opacity="0.5";
					td.style.transform = `rotate(\${360*10}deg)`;
			}
			
			td.style.background = alpha.bg;
			td.style.color = alpha.fg;
			td.innerText = alpha.ch;									
			
		}
		xhr.send();
		}, 10);
}
function clearBtn_click(e){
	/* for(let i =0; i<surface.row.length; i++){
		for(let j=0; j<surface.row[i].cells.length;j++){
			surface.rows[i].cells[j].style.background='black';
			surface.rows[i].cells[j].style.color='black';
		}
	} */
	
	/* for(let row of surface.rows){
		for(let td of row.cells){
			td.style.color ='black';
			td.style.background ='black';
		}
	} */
	/*유사배열이어서 배열처럼 쓰려면 Array.from을 써야 한다.  */
	Array.from(surface.rows).forEach(function(row) {
		Array.from(row.cells).forEach(function(td) {
			td.style.color ='black';
			td.style.background ='black';
			td.style.left="0px";
			//td.style.opacity="1.0"
			
		});
	});
	count.innerText =0;
	seconds.innerText =0;
	forecount.innerText =0;
}
</script>

<!-- XMLHttpRequest - 웹브라우저에 기본적으로 있는 객체  -->
</head>
<body>
<h1>Spring MVC + XMLHttpRequest</h1>
<hr>
<button id="start" onclick="startBtn_click(event)">start</button>
<button id="clear" onclick="clearBtn_click(event)">clear</button>
<hr>
<table border="1" width="500">
<thead>
<tr>
 <th>forecount</th><th>count</th><th>second</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="forecount" align="right">0</td>
  <td id="count" align="right">0</td>
  <td id="seconds" align="right">0</td>
</tr>
</tbody>
</table>
<hr>
<table id="surface" onmousedown="event.preventDefault();">
 <tbody>
	<c:forEach var="row" items="${surface}">
	<tr>
		<c:forEach var="cells" items="${row}">
			<td style="background:${cells.bg}; color:${cells.fg}; opacity:1.0">${cells.ch}</td>
		</c:forEach>
	</tr>
	</c:forEach>
</tbody>
</table>


</body>
</html>