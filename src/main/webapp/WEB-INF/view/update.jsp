<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Information</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form action="/update" method="post">
        <p>
            이름<br>
            <input type="text" name="mbr_nm" value="${user.mbr_nm}"/>
        </p>
        <p>
            닉네임<br>
            <input type="text" name="mbr_nick" value="${user.mbr_nick}"/>
        </p>
        <p>
            비밀번호<br>
            <input type="text" name="password" value="${user.password}"/>
        </p>
        <p>
            주소<br>
            <input type="text" name="mbr_date" value="${user.mbr_date}"/>
        </p>
        <p>
            번호<br>
            <input type="text" name="mbr_tel" value="${user.mbr_tel}"/>
        </p>
        <p>
            이메일<br>
            <input type="text" name="mbr_email" value="${user.mbr_email}"/>
        </p>

        <button type="submit">저장하기</button>
    </form>
</body>
</html>