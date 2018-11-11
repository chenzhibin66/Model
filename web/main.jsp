<%@ page import="cn.binean.test.UserTable" %><%--
  Created by IntelliJ IDEA.
  User: Binean
  Date: 2018/11/10
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板信息</title>
</head>
<body>
<%
    UserTable user = (UserTable) session.getAttribute("user");
    String usr = user.getUsername();
%>
<%=usr %>你好，欢迎登陆留言板。
</body>
</html>
