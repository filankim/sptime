<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<style>

    /* content */
    /* div { border: 1px black solid; } */
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		/*height: 1050px;  */
        height: auto; /* 공지사항의 테이블이 클릭될 때마다 세로 길이에 영향을 끼쳐 자동으로 조절되게 바꿈 */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; padding:100px 0px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }

    /* --------------------------- */
    /* content_2 내용물 css */


    #text>p {
        font-size: 33px;
        font-weight: bold;
        padding: 35px;
        margin: 0px;
    }

    #datee>p {
        font-size: 18px;
        padding: 10px 0px;
        margin: 0px;
    }
    
    dt {
        color: #277BC0;
        font-weight: 800;
    }

    dd a {
        color: #656565;
        text-decoration: none;

    }
	
</style>
</head>
<body>
	
	<div class="wrap">
	
	
	<div id="header_area"><jsp:include page="header.jsp" /></div>
	<div id="content">
        <div id="content_1"></div>
            
        <!--컨텐츠작성부분 -->
        <div id="content_2">
            <div id="text" align="center"><p>이용약관</p></div>
            <div id="datee" style="border-bottom: 2px solid black">
                <p><b>이용약관</b> <span style="font-size:15px; color:#898989;">시행일자:2022년 9월 13일</span></p>
            </div>
            <div style="border-bottom: 1px solid darkgray; padding: 15px 0px; margin:0px;">
                <dl><dt>제 1 조 (목적)</dt> <dd>이 약관은 주식회사 KH24시간열려있조("회사")가 제공하는 스페이스타임(<a href="http://localhost:8006/spacetime">http://localhost:8006/spacetime</a>) 온라인 서비스(이하 “서비스”라고 합니다.)의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</dd> <dt>제 2 조 (정의)</dt> <dd><ol><li>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                    <ol><li>1.	"서비스"라 함은 생활 공간(이하 “공간”) 정보의 공유 및 예약을 위하여 “회사”가 스페이스타임를 통해 제공하는 온라인 서비스를 말합니다.</li> <li>2.	“사이트”라 함은 “회사”가 “서비스”를 운영하는 웹사이트를 의미하며, 현재는 (<a href="http://localhost:8006/spacetime">http://localhost:8006/spacetime</a>) 입니다.</li> <li>3.	회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객은 서비스 이용목적에 따라 “게스트회원”과 “호스트회원”으로 구분됩니다.
                            <ol><li>(1)	게스트회원: 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용할 수 있는 “회원”을 말합니다. 이하 이 약관에서 “회원”이라 함은 “게스트회원”을 말합니다.</li> <li>(2)	호스트회원: “스페이스타임 호스트 이용약관”에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 통해 “공간” 및 컨텐츠를 등록하거나 제안할 수 있는 회원을 말합니다.</li></ol></li> <li>4.  "아이디"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정한 온라인 아이디(이메일)를 말합니다.</li> <li>5.  "비밀번호"라 함은 "회원"이 부여 받은 "아이디”와 일치되는 "회원"임을 확인하고 비밀을 보호하기 위해 "회원" 자신이 정한 온라인 비밀번호를 말합니다.</li> <li>6.	"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 말하며, "회원"이 “서비스”를 통해 이용한 “공간”의 이용후기, Q&amp;A 등을 포함합니다.</li> <li>7.	“호스트센터”는 “호스트회원”를 대상으로 제공하는 공간등록 및 관리 페이지를 말합니다.</li></ol></li></ol></dd> <dt>제 3 조 (약관의 게시와 개정)</dt> <dd><ol><li>1.	"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 “서비스” 초기 화면에 게시합니다.</li> <li>2.	"회사"는 "약관의 규제에 관한 법률", "정보통신망 이용촉진 및 정보보호등에 관한 법률(이하 "정보통신망법")" 등 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li> <li>3.	"회사"가 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만 “회원”에게 불리한 개정인 경우 30일 전부터 적용일자 전일까지 변경 사항을 공지하며, 공지 외에도 “회원”이 등록한 전자우편, “서비스” 로그인 시 동의창 등의 전자적 수단을 통해 따로 명확히 통지합니다.</li> <li>4.	“회사”가 전항에 따라 개정약관을 공지 또는 통지하면서 “회원”에게 개정약관의 공지기간 내에 거부의 의사표시를 하지 않으면 승낙의 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 “회원”이 명시적으로 거부의 의사표시를 하지 아니한 경우 “회원”이 개정약관에 동의한 것으로 간주합니다.</li> <li>5.	“회원”이 개정약관의 적용에 동의하지 않는 경우 “회사”는 개정약관의 내용을 적용할 수 없으며, 이 경우 “회원”은 이용계약을 해지할 수 있습니다. 다만, 기존약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “회사”는 이용계약을 해지할 수 있습니다.</li></ol></dd> <dt>제 4 조 (약관의 해석)</dt> <dd><ol><li>1.	"회사"는 “공간”의 이용 및 예약, 취소, 환불 등에 관한 구체적인 사항을 별도의 이용정책으로 둘 수 있습니다.</li> <li>2.	이 약관 또는 이용정책에서 정하지 아니한 사항이나 해석에 관하여는 관련 법령 또는 상관례에 따릅니다.</li></ol></dd> <dt>제 5 조 (이용계약 체결)	</dt> <dd><ol><li>1.	이용계약은 "회원"이 되고자 하는 자(이하 "회원가입신청자")가 이 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다. “회사”는 이용계약이 체결되면 “회원”의 성명, 연락처, 전자우편주소를 제공받아 보관하며, “서비스” 제공 목적 범위 내에서 이를 “호스트회원”에게 제공할 수 있습니다.</li> <li>2.	"회사"는 "회원가입신청자"의 신청에 대하여 "서비스" 이용을 승낙할 수 있습니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
                    <ol><li>(1)	“회원가입신청자”가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함</li> <li>(2)	실명이 아니거나 타인의 명의를 이용한 경우</li> <li>(3)	허위의 정보를 기재하거나, "회사"가 요구하는 내용을 기재하지 않은 경우</li> <li>(4)	만19세 미만의 미성년자가 법정대리인의 동의 없이 신청하는 경우</li> <li>(5)	“회원가입신청자”의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li></ol></li> <li>3.	제1항에 따른 회원가입신청에 있어 "회사"는 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.</li> <li>4.	"회사"는 “서비스” 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.</li> <li>5.	제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.</li> <li>6.	이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.</li> <li>7.	“회사”는 “회원”에 대하여 “영화 및 비디오물의 진흥에 관한 법률” 및 “청소년보호법” 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</li></ol></dd> <dt>제 6 조 (회원정보의 변경)</dt> <dd>“회원”은 회원가입신청 시 기재한 사항이 변경되었을 경우 “서비스” 프로필 관리 화면을 통하여 수정하여야 합니다. “회원”이 변경사항을 수정하지 아니하여 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.</dd> <dt>제 7 조 (개인정보보호 의무)</dt> <dd><ol><li>1.	"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련 법령 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.</li> <li>2.	“회사”가 개인정보의 보호를 위하여 상당한 주의를 기울였음에도 불구하고, “호스트회원”이 관련 법령 및 “스페이스타임 호스트 이용약관”을 위반하여 “회원”의 개인정보를 유출 또는 유용한 경우 “회사”는 그에 대하여 아무런 책임을 부담하지 않습니다.</li></ol></dd> <dt>제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</dt> <dd><ol><li>1.	"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.</li> <li>2. "회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사"로 오인할 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.</li> <li>3.	"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.</li> <li>4.	제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</li></ol></dd> <dt>제 9 조 ("회원"에 대한 통지)</dt> <dd><ol><li>1.	"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 회원가입신청 시 기재한 전자우편주소 등으로 통지할 수 있습니다.</li> <li>2.	"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 공지게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.</li></ol></dd> <dt>제 10 조 ("회사"의 의무)</dt> <dd><ol><li>1.	"회사"는 관련 법령과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.</li> <li>2.	"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.</li> <li>3.	"회사"는 “서비스” 이용과 관련하여 발생하는 “회원”의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.</li> <li>4.	"회사"는 "서비스" 이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 회사가 지정한 수단(게시판, 전자우편, SMS, 전화 등)을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.</li> <li>5.  본조 4항의 "회원"으로부터 제기된 의견 또는 불만의 경우 도움말, “호스트회원”의 Q&amp;A, 운영 정책 등 상시적으로 확인 할 수 있는 경우 또는 신원을 밝히지 않은 의견 및 불만사항에 대해서는 회신에 대한 의무가 없습니다.</li></ol></dd> <dt>제 11 조 ("회원"의 의무)</dt> <dd><ol><li>1.	"회원"은 다음 행위를 하여서는 안 됩니다.
                    <ol><li>(1) 회원가입신청 또는 회원정보변경시 및 공간 예약 신청 또는 변경 시 허위내용의 등록</li> <li>(2) 타인의 정보도용</li> <li>(3) "회사"가 게시한 정보의 변경</li> <li>(4) "회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li> <li>(5)	"회사"와 기타 제3자의 저작권 등 지식재산권에 대한 침해</li> <li>(6)	"회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li> <li>(7)	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위</li> <li>(8)	"회사"의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위</li> <li>(9)	기타 불법적이거나 부당한 행위</li></ol></li> <li>2.	 "회원"은 관련 법령, 이 약관의 규정, 이용정책 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.</li></ol></dd> <dt>제 12 조 ("서비스"의 제공 등)</dt> <dd><ol><li>1.	“회사”가 “회원”에게 제공하는 “서비스”는 아래 각호와 같습니다.
                    <ol><li> (1) 공간 검색 서비스</li> <li> (2) 공간 예약 서비스</li> <li> (3) 결제 서비스 (“호스트회원”이 결제 서비스를 신청한 “공간”에만 적용)</li> <li> (4) Q&amp;A 게시판 및 이용후기 등록 서비스</li> <li> (5) 기타 "회사"가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스</li></ol></li> <li>2.	공간 예약 서비스 및 결제 서비스는 아래 각호와 같이 구분됩니다.
                    <ol><li>(1)	신청과 동시에 예약확정&amp;바로결제 유형 : “회원”이 “서비스”를 통하여 공간 예약을 신청하는 즉시 “호스트회원”의 승인 없이 예약이 확정되고 바로 결제하는 유형의 예약 방식</li> <li>(2)	호스트 예약 승인 후 결제 유형 : “회원”의 공간 예약 신청 시 “호스트회원”이 해당 예약 건의 적합 여부를 판단하고 승인한 후, “회원”이 결제하는 유형의 예약 방식</li> <li>(3)	호스트 예약 승인 : “회원”이 공간 예약을 신청한 후 “호스트회원”이 예약 건의 적합여부를 판단하고 예약을 승인하되, “회사”의 결제시스템을 이용하지 않고 “회원”과 “호스트회원” 간 당사자의 계약으로 결제하는 유형의 예약 방식</li></ol></li> <li>3.	“회사”는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.</li> <li>4.	"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제9조["회원"에 대한 통지]에서 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.</li> <li>5.	"회사"는 “서비스”의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.</li></ol></dd> <dt>제 13 조 ("서비스"의 변경)</dt> <dd><ol><li>1.	"회사"는 운영상, 기술상 상당한 이유가 있는 경우 제공하고 있는 “서비스”의 전부 또는 일부를 변경할 수 있습니다.</li> <li>2.	“회사”는 "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우 변경사유, 변경될 “서비스”의 내용 및 제공일자 등을 그 변경 전에 해당 “서비스” 초기화면에 게시합니다.</li> <li>3.	"회사"는 무료로 제공되는 “서비스”의 일부 또는 전부를 회사의 정책 및 운영상 필요에 따라 수정, 중단, 변경할 수 있으며, 이에 대하여 관련 법령에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.</li></ol></dd> <dt>제 14 조 (정보의 제공 및 광고의 게재)	</dt> <dd><ol><li>1.	"회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련 법령에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다. 이때 “회원”의 수신거절로 인하여 “회원”이 필요한 정보를 제공받지 못한 경우 그에 대하여 “회사”는 책임이 없습니다.</li> <li>2.	“회사”가 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우 “회사”는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신은 “회원”의 사전 동의 없이 전송할 수 있습니다.</li> <li>3.	"회사"는 "서비스"의 운영과 관련하여 “서비스” 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있습니다.</li></ol></dd> <dt>제 15 조 ("게시물"의 저작권 및 관리)</dt> <dd><ol><li>1.	"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 “게시물”의 저작자에게 귀속됩니다.</li> <li>2.	"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, “회사”는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 “게시물”에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.</li> <li>3.	"회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.</li> <li>4.	"회원"은 “서비스”에서 제3자의 권리를 침해해서는 아니 되며, “회원”의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련 법령에 위반되는 내용을 포함하는 경우 관련 권리자는 관련 법령이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 “회사”에 요청할 수 있으며, "회사"는 관련 법령에 따라 조치를 취할 수 있습니다.</li> <li>5.	"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 “회사” 정책 및 관련 법령에 위반되는 경우에는 관련 법령에 따라 해당 "게시물"에 대해 임시조치, 삭제 등을 취할 수 있습니다.</li></ol></dd> <dt>제 16 조 (권리의 귀속)	</dt> <dd><ol><li>1.	"서비스"에 대한 저작권 및 지식재산권은 "회사"에 귀속됩니다. </li> <li>2.	"회사"는 "회원"에게 "회사"가 정한 이용조건에 따라 “서비스”를 이용할 수 있는 이용권만을 부여하며, "회원"은 “아이디” 등에 관하여 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.</li></ol></dd> <dt>제 17 조 (계약해제, 해지 등)	</dt> <dd><ol><li>1.	"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련 법령 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.</li> <li>2.	"회원"이 이용계약을 해지할 경우, 관련 법령 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다. 다만 "회원"이 이용계약을 해지하는 경우에도 “회원”이 게시판에 등록한 "게시물"은 자동으로 삭제되지 않으니 이용계약 해지 전 “게시물”을 삭제하시기 바랍니다.</li> <li>3.	“회원”은 이용계약 해지 신청일로부터 90일 내에 공간 사용 신청이 확정되어 있는 경우에는 해지할 수 없으므로, 사전에 해당 신청을 취소하여야 합니다. “회원”이 공간 사용 신청을 취소하지 않을 경우 “회사”는 제1항에도 불구하고 “회원”의 이용계약 해지 요청을 거절할 수 있습니다.</li></ol></dd> <dt>제 18 조 (공간의 예약 및 취소 등)</dt> <dd><ol><li>1.	“서비스”에 등록된 “공간”을 예약하고자 하는 “회원”은 “서비스”에서 제공하는 방법에 따라 신청하고, “호스트회원”이 “서비스”상에서 이를 승낙함으로써 “공간” 예약이 완료됩니다.</li> <li>2.	“서비스”가 지원하는 공간 예약 방식은 (i) 신청과 동시에 예약확정&amp;바로 결제 유형 (ii) 호스트 예약 승인 후 결제 유형, (iii) 호스트 예약 승인 유형이 있습니다. 이 중 호스트 예약 승인 유형의 공간에 대해서 “회사”는 “회원”이 예약할 수 있도록 지원할 뿐이므로 이용대금 지불 등 구체적인 절차는 “게스트회원”이 해당 “호스트회원”과 직접 연락하여 처리하여야 하며, 이에 대해서는 본 조항을 적용하지 않습니다.</li> <li>3.	“회사”는 “호스트회원”이 등록한 “공간” 사용의 상세 조건에 대해서 어떠한 보증을 하지 않습니다. “회원”은 “공간”을 예약하기 전에 반드시 “호스트회원”이 “서비스” 내에 작성한 “공간” 사용의 상세 조건을 정확하게 확인해야 합니다. 이를 확인하지 않고 예약하여 발생한 모든 손실과 손해는 “회원”에게 있습니다.</li> <li>4.	“호스트회원”의 선택에 따라 “공간”에 대한 이용대금 사전 결제가 필수인 “공간”을 “회원”이 예약하고자 하는 경우 “회원”은 신용카드 등 “회사”가 지정하는 결제수단을 통해 “공간”에 대한 이용대금을 사전에 결제하여야 “공간”에 대한 예약이 완료됩니다. 미성년자인 “회원”이 “공간”을 예약한 경우 그 법정대리인이 동의하지 않으면 “회원” 본인 또는 법정대리인이 이를 취소할 수 있으며, 미성년자의 거래에 관한 상세한 사항은 관련 법령이 정하는 바에 따릅니다.</li> <li>5.  “회사”는 “서비스”에서 “회원”과 “호스트회원” 간 “공간” 예약이 완료되면 “회원”에게 이를 통지합니다.</li> <li>6.	“서비스”에 등록된 “공간” 예약은 예약 취소가 가능한 경우와 예약 취소가 제한되는 경우로 구분되며, 예약 취소 가능 여부는 이 약관이나 이용정책 또는 “공간”의 상세 조건에서 확인할 수 있습니다.</li> <li>7.	예약 취소가 가능한 “공간”을 예약한 “회원”은 본 조 제6항의 통지를 받은 날로부터 7일 이내에 “회사”의 서비스를 통하여 예약 취소를 할 수 있습니다.</li> <li>8.	“회원”은 전항의 예약 취소 기간이 경과되거나 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에서 정한 예약 취소 제한 사유에 해당하는 “공간” 예약에 대해서는 예약 취소를 할 수 없습니다.</li> <li>9.	“회원”이 예약 취소 기간 경과 후 또는 예약 취소 제한 사유에 해당함에도 불구하고 “회사” 및 “호스트회원”의 책임 없는 사유를 이유로 예약의 취소를 요청하는 경우 “공간”의 상세조건 또는 이용정책 등에서 사전에 안내된 취소수수료가 부과될 수 있습니다.</li> <li>10.	“호스트회원”의 귀책사유로 “회원”이 “공간” 사용일에 “공간”을 정상적으로 사용하지 못한 경우 “호스트회원”이 그에 관한 모든 책임을 부담하며, “회사”는 이에 관한 책임을 지지 않습니다. “회사”는 통신판매중개시스템의 제공자로서 통신판매의 당사자가 아니므로 “서비스” 내에서 “호스트회원”과 “회원” 간에 발생한 “공간”의 예약, 결제, 취소, 환불 관련 분쟁에 대하여 책임을 지지 않습니다.</li></ol></dd> <dt>제 19 조 (이용제한 등)	</dt> <dd><ol><li>1.	"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지, 이용계약해지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.</li> <li>2.	"회사"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련 법령을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.</li> <li>3.	"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.</li> <li>4.	"회사"는 "회원"이 계속해서 1년 이상 로그인하지 않는 경우, 회원 정보의 보호 및 운영의 효율성을 위해 휴면 상태로 전환할 수 있습니다. 휴면 전환된 계정 정보는 별도로 분리하여 안전하게 보관됩니다.</li> <li>5.	"회사"는 본 조의 이용제한의 범위에 대한 구체적인 사항은 이용정책에서 정합니다.</li> <li>6.	본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제9조["회원"에 대한 통지]에 따라 통지합니다.</li> <li>7.  "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.</li></ol></dd> <dt>제 20 조 (책임제한)	</dt> <dd><ol><li>1.	"회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.</li> <li>2.	"회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.</li> <li>3.	"회사"는 "회원" 및 “호스트회원”이 "서비스"와 관련하여 게재한 “게시물”, 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.</li> <li>4.	"회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 이루어진 거래에 관하여는 책임을 지지 않습니다.</li> <li>5.	"회사"는 무료로 제공되는 서비스 이용과 관련하여 관련 법령에 특별한 규정이 없는 한 책임을 지지 않습니다.</li></ol></dd> <dt>제 21 조 (준거법 및 재판관할)</dt> <dd><ol><li>1.	"회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.</li> <li>2.	"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회원"의 주소를 관할하는 지방법원을 전속관할로 하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.</li> <li>3.	해외에 주소나 거소가 있는 "회원"의 경우 "회사"와 "회원"간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할법원으로 합니다.</li></ol></dd> <dt>[부칙] (시행일)</dt> <dd>이 약관은 2022년 09월 13일부터 적용됩니다.</dd></dl>
            </div>
            <div style="height: 100px"></div>

        </div>
        <div id="content_3"></div>
	</div>
	<br clear="both">
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>