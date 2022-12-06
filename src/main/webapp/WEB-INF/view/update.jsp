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
                                <td>이름</td>
                                <td><input type="text" name="mbr_nm" placeholder="이름" value="${user.mbr_nm}" size=50 required></td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                                <td><input type="text" name="mbr_nick" placeholder="닉네임" value="${user.mbr_nick}" size=50 required></td>
                            </tr>
                            <tr>
                                <td>성별</td>
                                <td><input type="text" name="mbr_gen" placeholder="성별" value="${user.mbr_gen}" size=50 required></td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td><input type="text" name="mbr_tel" placeholder="전화번호" value="${user.mbr_tel}" size=50 required></td>
                            </tr>
                            <tr>
                                <td>생일</td>
                                <td><input type="date" name = title value="${user.mbr_date}" size=50></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="text" name="mbr_tel" placeholder="이메일" value="${user.mbr_email}" size=50></td>
                            </tr>
                        </tr>
                        </table>
                        <button type="submit">저장하기</button>
                    </form>
                </td>
            </tr>
        </tr>
    </body>
</html>