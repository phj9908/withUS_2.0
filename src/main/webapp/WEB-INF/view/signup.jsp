<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .id_ok{
            color: #57a9ef;
            display: none;
        }

        .id_already{
            color: #fb6ad2;
            display: none;
        }
    </style>

</head>

<body>
<table  style="padding-top:50px" align = center width=500 border=0 cellpadding=2>
    <tr>
        <td height=20 align= center bgcolor=#FCDDB0><font color=white></font></td>
    </tr>
    <tr>
        <td bgcolor=white>
            <form action="/signup" method="post">
                <table class = "table2" style="word-wrap:break-word; width:550px; align:center">
                    <tr>
                        <td>아이디</td>
                        <script type="text/javascript" src="/js/signup/id.js" defer></script>
                        <td>
                            <input type="text" id="mbr_id" name="mbr_id" placeholder="아이디" size=50 oninput="checkId()" required><br>
                            <!-- id ajax 중복체크 -->
                            <span class="id_ok">사용가능한 아이디입니다.</span>
                            <span class="id_already">이미 사용중인 아이디입니다.</span>
                            <span class="id_check">2~12자의 영문, 숫자만 사용 가능합니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" id="password" name="password" placeholder="비밀번호" size=50 oninput="checkPassword()" required></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <script type="text/javascript" src="/js/signup/password.js" defer></script>
                        <td>
                            <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" oninput="checkPassword()" size=50 required><br>
                            <span id="check"></span>
                            <%--                            <span class="password_no">비번 다르자나</span>--%>
                            <%--                            <span class="password_ok">비번 똑같다</span>--%>
                        </td>

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
                        <td>
                            남 <input type="radio" name="mbr_gen" value="남자"/>
                            여 <input type="radio" name="mbr_gen" value="여자"/>
                        </td>
                        <%--                        <td><input type="text" name="mbr_gen" placeholder="성별" size=50 required></td>--%>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <script type="text/javascript" src="/js/signup/tel.js" defer></script>
                        <td>
                            <span id="zero">010</span><span id="middle1">-</span><input type="text" id="fir_number" required><span id="middle2">-</span><input type="text" id="sec_number" required>
                            <input type="hidden" id="mbr_tel" name="mbr_tel" value="">
                            <%--                        <td><input type="text" name="mbr_tel" placeholder="전화번호" size=50 required></td>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>생일(선택)</td>
                        <script type="text/javascript" src="/js/signup/date.js" defer></script>
                        <td>
                            <input type="text" name="yy" id="yy" placeholder="년(4자)">
                            <select id="mm", name="mm">
                                <option value="">월</option>
                                <option value="01" >1</option>
                                <option value="02" >2</option>
                                <option value="03" >3</option>
                                <option value="04" >4</option>
                                <option value="05" >5</option>
                                <option value="06" >6</option>
                                <option value="07" >7</option>
                                <option value="08" >8</option>
                                <option value="09" >9</option>
                                <option value="10" >10</option>
                                <option value="11" >11</option>
                                <option value="12" >12</option>
                            </select>
                            <input type="text" name="dd" id="dd" placeholder="일">
                            <input type="hidden" id="mbr_date" name="mbr_date" value="">
                        </td>
                    </tr>
                    <tr>
                        <td>이메일(선택)</td>
                        <script type="text/javascript" src="/js/signup/email.js" defer></script>
                        <td>
                            <input type="text" id="user_email"><span id="middle">@</span><input type="text" id="email_address" list="user_email_address">
                            <datalist id="user_email_address">
                                <option value="naver.com"></option>
                                <option value="daum.com"></option>
                                <option value="gmail.com"></option>
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
<script>

</script>
</body>
</html>