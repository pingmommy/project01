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
	
	show() {				
		let td = surface.rows[this.line-1].cells[this.column-1];
		td.style.background= this.bg;
		td.style.color= this.fg;
		td.innerText =this.ch;
		
	}

	hide() {				
		let td = surface.rows[this.line-1].cells[this.column-1];
		td.style.background= 'black';
		td.style.color= 'black';			
	}
	
	run(){
		this.hide();
		this.column--;
		if(this.column>40)
			this.column=1;
		else if(this.column==0)
			this.column=40;
		this.show();
	}
	
	
	run2(){
		this.hide();
		this.line++;
		if(this.line>20)
			this.line=1;
		else if(this.line==0)
			this.line=20;
		this.show();
	}
}



	
	window.onload = function() {
		 Btn.onclick= async function () {
			let a = new Alpha();
			
			a.show();
			for(;;){
			await sleep(300);
			a.run2();
			}
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