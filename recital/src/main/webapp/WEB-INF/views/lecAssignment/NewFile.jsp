<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>Iamport 결제테스트</h2> 

<button class="btn btn-primary" type="button" onclick="requestPay()">통합결제</button>
       
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
function requestPay() {
  IMP.init('iamport'); // 'iamport' 대신 자신의 "가맹점 식별코드"를 사용하세요.
  IMP.request_pay({
    pg: "inicis", // PG사
    pay_method: "card", // 결제수단
    merchant_uid : 'merchant_'+new Date().getTime(), // 주문번호
    name : '결제테스트', // 주문명
    amount : 100, // 금액
    buyer_email : 'iamport@siot.do', // 구매자 이메일
    buyer_name : '구매자', // 구매자 이름
    buyer_tel : '010-1234-5678', // 구매자 전화번호
    buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
    buyer_postcode : '123-456' // 구매자 우편번호
  }, function(rsp) {
    if (rsp.success) {
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      // 결제 완료 후 이동할 페이지 URL을 'location.href'에 지정하세요.
      location.href = "/member/payInsert.jsp";
    } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
    }
  });
}
</script>