<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="DTO" class="Ch15.MemberDTO" />
<jsp:setProperty name="DTO" property="*" />
<jsp:useBean id="DAO" class="Ch15.MemberDAO" />
<%
	DAO.ConnectDB();
	DAO.SetDTO(DTO);
	int result=DAO.UpdateMember();
	DAO.Disconnect();
	if(result!=0)
	{
%>
<script>
	alert("회원 정보가 변경되었습니다.\n메인으로 이동합니다");
	location.href="C01Main.jsp";
</script>
<%
	}
	else
	{
		%>
		<script>
			alert("변경 내용이 없습니다");
			location.href="C01Main.jsp";
		</script>
		<%		
	}

%>

</body>
</html> --%>