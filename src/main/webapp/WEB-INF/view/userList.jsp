<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User List</title>
</head>
<body>
    <h2>User List</h2>
    <table>
        <tr>
            <th>sn</th>
            <th>name</th>
            <th>username</th>
            <th>id</th>
            <th>password</th>
            <th>date</th>
            <th>gen</th>
            <th>tel</th>
            <th>email</th>
        </tr>
        <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.mbr_sn}</td>
            <td>${u.mbr_nm}</td>
            <td>${u.mbr_nick}</td>
            <td>${u.mbr_id}</td>
            <td>${u.password}</td>
            <td>${u.mbr_date}</td>
            <td>${u.mbr_gen}</td>
            <td>${u.mbr_tel}</td>
            <td>${u.mbr_email}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>