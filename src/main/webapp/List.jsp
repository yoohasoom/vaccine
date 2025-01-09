<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접종예약조회</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">접종예약조회</h2>
<br>
<section style="display: flex; justify-content: center;">
<form action="ListConfirm.jsp" name="form">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>예약번호를 입력 하시오.</th>
			<td>
			<input type="text" name="resvno" id="resvno">
			</td>
		</tr>
		<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="예약조회" onclick="fn_submit(); return false;">
			<input type="button" value="홈으로" onclick="fn_home();">
			</td>
		</tr>
	</table>
</form>
</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	var resvno = f.resvno.value;
	if(resvno == ""){
		alert("예약번호가 입력되지 않았습니다");
		f.resvno.focus(); return false;
	}
	f.submit();
}
function fn_home() {
	location = "Index.jsp";
}
</script> 
</body>
</html>