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
	
	show(line,column,bg,fg,ch) {				
		let td = surface.rows[line-1].cells[column-1];
		td.style.background= bg;
		td.style.color= fg;
		td.innerText =ch;
		
	}

	hide(line,column) {				
		let td = surface.rows[line-1].cells[column-1];
		td.style.background= 'black';
		td.style.color= 'black';			
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
		
		this.arr = [this.a,this.b,this.c,this.d];
		this.trail=[];
		

		 this.direction = 1;  
		

		console.log(this.a);
		/* console.log(this.arr); */
	/* 	console.log(this.direction); */
	}
	
	init(){
		 for(let i=0; i<this.arr.length;i++){
			 this.arr[i].show(this.arr[i].line,this.arr[i].column,this.arr[i].bg,this.arr[i].fg,this.arr[i].ch);
			 this.trail.push({
					x:this.arr[i].line,
					y:this.arr[i].column
				})
		 }
		
	}
	
	check_trail(){
		if(this.a.column>40)
			this.a.column=1;
		else if(this.a.column==0)
			this.a.column=40;
		else if(this.a.line>20)
			this.a.line=1;
		else if(this.a.line==0)
			this.a.line=20;
	}
 
	 step =0;
	 moveHead() {
		
		/* this.a.hide(this.a.line,this.a.column); */
		
		 switch(this.direction){
		 case 0:
			 this.a.line--;
			 this.check_trail();
			 this.trail.unshift({
					x:this.a.line,
					y:this.a.column
				})
				this.step++;
			 break;
		 case 1:
			 this.a.column--;
			 this.check_trail();
			 this.trail.unshift({
					x:this.a.line,
					y:this.a.column
				})
				this.step++;
			 break;
		 case 2:
			 this.a.line++;
			 this.check_trail();
			 this.trail.unshift({
					x:this.a.line,
					y:this.a.column
				})
				this.step++;
			 break;	
		
		 }
		
		
		
		
		if(this.trail.length > this.arr.length){
			this.trail= this.trail.slice(0,this.arr.length);
		}
		
		
		if(this.step == 3){
			 this.direction = parseInt(Math.random()*3);   
			this.step=0;
		}
		
		/* console.log(this.trail);
		console.log("arr.length : "+this.arr.length); */
		
	 }
	 
	 
	movechild() {
		
		 for(let i=0; i<this.arr.length; i++){
			 this.arr[i].hide(this.arr[i].line,this.arr[i].column);
			 }
	
		
		
		 for(let i=0; i<this.arr.length; i++){
			 this.arr[i].line  = this.trail[i].x;
			 this.arr[i].column = this.trail[i].y;
			 this.arr[i].show(this.arr[i].line,this.arr[i].column,this.arr[i].bg,this.arr[i].fg,this.arr[i].ch);
			 
			 }
		 
	 }
	 
	 async run(){	
		
		 this.init();
		 
		/*  console.log(this.trail); */
		 
		 for(let i=0;i<100;i++){		 
			 await sleep(300);
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
	<c:forEach var="i" begin="0" end="19">
	  <tr>
	 <c:forEach var ="j" begin="0" end="39">
		<td style="background:black;">A</td>	
	</c:forEach>
	</tr> 
    </c:forEach>
	</tbody>
</table>
</body>
</html>