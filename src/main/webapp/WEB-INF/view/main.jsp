<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <title>with US</title>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=35o7z9sq66&submodules=geocoder"></script>
        <link rel="stylesheet" type="text/css" href="../../docs/css/examples-base.css" />

        <link rel="stylesheet" type="text/css" href="../css/mainMap.css" />
        <link rel="stylesheet" type="text/css" href="/css/mainSidebar.css">
        <link rel="stylesheet" type="text/css" href="/css/mainSub.css">
        <link rel="stylesheet" type="text/css" href="/css/mainSearch.css">

        <script src="/js/mainSidebar.js" defer></script>
        <script src="/js/mainSub.js" defer></script>
        <script src="/js/mainSearch.js" defer></script>
        <script>
            $(document).ready(function(){
                // 글 작성하기 부분
                $("#test-button").click(function(){
                    //$("p").hide();asdf
                });
            });
        </script>
    </head>

    <body>
        <div id = "grid">
            <div class="section">
                <div id="map"></div>
                <code id="snippet" class="snippet"></code>
            </div>
            <script src="../js/mainMap.js"></script>

            <nav id ="leftSlideBar">
                <div class="menu-btn">
                    <div class="line line--1"></div>
                    <div class="line line--2"></div>
                    <div class="line line--3"></div>
                </div>

                <div class="nav-links">
                    <a href="/mypage" class="link">My page</a>
                    <a href="" class="link" id="btn-story">Story</a>
                    <a href="/date" class="link">Calendar / D-day</a>
                    <a href="" class="link">Message</a>
                    <a href="/post" class="link">Post Test</a>
                    <form action="/logout" method="post">
                        <button type="submit" class="link" all="unset">로그아웃</button>
                    </form>
                </div>
            </nav>

            <!-- 아코디언 -->
            <div class="area">
                <div class="accordion">
                    <div class="accordion_item">
                        <div class="search">
                            <input type="text" placeholder="검색어 입력">
                            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                        </div>
                        <div class="accordion_content">
                            <ul>
                                <li>그룹1</li>
                                <li>그룹2</li>
                                <li>그룹3</li>
                                <li>그룹4</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!--지도 정보-->
<%--            <nav id="sub">--%>
<%--                <div id = locationTitle></div>--%>
<%--                <ul>--%>
<%--                    <li id =category_name></li>--%>
<%--                    <li id =place_url></li>--%>
<%--                    <li id =phone></li>--%>
<%--                    <li id =distance></li>--%>
<%--                </ul>--%>
<%--                <button type="button" id="writeBtn">글 작성하기</button>--%>
<%--            </nav>--%>

            <!--스토리-->
            <nav class="test-story">
                <c:forEach items="${postlist}" var="p">
                    <ul class="story-ul">
                        <li>[제목]</li>
                        <li>${p.txt_nm}</li>
                        <li>[작성일]</li>
<%--                    <li>${}</li>--%>
                    </ul>
                </c:forEach>
            </nav>
        </div>
    </body>
</html>