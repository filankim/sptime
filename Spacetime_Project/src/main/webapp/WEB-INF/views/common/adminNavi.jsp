<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
<style>

    body { font-family: 'NanumSquare', sans-serif;}
    
    /* 메뉴바 전체 */
    .adminMenu {
        /* background-color: white; */
        background-color: rgba(128, 128, 128, 0.1);
        height: 100vh; 
        width: 250px;   
        box-sizing: border-box;
        margin-left: 3%;
        /* margin-top: 100px; */
        /* padding: 50px 0px; */
        /* border-radius: 10px; */
        /* min-height: 1000px; */
        padding-top: 70px;
        float: left;
        position: fixed;
    }

    /* 관리자페이지 제목 */
    #adminPage {
        /* border: 1px solid pink; */
        border-bottom: 3px solid #FFCB42;
        margin: auto;
        margin-bottom: 50px;
        padding-bottom: 5px;
        text-align: center;
        width: 80%;
        font-weight: 600;
        font-size: xx-large;
    }

    /* 메뉴 */
    .accordion>li {
        /* border: 1px solid red; */
        cursor:pointer;
        padding-top:5px;
        padding-bottom:5px;
        margin-bottom: 15px;
        position:relative;
        list-style:none;
    }
    .naviMenu { font-size: larger;}
    a.navi {
        text-decoration: none;
        color: black;
    }
    .navi:hover {
        color: #277BC0;
        text-decoration: none;
    }
    
    
    /* 매출 하위 리스트 */
    .naviSub {
        list-style: none;
        margin-top: 15px
    }

</style>
</head>
<body>
    <div class="wrap">
        <div class="adminMenu">
            <div id="adminPage">관리자페이지</div>
            <ul class="accordion">
                <li>
                    <span class="naviMenu navi" onclick="openSalesInfo();">매출 관리</span>
                    <ul class="salesInfo_ul" style="display: none;">
                        <li class="naviSub"><a href="schart.ad" class="navi">매출 통계</a></li>
                        <li class="naviSub"><a href="slist.ad" class="navi">매출 관리</a></li>
                    </ul>
                </li>
                <li class="naviMenu"><a href="mlist.ad" class="navi">회원 관리</a></li>
                <li class="naviMenu"><a href="splist.ad" class="navi">공간 관리</a></li>
                <li class="naviMenu"><a href="rlist.ad" class="navi">신고 관리</a></li>
            </ul>
        </div>
    </div>

    <script>
        $(function () {
            openSalesInfo = () => {
                if($(".salesInfo_ul").css("display") == "none") { 
                    
                    $(".salesInfo_ul").slideDown(300);
        
                } else {
                    $(".salesInfo_ul").slideUp(300);
                }
            }
        });
    </script>

</body>
</html>