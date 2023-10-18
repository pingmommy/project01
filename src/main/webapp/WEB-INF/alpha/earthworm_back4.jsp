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

class Alpha {
	 static colors = [
	        'Black',
	        'Red',
	        'Green',
	        'Yellow',
	        'Blue',
	        'Magenta',
	        'Cyan',
	        'White',
	    ];
	constructor() {
        this.line = 10;
        this.column = 20;
        do {
            this.fg = Alpha.colors[parseInt(Math.random() * 8)];
            this.bg = Alpha.colors[parseInt(Math.random() * 8)];
        } while (this.fg == this.bg);

        this.ch = String.fromCharCode(Math.random() * 26 + 'A'.charCodeAt(0));
    }
}

class Fill {
	 
	
	constructor() {
		this.a = new Alpha();
		this.b = new Alpha();
		this.b.column = (this.a.column+1);
		this.c = new Alpha();
		this.c.column = (this.a.column+2);
		this.d = new Alpha();
		this.d.column = (this.a.column+3);
		
		this.arr = [this.a, this.b,this.c,this.d];
		
		this.direction = 4;
		
		this.show();	
	}
	
	
	show() {
		
		for(let i=0; i<this.arr.length; i++){
			let td = surface.rows[this.arr[i].line-1].cells[this.arr[i].column-1];
			td.style.background= this.arr[i].bg;
			td.style.color=this.arr[i].fg;
			td.innerText = this.arr[i].ch;	
		}
	}
	
	
	moveHead() {
		this.hide();
		 switch(this.direction){
		 case 1:
			 this.arr[0].line--;
			 break;
		 case 2:
			 this.arr[0].column++;
			 break;
		 case 3:
			 this.arr[0].line++;
			 break;	
		 case 4:
			 this.arr[0].column--;
			 break;	 
		 }
		
		 let td1 = surface.rows[this.arr[0].line-1].cells[this.arr[0].column-1];
			td1.style.background= this.arr[0].bg;
			td1.style.color=this.arr[0].fg;
			td1.innerText = this.arr[0].ch;	;
	}
	
	 draw(line,column,bg,fg) {
	  
		 let td = surface.rows[line].cells[column]; 
		 td.style.background= bg;
			td.style.color= fg;
	 }
	 
	 hide(line,column,bg,fg) {
		  
			 let td = surface.rows[line].cells[column]; 
			 td.style.background= 'black';
			td.style.color= 'black';
		 }
	
	 
	async run() {
		
		
			await sleep(1000);
		   
			console.log(this.arr[0])		
		
	} 
}

window.onload = function() {
	Btn.onclick= function () {
		let a = new Fill();
		console.log(a);							
		
			
		a.run();
				
		
	}
	
}


</script>
</head>
<body>
<button id="Btn">JAVA</button>
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