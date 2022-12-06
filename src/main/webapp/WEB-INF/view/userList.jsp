<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
    </head>

    <style>
        table.table2{
            border-collapse: separate;
            border-spacing: 1px;
            text-align: left;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            margin : 20px 10px;
        }
        table.table2 tr {
            width: 50px;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        table.table2 td {
            width: 100px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
    </style>

    <body>
        <table  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>
            <tr>
                <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>
            </tr>
            <tr>
                <td bgcolor=white>
                    <table class = "table2" align=center>
                        <c:forEach items="${list}" var="u">
                            <tr>
                                <td>이름</td>
                                <td>${u.mbr_nm}</td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                                <td>${u.mbr_nick}</td>
                            </tr>
                            <tr>
                                <td>성별</td>
                                <td>${u.mbr_gen}</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>${u.mbr_tel}</td>
                            </tr>
                            <tr>
                                <td>생일</td>
                                <td>${u.mbr_date}</td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td>${u.mbr_email}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <center>
                        <button type="submit">정보 수정</button>
                        <button type="button" onclick="delOk()">회원 탈퇴</button>
                    </center>
                </td>
            </tr>
        </table>
    </body>
</html>