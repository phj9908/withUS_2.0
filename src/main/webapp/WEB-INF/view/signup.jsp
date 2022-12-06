<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" type="text/css" href="../css/write.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>

    <body>
        <table  style="padding-top:50px" align = center width=550 border=0 cellpadding=2>
        <tr>
            <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>
        </tr>
        <tr>
            <td bgcolor=white>
            <form action="/signup" method="post">
                <table class = "table2" align=center>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="mbr_id" placeholder="아이디" size=50 required></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="password" placeholder="비밀번호" size=50 required></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="mbr_nm" placeholder="이름" size=50 required></td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="mbr_nick" placeholder="닉네임" size=50 required></td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td><input type="text" name="mbr_gen" placeholder="성별" size=50 required></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="mbr_tel" placeholder="전화번호" size=50 required></td>
                    </tr>
                    <tr>
                        <td>생일(선택)</td>
                        <td><input type ="date" name = title size=50 required></td>
                    </tr>
                    <tr>
                        <td>이메일(선택)</td>
                        <script type="text/javascript" src="/js/email.js" defer></script>
                        <td>
                        <input type="text" id="user_email" required><span id="middle">@</span><input type="text" id="email_address" list="user_email_address">
                        <datalist id="user_email_address">
                            <option value="naver.com"></option>
                            <option value="daum.com"></option>
                            <option value="google.com"></option>
                            <option value="직접입력"></option>
                        </datalist>
                        <input type="hidden" id="mbr_email" name="mbr_email" value="">
<%--                        <td><input type="text" name="mbr_email" placeholder="이메일" size=50></td>--%>
                        </td>
                    </tr>
                </table>

                <center>
                    <button type="submit">가입하기</button>
                    <button type="button" onclick="delOk()">취소</button>
                </center>
            </form>
            </td>
        </tr>
        </table>

        <script>
            function delOk(){
                var result = confirm("이전 페이지로 돌아가시겠습니까?");

                if(result) {
                    return history.go(-1);
                } else {
                    return false
                }
            }
        </script>
    </body>
</html>