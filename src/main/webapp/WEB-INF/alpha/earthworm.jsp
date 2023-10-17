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
	
	hide() {
		for(let i=0; i<this.arr.length; i++){
			let td = surface.rows[this.arr[i].line-1].cells[this.arr[i].column-1];
			td.style.background= 'black';
			td.style.color='black';	
			console.log("hide");
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
		
		this.pLine=[];	
		this.pColumn=[];
		
		this.pLine.push(this.arr[0].line);
		this.pColumn.push(this.arr[0].column);
		
		console.log(this.pLine);
		console.log(this.pColumn); 
		
		
	/* 	for(let i =1; i<this.arr.length; i++){
		this.arr[i].line= this.pLine[0];
		this.arr[i].column= this.pColumn[0];}
   
    for(let i =1; i<this.arr.length; i++){
    	this.hide();
		let td2 = surface.rows[this.arr[i].line-1].cells[this.arr[i].column-1];
		td2.style.background= this.arr[i].bg;
		td2.style.color=this.arr[i].fg;
		td2.innerText = this.arr[i].ch;	 */
	  
	
		
	}
	
	/* moveChild() {
		 /*  this.hide(); 
		  
		  
		  
		for(let i =1; i<this.arr.length; i++){
			let td = surface.rows[this.arr[i].line-1].cells[this.arr[i].column-1];
			td.style.background= this.arr[i].bg;
			td.style.color=this.arr[i].fg;
			td.innerText = this.arr[i].ch;	
		}
		
	}
	 */
	 
	 
	 /* moveChild() {
		 /* this.hide(); 
		 
		 for(let i =1; i<this.arr.length; i++){
			/*  this.hide(); 
			let td = surface.rows[this.arr[i].line-1].cells[this.arr[i].column-1];
			/*  switch(this.direction){
			 case 1:
				 this.arr[i].line--;
				 break;
			 case 2:
				 this.arr[i].column++;
				 break;
			 case 3:
				 this.arr[i].line++;
				 break;	
			 case 4:
				 this.arr[i].column--;
				 break;	 
			 }	  
			    
				td.style.background= this.arr[i].bg;
				td.style.color=this.arr[i].fg;
				td.innerText = this.arr[i].ch;	
			}
		 
	 } */
	 
	 draw(line,column,bg,fg) {
	  
		 let td = surface.rows[line].cells[column]; 
		 td.style.background= bg;
			td.style.color= fg;
	 }
	 
	 hide2(line,column,bg,fg) {
		  
			 let td = surface.rows[line].cells[column]; 
			 td.style.background= 'black';
			td.style.color= 'black';
		 }
	 
	 
	async run() {
		
		for(let i=0; i<5; i++){
			await sleep(1000);
		   
			this.moveHead();
			for(let i =1; i<this.arr.length; i++){
				this.hide2(this.arr[i].line,this.arr[i].column,this.arr[i].bg,this.arr[i].fg);
			}
		    
			for(let i =1; i<this.arr.length; i++){
				
				switch(this.direction){
				 case 1:
					 this.arr[i].line--;
					 break;
				 case 2:
					 this.arr[i].column++;
					 break;
				 case 3:
					 this.arr[i].line++;
					 break;	
				 case 4:
					 this.arr[i].line= this.pLine[0];
					 this.arr[i].column= ++this.pColumn[0];
					 this.arr[i].column--;
					 break;	 
				 }	 
				
				
			
			this.draw(this.arr[i].line,this.arr[i].column,this.arr[i].bg,this.arr[i].fg);
				}
		
		   
		}
	
		
	} 
}

window.onload = function() {
	Btn.onclick= function () {
		let a = new Fill();
		console.log(a);							
		
		
			
		a.run();
		
		
		/* setTimeout(()=> a.hide(), 2000); */
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