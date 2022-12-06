<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
</head>

<body>
<tr  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>
<tr>
    <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>
</tr>
<tr>
    <td bgcolor=white>
        <form action="/update" method="post">
            <table>
                <tr class = "table2" align=center>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="mbr_id" placeholder="아이디" value="${user.mbr_id}" size=50 readonly></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" name="mbr_nick" placeholder="닉네임" value="${user.mbr_nick}" size=50 required></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="password" placeholder="비밀번호" size=50 required></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="mbr_tel" placeholder="전화번호" value="${user.mbr_tel}" size=50 required></td>
            </table>
            <button type="submit">저장하기</button>
        </form>
    </td>
</tr>
</tr>
</body>
</html>