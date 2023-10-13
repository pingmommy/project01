<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>earthworm.jsp</title>
<style type="text/css">
table {
 border-collapse: collapse;
 font-size: 2em;
 font-family: monospace;
}

</style>

<script type="text/javascript">

function sleep(millis){
	return new Promise(function(resolve,reject){
		setTimeout(resolve, millis)
	});	
}

window.onload = () => {
	no1.onclick = () => {
		let w = new EarthWorm();
		w.run();
	}
		
}

class EarthWorm {
		
	async run(){
		let response = await fetch('/alpha/data');
		this.alpha1 = await response.json();
		console.log(this.alpha1);
		
		let response2 = await fetch('/alpha/data');
		this.alpha2 = await response2.json();
		console.log(this.alpha2);
		
		let response3 = await fetch('/alpha/data');
		this.alpha3 = await response3.json();
		console.log(this.alpha3);
		
		let response4 = await fetch('/alpha/data');
		this.alpha4 = await response4.json();
		console.log(this.alpha4);
		
		this.show();
		
		for(let i=0; i<3; i++){
			
		await sleep(1000);
		this.move();
		}
		
	}
	
	show() {
		let table = document.querySelector("table");
		let td = table.rows[this.alpha1.line-1].cells[this.alpha1.column-5];
		td.style.background= this.alpha1.bg;
		td.style.color=this.alpha1.fg;
		td.innerText ="J";
		
		let td2 = td.nextElementSibling;
		td2.style.background=this.alpha2.bg;
		td2.style.color=this.alpha2.fg;
		td2.innerText="A";
		
		let td3 = td2.nextElementSibling;
		td3.style.background=this.alpha3.bg;
		td3.style.color=this.alpha3.fg;
		td3.innerText="V";
		
		let td4 = td3.nextElementSibling;
		td4.style.background=this.alpha4.bg;
		td4.style.color=this.alpha4.fg;
		td4.innerText="A";
	}
	
	hide() {
		let table = document.querySelector("table");
		let td = table.rows[this.alpha1.line-1].cells[this.alpha1.column-5];
		td.style.background= 'black';
		td.style.color='black';
		
		let td2 = td.nextElementSibling;
		td2.style.background='black';
		td2.style.color='black';
		
		let td3 = td2.nextElementSibling;
		td3.style.background='black';
		td3.style.color='black';
		
		let td4 = td3.nextElementSibling;
		td4.style.background='black';
		td4.style.color='black';
	}
	
	move() {
		this.hide();
		this.alpha1.column--;
		this.alpha2.column--;
		this.alpha3.column--;
		this.alpha4.column--;
		this.show();
	}
}


</script>
	
<!-- /* async function run(){
	
	let response = await fetch('/alpha/data');
	let alpha = await response.json();
	console.log(alpha);
	
	let response2 = await fetch('/alpha/data');
	let alpha2 = await response2.json();
	console.log(alpha2);
	
	let response3 = await fetch('/alpha/data');
	let alpha3 = await response3.json();
	console.log(alpha3);
	
	let response4 = await fetch('/alpha/data');
	let alpha4 = await response4.json();
	console.log(alpha4);
	
	show();
	
	move();
	

function show() {
	let table = document.querySelector("table");
	let td = table.rows[alpha.line-1].cells[alpha.column-5];
	td.style.background= alpha.bg;
	td.style.color=alpha.fg;
	td.innerText ="J";
	
	let td2 = td.nextElementSibling;
	td2.style.background=alpha2.bg;
	td2.style.color=alpha2.fg;
	td2.innerText="A";
	
	let td3 = td2.nextElementSibling;
	td3.style.background=alpha3.bg;
	td3.style.color=alpha3.fg;
	td3.innerText="V";
	
	let td4 = td3.nextElementSibling;
	td4.style.background=alpha4.bg;
	td4.style.color=alpha4.fg;
	td4.innerText="A";
	
}

function move(){
	for(let i=0; i<5;i++){
		alpha.line--;
		alpha2.line--;
		alpha3.line--;
		alpha4.line--;
		
	}
	
} }

no1.onclick= () => {
	run();
} */

/* window.onload = ()=> {
	
	no1.onclick= e => { run(); }
	
	async function run() {
		let response = await fetch('/alpha/data');
		let alpha = await response.json();
		console.log(alpha);
		
		let response2 = await fetch('/alpha/data');
		let alpha2 = await response2.json();
		console.log(alpha2);
		
		let response3 = await fetch('/alpha/data');
		let alpha3 = await response3.json();
		console.log(alpha3);
		
		let response4 = await fetch('/alpha/data');
		let alpha4 = await response4.json();
		console.log(alpha4);
		
		show(alpha);
		//show(alpha2);
	}
	
	function show(alpha) {
		let table = document.querySelector("table");
		let td = table.rows[alpha.line-1].cells[alpha.column-5];
		td.style.background= alpha.bg;
		td.style.color=alpha.fg;
		td.innerText ="J";
		
	}
	
	
}
 */ -->

</head>
<body>
<button id="no1">JAVA</button>
<table id="surface">
	<tbody>
		<c:forEach var="i" begin="0" end="${surface.size()-1}" >
		<tr>
			<c:forEach var="j" begin="0" end="${surface[i].size()-1}">
			<c:set var="alpha" value="${surface[i][j]}"/>
				<td style="background: black;">${alpha.ch}</td>
			</c:forEach>
		</tr> 				
		</c:forEach>
	</tbody>
</table>
</body>
</html>