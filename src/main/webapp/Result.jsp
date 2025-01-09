<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
th {
padding: 0 10px;
}
td {
text-align: center;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

	String sql1 = "select tv.hospcode, th.hospname, count(tv.hospcode) "
				+ "from tbl_hosp_202109 th, tbl_vaccresv_202109 tv "
				+ "where th.hospcode = tv.hospcode "
				+ "group by tv.hospcode, th.hospname "
				+ "order by tv.hospcode";

	String sql2 = "select count(*) from tbl_vaccresv_202109";

	Statement stmt = conn.createStatement();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">병원별 접종건수 통계</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<table border="1" style="border-spacing: 0px;">
			<tr>
				<th>병원코드</th>
				<th>병원명</th>
				<th>접종건수</th>

			</tr>
			<%
			ResultSet rs = stmt.executeQuery(sql1);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
			}
			%>
			<%
			rs = stmt.executeQuery(sql2);

			while (rs.next()) {
			%>
			<tr>
				<td></td>
				<th>총 누계</th>
				<th><%=rs.getString(1)%></th>
			</tr>
			<%
			}
			rs.close();
			%>
		</table>
	</section>
</body>
</html>