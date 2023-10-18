<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>earthworm.jsp</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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

        /* this.ch = String.fromCharCode(Math.random() * 26 + 'A'.charCodeAt(0)); */
         this.ch = "@";
    }
	
}


class Fill {

	
	constructor() {
		this.a = new Alpha();
		this.b = new Alpha();
		this.b.column = (this.a.column+1);
		this.c = new Alpha();
		this.c.column = (this.a.column+2);		
		/* this.d = new Alpha(); */
		
		this.arr = [this.a, this.b,this.c];
		this.c=[];
		this.l=[];
		this.direction = 4;

		console.log(this.arr);
	}
	
	show(line,column,bg,fg) {				
			let td = surface.rows[line-1].cells[column-1];
			td.style.background= bg;
			td.style.color= fg;
			td.innerText = this.arr[0].ch;				
		}
	
	hide(line,column) {				
		let td = surface.rows[line-1].cells[column-1];
		td.style.background= 'black';
		td.style.color= 'black';			
	}
	 
	
	 moveHead() {
		
		 this.hide(this.arr[0].line,this.arr[0].column);
		
		this.arr[0].line++;	
		
		this.show(this.arr[0].line,this.arr[0].column,this.arr[0].bg,this.arr[0].fg);
		
		 
		this.c.push(this.arr[0].column);
	/* 	 console.log("c"+":"+this.c);  */
		this.l.push(this.arr[0].line);
		 /* console.log("L"+":"+this.l); */ 
	}
	 
	 movechild() {
		 let pc=null;
		 let pl=null;
		 for(let e of this.c){
			 pc=e;
		 }	 
		 for(let d of this.l){
			 pl=d;
		 }
		 
		 for(let i=1; i<this.arr.length; i++){
		 this.hide(this.arr[i].line,this.arr[i].column);
		 this.arr[i].line=pl;
		 this.arr[i].column=pc;
		 this.show(this.arr[i].line+i,this.arr[i].column,this.arr[i].bg,this.arr[i].fg);
		 }
	 }
	 
	 async run(){
	
		this.show(this.arr[0].line,this.arr[0].column,this.arr[0].bg,this.arr[0].fg); 
		this.show(this.arr[1].line,this.arr[1].column,this.arr[1].bg,this.arr[1].fg); 
		this.show(this.arr[2].line,this.arr[2].column,this.arr[2].bg,this.arr[2].fg); 
		
		
		 for(let i=0;i<5;i++){
		 
		 await sleep(1000);
		 this.moveHead();
		 this.movechild(); 		 
		 } 
	 }
	
}
	
	window.onload = function() {
		 Btn.onclick= function () {
			let a = new Fill();												
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