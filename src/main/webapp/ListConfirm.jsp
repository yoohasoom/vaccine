<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
text-align: center;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<%
request.setCharacterEncoding("UTF-8");
String resvno = request.getParameter("resvno");
boolean b = false;
%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select tv.resvno, tj.pname, tj.jumin, substr(tj.jumin, 8, 1), tj.tel, substr(tv.resvdate, 1, 4), substr(tv.resvdate, 5, 2), substr(tv.resvdate, 7, 2), substr(tv.resvtime, 1, 2), substr(tv.resvtime, 3, 2), th.hospname, th.hosptel, th.hospaddr, tv.vcode "
			+ "from tbl_jumin_201809 tj, tbl_hosp_202109 th, tbl_vaccresv_202109 tv "
			+ "where tj.jumin = tv.jumin and th.hospcode = tv.hospcode";

ResultSet rs = conn.prepareStatement(sql).executeQuery();

while (rs.next()) {
	if(resvno.equals(rs.getString(1))) {
		b = true;
		
%>
<br>
<h2 style="text-align: center;">예약번호 : <%= rs.getString(1) %>의 접종예약조회</h2>
<br>
    <section style="display: flex; justify-content: center;">
            <table border="1" style="border-spacing: 0px;">
                <tr>
                    <td>이름</td>
                    <td>주민번호</td>
                    <td>성별</td>
                    <td>전화번호</td>    
                    <td>예약일자</td>    
                    <td>예약시간</td>    
                    <td>병원명</td>    
                    <td>대표전화</td>    
                    <td>병원주소</td>    
                    <td>백신종류</td>    
                </tr>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4).equalsIgnoreCase("1") ? "남" : (rs.getString(4).equalsIgnoreCase("2") ? "여" : "")%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%>년<%=rs.getString(7)%>월<%=rs.getString(8)%>일</td>
                    <td><%=rs.getString(9)%>:<%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                    <td><%=rs.getString(12)%></td>
                    <td><%=rs.getString(13)%></td>
                    <td><%=rs.getString(14).equalsIgnoreCase("V001") ? "A백신" : rs.getString(14).equalsIgnoreCase("V002") ? "B백신" :(rs.getString(14).equalsIgnoreCase("V003") ? "C백신" : "")%></td>
                </tr>
                
            </table>
    </section>
    <br>
    <div style="display: flex; justify-content: center;">
            <input type="button" value="돌아가기" onclick="fn_home();" >
    </div>
                <%
                }
}
                %>
            <%
                if(b == false) {        
                %>
                <br>
                <h1 style="text-align: center;">접종예약정보가 존재하지 않습니다!</h1>
                <br>
               	<div style="display: flex; justify-content: center;">
                	<input type="button" value="돌아가기" onclick="fn_home();">
                </div>
                <%
                }
                %>
                <script type="text/javascript">
                function fn_home() {
                	location = "List.jsp";
                }
                </script>
</body>
</html>