<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("m_id");
	String name = request.getParameter("m_name");
	String mail = request.getParameter("m_mail");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MovieReview"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1111" />

<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT m_password FROM member WHERE m_id=? AND m_name=? AND m_mail=?
	<sql:param value="<%=id%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=mail%>" />
</sql:query>

<c:choose>
    <c:when test="${not empty resultSet.rows}">
        <c:set var="foundPw" value="${resultSet.rows[0].m_password}" />
        <%
            session.setAttribute("sessionFindPw", pageContext.getAttribute("foundPw"));
        %>
        <c:redirect url="resultMember.jsp?msg=4" />
    </c:when>
    <c:otherwise>
        <c:redirect url="findPw.jsp?error=1" />
    </c:otherwise>
</c:choose>