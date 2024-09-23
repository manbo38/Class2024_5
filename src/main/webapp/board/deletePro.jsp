<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/>

<%
	String nowpage = request.getParameter("page");

	BoardDBBean dao = BoardDBBean.getInstance();
	
	// db에서 비번 구해오기
	BoardDataBean db = dao.getContent(board.getNum());
	
	if(db.getPasswd().equals(board.getPasswd())){	// 비번 일치시
		int result = dao.delete(board.getNum());	// delete SQL문 실행
		
		if(result == 1){
			
	%>
		<script>
			alert("글삭제 성공");
			location.href="list.jsp?page=<%=nowpage%>"
		</script>
	
<%	}
		
	}else{  // 비번 불일치시 %>
		<script>
			alert("글삭제 실패");
			history.go(-1);
		</script>
<% } %>