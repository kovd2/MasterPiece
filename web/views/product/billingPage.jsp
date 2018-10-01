<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.MasterPiece.member.model.vo.*"%>
<%
String id = request.getParameter("id");
int price = Integer.parseInt(request.getParameter("price"));
String select = request.getParameter("select");
String recipient = request.getParameter("recipient");
String address = request.getParameter("address");
String tel = request.getParameter("tel");
String etc = request.getParameter("etc");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/top.jsp"%>
	<script>
	/*아임포트 결제 api*/
	
 	IMP.init('imp29263511');
      IMP.request_pay({
         pg : 'inicis',
         pay_method : 'card',
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : '주문명:공고 결제',
         amount : 100,
         buyer_email : '<%=loginUser.getEmail()%>',
 	    buyer_name : '<%=loginUser.getUserName()%>',
 	    buyer_tel : '<%=loginUser.getPhone()%>',
 	    buyer_addr : '<%=loginUser.getAddress()%>',
 	    buyer_postcode : '123-456'
      }, function(rsp) {
          if (rsp.success) {
             //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
             jQuery.ajax({
                url : '<%=request.getContextPath()%>/payMent', //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                type : 'POST',
                dataType : 'json',
                data : {
                	imp_uid: rsp.imp_uid,
                	id : '<%=id%>',
		    		price : rsp.paid_amount,
		    		select : '<%=select%>',
		    		applyno : rsp.apply_num,
		    		recipient : '<%=recipient%>',
		    		address : '<%=address%>',
		    		tel : '<%=tel%>',
		    		etc : '<%=etc%>'
                //기타 필요한 데이터가 있으면 추가 전달
                }
             })
             location.href="<%=request.getContextPath()%>/views/product/complet_payment.jsp";
          } else {
             var msg = '결제에 실패하였습니다.';
             msg += '에러내용 : ' + rsp.error_msg;

             alert(msg);
             location.href="<%=request.getContextPath()%>/main.jsp";
          }
       });
	</script>
</body>
</html>