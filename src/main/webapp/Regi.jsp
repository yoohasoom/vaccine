<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">백신접종예약</h2>
<br>
<section style="display: flex; justify-content: center;">
<form action="RegiConfirm.jsp" name="form">
	<table border="1" style="border-spacing: 0px;">
		<tr>
			<th>접종예약번호</th>
			<td>
			<input type="text" name="resvno">예) 20210001
			</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="jumin">예) 710101-1000001
			</td>
		</tr>
		
		<tr>
			<th>백신코드</th>
			<td>
			<input type="text" name="vcode">예) V001~V003		
			</td>
		</tr>
		<tr>
			<th>병원코드</th>
			<td>
			<input type="text" name="hospcode">예) H001
			</td>
		</tr>
		<tr>
			<th>예약일자</th>
			<td>
			<input type="text" name="resvdate">예) 20211231
			</td>
		</tr>
		<tr>
			<th>예약시간</th>
			<td>
			<input type="text" name="resvtime">예) 1230
			</td>
		</tr>
		<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="등록" onclick="fn_submit(); return false;">
			<button class="btn" type="reset" onclick="fn_reset();">다시하기</button>
			</td>
		</tr>
	</table>
</form>

</section>
<script>
function fn_submit(){
	var f = document.form;	
	
	if(f.resvno.value == ""){
		alert("접종예약번호가 입력되지 않았습니다!");
		f.resvno.focus(); return false;
	}
	if(f.jumin.value == ""){
		alert("주민번호가 입력되지 않았습니다!");
		f.jumin.focus(); return false;
	}
	if(f.vcode.value == ""){
		alert("백신코드가 입력되지 않았습니다!");
		f.vcode.focus(); return false;
	}
	if(f.hospcode.value == ""){
		alert("병원코드가 입력되지 않았습니다!");
		f.hospcode.focus(); return false;
	}
	if(f.resvdate.value == ""){
		alert("예약일자가 입력되지 않았습니다!");
		f.resvdate.focus(); return false;
	}
	if(f.resvtime.value == ""){
		alert("예약시간이 입력되지 않았습니다!");
		f.resvtime.focus(); return false;
	}
	f.submit();
}
function fn_reset(){
alert("정보를 지우고 처음부터 다시 입력합니다!");
}
</script> 
</body>
</html>