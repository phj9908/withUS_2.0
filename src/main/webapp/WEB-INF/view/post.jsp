<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>with US</title>
        <link rel="stylesheet" type="text/css" href="../css/write.css">
    </head>

    <body>
        <form method = "post" action = "/post">
            <table  style="padding-top:50px" align = center width=700 border=0 cellpadding=2 >
                <tr>
                    <td height=20 align= center bgcolor=#FF9F9F><font color=white></font></td>
                </tr>
                <tr>
                    <td bgcolor=white>
                        <table class = "table2">
                            <tr>
                                <td>제목</td>
                                <td><input type = "text" name ="txt_nm" size=50 required></td>
                            </tr>
                            <tr>
                                <td>날짜</td>
                                <script type="text/javascript" src="/js/txtdate.js" defer></script>
                                <td>
                                    <input type="text" name="yy" id="yy" placeholder="년(4자)" oninput="handleInputLength(this, 4)">
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
                                    <input type="text" name="dd" id="dd" placeholder="일" oninput="handleInputLength(this, 2)">
                                    <input type="hidden" id="txt_date" name="txt_date" value="">
                                </td>
                            </tr>
                            <tr>
                                <td>사진</td>
                                <td><input type="file" class="real-upload" accept="image/*"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea type="text" name ="txt_cn" cols=85 rows=15 required></textarea></td>
                            </tr>
                        </table>

                        <center>
                            <input type="hidden" name = "mbr_sn" value ="${user.mbr_sn}" required>
                            <button type="button" onclick="delOk()">이전으로</button>
                            <button type="submit">작성하기</button>
                        </center>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

<html>
    <body>
        <input type="file" class="real-upload" accept="image/*" required multiple style="display: none;">
        <div class="upload"></div>
        <script>
            const realUpload = document.querySelector('.real-upload');
            const upload = document.querySelector('.upload');

            upload.addEventListener('click', () => realUpload.click());
        </script>

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