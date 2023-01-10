<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* ---------- footer ---------- */
      #footer {
        height: 225px;
        background-color: #dee9f1;
        color: black;
      }
      #footerDv {
        overflow: hidden;
        width: 1200px;
        margin: 0 auto;
      }
      #footer_etc {
        /*margin-top: 30px;*/
        margin-bottom: 10px;
      }
      #footer_etc a {
        text-decoration: none;
        color: black;
      }
    /* -------------------- */

      
    .cop_area {
      height: 60px;
      padding: 0 12px;
      border-bottom: 1px solid #d7d7d7;
    }

    .cop_area .cop_areaIn {
      max-width: 1200px;
      margin: 0 auto;
      position: relative;
      z-index: 2;
    }

    .cop_area .cop_areaIn:after {
      content: "";
      position: absolute;
      top: 0;
      bottom: 0;
      left: 910px;
      width: 100%;
      z-index: -1;
      display: none;
   }

    .cop_menu {
      list-style: none;
      overflow: hidden;
      width: 810px;
      display: inline-block;
      float: left;
      padding: 22px 0;
      margin-bottom: 0px;
    }

    .cop_menu>li {
      position: relative;
      float: left;
      margin: 0 12px;
    }

    .cop_menu > li > a {
      position: relative;
      font-size: 16px;
      color: #222;
    }

    .cop_menu > li > a:before {
      content: "|";
      position: absolute;
      top: 50%;
      left: -12px;
      width: 1px;
      height: 14px;
      margin: -14px 0 0;
      background-color: #d7d7d7;
   }

   .first::before {
    content: ""!important;
  } 

  .footer_logo {
    position: absolute;
    top: 0;
    right: 0;
    display: table;
    width: 310px;
    height: 60px;
    text-align: right;
  }

  .footer_logoIn {
    display: table-cell;
    vertical-align: middle;
  }

  #footer_logoIn>img {
    display: inline-block;
    vertical-align: middle;
    width: 30px;
    height: 30px;
  }

  .footer_logoIn>span {
    display: inline-block;
    vertical-align: middle;
    margin: 0 0 0 6px;
    font-size: 25px;
    color: #222;
  }

  .footer_inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 10px 20px 20px;
    color: #666;
    font-size: 14px;
  }


</style>
</head>
<body>
	<!--푸터-->
      <div id="footer">
        <div id="footerDv">
          <div id="footer_etc">
            <div class="cop_area">
              <div class="cop_areaIn">
                <ul class="cop_menu">
                  <li><a href="privacyPolicy.co" class="first">개인정보처리방침</a></li>
                  <li><a href="userAgreement.co">이용약관</a></li>
                  <li><a href="managementPolicy.co">운영정책</a></li>
                </ul>
                <div class="footer_logo">
                  <div class="footer_logoIn">
                    <img src="resources/images/logo.png" style="width:30px; height:30px;">
                    <span>SpaceTime</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <p class="footer_inner" align="left">
              (07212) 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br>
              TEL. 02)1544-9970 | 상호명 : SpaceTime | 사업자등록번호 : 876-85-00632 | 기관명 : KH24시간이모자라조 | 대표자 : 이경미<br><br>
              ⓒCopyright KH24 Corp(SpaceTime) All Rights Reserved.
          </p>
        </div>
      </div>

</body>
</html>