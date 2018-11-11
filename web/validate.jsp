<%@ page import="cn.binean.test.UserTable" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Binean
  Date: 2018/11/10
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<jsp:useBean id="SqlSrvDB" scope="page" class="cn.binean.test.SqlSrvDBConm"></jsp:useBean>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="GB2312">
</head>
<body>
<%
    request.setCharacterEncoding("gb2312");
    String usr = request.getParameter("username");
    String pwd = request.getParameter("password");
    boolean validated = false;
    UserTable user = null;
    user = (UserTable) session.getAttribute("user");
    if (user == null) {
        String sql = "select * from userTable";
        ResultSet rs = SqlSrvDB.executeQuery(sql);
        while (rs.next()) {
            try{
                if ((rs.getString("username").trim().compareTo(usr) == 0)
                        && (rs.getString("password").compareTo(pwd) == 0)) {
                    user = new UserTable();
                    user.setId(rs.getInt(1));
                    user.setUsername(rs.getString(2));
                    user.setPassword(rs.getString(3));
                    session.setAttribute("user", user);
                    validated = true;
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        rs.close();
        SqlSrvDB.closeStmt();
        SqlSrvDB.closeConn();
    } else {
        validated = true;
    }
    if (validated) {

%>
<jsp:forward page="main.jsp"></jsp:forward>
<%
} else {
    //验证失败跳转到error.jsp
%>
<jsp:forward page="error.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
