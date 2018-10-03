<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
	<table id="myPtag" border="1"></table>
</div>
<br/>
<div>
	<table id="myPtag2" border="1"></table>
</div>
<script type="text/javascript">
window.onload = function(){
$.ajax({
    type:"GET",
    dataType : "json",
    url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=nPrM7FGpSSPZl8FWWRKCdQ&t_code=01&t_invoice=7612402015011",
    success:function(data){
        console.log(data);
        var myInvoiceData = "";
        if(data.status == false){
            myInvoiceData += ('<p>'+data.msg+'<p>');
        }else{
            myInvoiceData += ('<tr>');                
            myInvoiceData += ('<th>'+"보내는사람"+'</td>');                  
            myInvoiceData += ('<th>'+data.senderName+'</td>');                  
            myInvoiceData += ('</tr>');     
            myInvoiceData += ('<tr>');                
            myInvoiceData += ('<th>'+"제품정보"+'</td>');                   
            myInvoiceData += ('<th>'+data.itemName+'</td>');                    
            myInvoiceData += ('</tr>');     
            myInvoiceData += ('<tr>');                
            myInvoiceData += ('<th>'+"송장번호"+'</td>');                   
            myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                   
            myInvoiceData += ('</tr>');     
            myInvoiceData += ('<tr>');                
            myInvoiceData += ('<th>'+"송장번호"+'</td>');                   
            myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                    
            myInvoiceData += ('</tr>');                                       
        }
         
         
        $("#myPtag").html(myInvoiceData)
         
        var trackingDetails = data.trackingDetails;
         
         
        var myTracking="";
        var header ="";
        header += ('<tr>');               
        header += ('<th>'+"시간"+'</th>');
        header += ('<th>'+"장소"+'</th>');
        header += ('<th>'+"유형"+'</th>');
        header += ('<th>'+"전화번호"+'</th>');                  
        header += ('</tr>');     
         
        $.each(trackingDetails,function(key,value) {
            myTracking += ('<tr>');               
            myTracking += ('<td>'+value.timeString+'</td>');
            myTracking += ('<td>'+value.where+'</td>');
            myTracking += ('<td>'+value.kind+'</td>');
            myTracking += ('<td>'+value.telno+'</td>');                     
            myTracking += ('</tr>');                                  
        });
         
        $("#myPtag2").html(header+myTracking);
         
    }
});
}

</script>
</body>
</html>