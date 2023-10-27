<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 200px;
}

</style>

<script type="text/javascript">

	

function run(){
	let td = document.querySelector('table');
	
	let c = 0;
	
	for(let i=0; i<10;i++){
	
	td.rows[1].cells[i].style.background= 'red';
	}
}

</script>
</head>
<body>
<button onclick="run();">PUSH</button>
<table>
<c:forEach var="i" begin="0" end="5">
	<tr>
	<c:forEach var ="j" begin="0" end="5">
		<td style="background:black;">A</td>	
	</c:forEach>
	</tr> 
</c:forEach>
</table>


</body>
</html>