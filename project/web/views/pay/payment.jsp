<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<body>

 
<script>
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp96485144"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	
	// IMP.request_pay(param, callback) 호출
	
		  IMP.request_pay({ // param
			    pg: "kakao",
			    pay_method: "card",
			    merchant_uid: "ORD20180131-0000011",
			    name: "주문명 : 결제테스트",
			    amount: 64900,	//결제 금액
			    buyer_email: "",//구매자 email
			    buyer_name: "",	//구매자 이름
			    buyer_tel: "",  //구매자 전화번호
			    buyer_addr: "", //구매자 주소
			    buyer_postcode: ""//우편번호
			  }, function (rsp) { // callback
			    if (rsp.success) {// 결제 성공 시 로직
			    	var msg = "결제가 완료되었습니다";
			        msg +="고유 아이디 :" + rsp.imp_uid;
			        msg +="상점 거래 아이디" + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
			       
			    } else {// 결제 실패 시 로직
			    	var message = "결제에 실패하였습니다";
			    	msg += '에러내용 : ' + rsp.error_msg;
			       
			    }
			  });
		

</script>
</body>
</html>