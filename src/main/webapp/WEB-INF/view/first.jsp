<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>withUS</title>
    </head>

    <style>
        #start_btn{
            /*기존 스타일 제거*/
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;

            /*새로운 스타일*/
            background: #E97777;
            width: 300px;
            height: 80px;
            border: 0px;
            color: #FFFFFF;
            font-weight: bold;
            font-size: 16px;
            border-radius: 8px;
        }
        #logo {
            font-size: 80px;
            margin: 0px;
        }
        #introduction {
            margin-bottom: 50px;
            font-size: 22px;
        }
        #style1 {
            margin-top: 400px;
            text-align: center;
        }
    </style>

    <body>
        <div id="style1">
            <h1 id="logo">withUS</h1>
            <h2 id="introduction">당신의 추억 어쩌고 당신의 여행 어쩌고 위드어스 소개</h2>
            <button id="start_btn" onclick="location.href='login'" >시작하기</button>
        </div>
    </body>
</html>