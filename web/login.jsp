<%--
  Created by IntelliJ IDEA.
  User: Binean
  Date: 2018/11/10
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简易留言板</title>
</head>
<body bgcolor="#E3E3E3">
<form action="validate.jsp" method="post">
    <table>
        <caption>用户登录</caption>
        <tr>
            <td>用户名：</td>
            <td>
                <input type="text" name="username" size="20">
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <input type="password" name="password" size="21">
            </td>
        </tr>
    </table>
    <input type="submit" value="登录">
    <input type="reset" value="重置">
</form>
如果没有注册单击<a href="">这里</a>注册！
</body>
</html>
