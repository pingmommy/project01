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
		
		this.arr = [this.b,this.c];
		this.c=null;
		this.l=null;
		this.direction =1;
		/* this.direction = parseInt(Math.random()*3); */

		console.log(this.arr);
	}
	
	step =0;
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
	 
	 isChange = false;
	 moveHead() {
		
		this.hide(this.arr[0].line,this.arr[0].column);
		
		 switch(this.direction){
		 case 0:
			 this.a.line--;
			 break;
		 case 1:
			 this.a.column--;
			 break;
		 case 2:
			 this.a.line++;
			 break;	
		
		 }
		
		this.show(this.arr[0].line,this.arr[0].column,this.arr[0].bg,this.arr[0].fg);
		
		this.step++;
		console.log("step"+this.step);
		
		if(this.step==3){
			this.direction = 2;
			this.step=0;
			this.isChange=true;
		}
		
		if(this.isChange){
			this.l = this.arr[0].line;
			this.c = this.arr[0].column;
			console.log("this.L :"+this.l+"this.C :"+this.c);
			this.isChange= !this.isChange;
			console.log("change: "+this.isChange)
		}
		
		console.log("parent : "+this.l+","+ this.c)
	 }
	 
	 cStep = [0,0,0];
	 cDirection = 1;
	 
	 movechild() {		 		 
		 for(let i=0; i<this.arr.length; i++){	
			 
	   		 this.hide(this.arr[i].line,this.arr[i].column); 
			 
			 switch(this.cDirection){
			 case 0:
				 this.arr[i].line--;
				 
				 break;
			 case 1:
				 this.arr[i].column--;
				 break;
			 case 2:
				 this.arr[i].line++;
				 break;	
			
			 }
			 this.show(this.arr[i].line,this.arr[i].column,this.arr[i].bg,this.arr[i].fg);
		 }
	 }
	 
	 async run(){
	
		this.show(this.arr[0].line,this.arr[0].column,this.arr[0].bg,this.arr[0].fg); 
		this.show(this.arr[1].line,this.arr[1].column,this.arr[1].bg,this.arr[1].fg); 
		this.show(this.arr[2].line,this.arr[2].column,this.arr[2].bg,this.arr[2].fg); 
		
		
		 for(let i=0;i<3;i++){
		 
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