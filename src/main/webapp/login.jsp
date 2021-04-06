<%--
  Created by IntelliJ IDEA.
  User: BeglyarovAM
  Date: 06.04.2021
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method = "POST" action ="j_security_check">
    <table border = "0">
        <tr>
            <td>Login</td>
            <td><input type = "text" name="j_username"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type = "password" name="j_password"></td>
        </tr>
    </table>
    <input type = "submit" value = "Login!">

</form>
</body>
</html>
