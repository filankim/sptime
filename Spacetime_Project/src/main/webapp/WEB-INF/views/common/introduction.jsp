<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>서비스소개</title>

  <style>

     body * {
        box-sizing: border-box;
      }

    #content {
        width: 1200px;
        margin: 0 auto;
        margin-top: 50px;
        margin-bottom: 50px;
        padding: 50px;
    }
    #spacetime {
        font-size: 70px;
    }


    .introduce td div{

      padding: 30px;
      margin: auto;
    }

    #intro_tb {
      margin: auto;
    }

    .title_wrap{
      width: 100%;
			margin: 10px auto;
      position: relative;
    }

    .title_wrap img {
      width: 100%;
      height: 600px;
			vertical-align: middle;
    }


    .text {
      font-size: 50px;
      font-weight:700;
      color: white;
      padding: 5px 10px;
			text-align: center;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate( -50%, -50% );
    }

  </style>
</head>
<body>


  <jsp:include page="../common/header.jsp" />

  <br><br><br><br>

    <div class="title_wrap">
      <div><img src="resources/images/common/introductionImg.jpeg" alt="사진없음"></div>
      <div class="text">
        누구나 원하는 곳에서 
        <br>
        우리다운 시간을 
        <br>
        <div id="spacetime" align="center">
          <span id="logo"><img src="resources/images/logo.png"></span> &nbsp;&nbsp;&nbsp;&nbsp;
          <span style="color:#277BC0;">S</span><span>pace</span>
          <span style="color: #FFB200;">T</span><span>ime</span>
        </div>
      </div> 
    </div>
    <br><br>

  <div id="content">

    

    <div class="introduce">

      <table id="intro_tb">
        <tr>
          <td>
            <!-- 왼쪽 -->
            <div style="font-size: 30px; font-weight:800; color: rgb(96, 155, 204);">
              대한민국 No.1 <br>공간 대여 플랫폼
            </div>
          </td>
          </div>
          <td>
          <!-- 오른쪽 -->
          <div style="font-size:20px;">
            스페이스타임은 필요한 시간만큼 공간을 예약할 수 있는
            생활 공간 플랫폼입니다. <br>
            누구나 원하는 공간에서 우리다운 시간을 보낼 수 있도록<br>
            나아가 모두에게 더 머물기 좋은 도시가 되도록<br>
            좋은 공간을 연결하는 것이 스페이스타임의 미션입니다. 
          </td>
        </tr>
      </table>
    </div> 

    <br><br><br><br>



  </div>



  <div class="title_wrap" style="margin-bottom: 0px;">
    <div><img src="resources/images/common/introductionImg2.jpeg" alt="사진없음"></div>
    <div class="text">
      원하는 공간을 찾아보세요 <br>
      <p style="font-size: 20px; font-weight:100">
        파티룸부터 코워킹오피스까지,<br> 
        2만 개 이상의 다양한 공간을 한눈에 둘러보고<br> 
        내게 딱 맞는 라이프스타일을 경험해보세요.
      </p>
    </div>
  </div>


  <jsp:include page="../common/footer.jsp" />
  
</body>
</html>