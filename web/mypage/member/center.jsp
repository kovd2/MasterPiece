<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.centerWrapArea {
	display: inline-block;
	width: 79%;
	height: 600px;
	background: white;
	float: right;
	font-family: dotum;
	font-size: 12px;
}

.center_top_title {
	height: 40px;
	background: white;
	font-size: 28px;
	font-weight: bold;
	padding: 20px 22px;
	color: #000;
}
.ml10 {
    margin-left: 10px !important;
}

.figure {
	border: 1px solid #ccc;
	padding: 10px;
	width: 915px;
	line-height: 40px;
}

div, li, dd, dt, table, td {
	word-break: break-all;
	word-wrap: break-word;
}

div {
	display: block;
}

.figure>div>.nth-child1 {
	width: 120px;
}

.figure .info_input {
	padding: 8px 10px;
	border: 1px solid #ccc;
	width: 769px;
	height: 15px;
	line-height: 0px;
}

.bg_f3f4f6 {
	background-color: #f3f4f6;
}

input[type="text"], select {
	padding: 0px;
	box-shadow: none;
	border: 1px solid #ccc;
	font-size: 12px;
}

.section .figure>div>div {
	display: inline-block;
}

.section .figure {
	border: 1px solid #ccc;
	padding: 10px;
	width: 915px;
	line-height: 40px;
}

input {
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	padding: 1px;
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border-image: initial;
}

.vtop {
	vertical-align: top;
}

.section .figure .sub_input1 {
	width: 90px;
	margin-right: 10px;
	height: 15px;
	line-height: 0px;
}

.section .figure .sub_input2 {
	width: 240px;
	margin-right: 9px;
	height: 15px;
	line-height: 0px;
}
.no_m {
    margin: 0px !important;
}

.btn_124_bg_blue {
	background-color: #454C5F;
	width: 124px;
	padding: 10.5px 0px;
	height: 12px;
	color: #fff;
	text-align: center;
	display: inline-block;
	cursor: pointer;
	line-height: 12px;
}

.figure .info_select {
	border: 1px solid #ccc;
	width: 237px;
	margin-right: 10px;
	height: 33px;
	line-height: 0px;
}

select {
	padding-left: 10px !important;
}

select {
	-webkit-appearance: menulist;
	box-sizing: border-box;
	align-items: center;
	white-space: pre;
	-webkit-rtl-ordering: logical;
	color: black;
	background-color: white;
	cursor: default;
	border-width: 1px;
	border-style: solid;
	border-color: initial;
	border-image: initial;
}

.section .figure {
	border: 1px solid #ccc;
	padding: 10px;
	width: 915px;
	line-height: 40px;
}

.figure>div>.nth-child2 {
	width: 790px;
}

.section .figure .info_mail .info_mail_1 {
	border: 0px;
	height: 30px;
	padding-left: 10px;
	width: 222px;
}

.section .figure .info_mail {
	border: 1px solid #ccc;
	width: 511px;
	display: inline-block;
	margin-right: 10px;
	height: 33px;
	line-height: 33px;
}

.figure .info_select2 {
	width: 124px;
	height: 33px;
	border: 1px solid #ccc;
	padding: 0px;
}

.section .figure_footer {
    margin-top: 20px;
    padding-left: 10px;
    line-height: 20px;
}


.section .figure_footer .info_radio {
    float: right;
    margin: 0px 5px 0px 5px;
}

.section .figure_footer .info_radio .nth-child2 {
    margin-left: 20px;
}
.text-red {
    color: #e31738;
}
input[type="radio" i] {
    margin: 3px 3px 0px 5px;
}

input[type="radio" i] {
    -webkit-appearance: radio;
    box-sizing: border-box;
}

input[type="radio" i], input[type="checkbox" i] {
    background-color: initial;
    cursor: default;
    margin: 3px 0.5ex;
    padding: initial;
    border: initial;
}

.section .figure_footer .btn_box {
    text-align: center;
    margin-top: 20px;
}

.btn_140_red {
    display: inline-block;
    background-color: #fff;
    color: #E01737;
    border: 1px #E01737 solid;
    height: 12px;
    font-size: 12px;
    padding: 9.5px 0px;
    width: 138px;
    text-align: center;
    cursor: pointer;
    line-height: 12px;
}
.btn_140_bg_red {
    display: inline-block;
    background-color: #E01737;
    color: #fff;
    height: 12px;
    font-size: 12px;
    padding: 10.4px 0px;
    width: 140px;
    text-align: center;
    cursor: pointer;
    line-height: 12px;
}
</style>


</head>
<body>
	<div class="centerWrapArea">
		<div class="section">
			<div class='figure'>
				<div class="center_top_title" align="left">회원정보수정</div>
				<div>
					<div class='nth-child1'>회원아이디</div>
					<div class='nth-child2'>
						<input name="memberModifyName" class='info_input bg_f3f4f6'
							disabled readonly type='text' value='ankkwang' />
					</div>
				</div>

				<div>
					<div class='nth-child1'>이름</div>
					<div class='nth-child2'>
						<input name="user_id" class='info_input bg_f3f4f6' disabled
							readonly type='text' value='안광성' />
					</div>
				</div>


				<div>
					<div class='nth-child1 '>비밀번호 입력</div>
					<div class='nth-child2'>
						<input name="passwd1" id="passwdReg1" class='info_input red_focus'
							type='password' maxlength="16" />
					</div>
				</div>

				<div>
					<div class='nth-child1 '>비밀번호 확인</div>
					<div class='nth-child2'>
						<input name="passwd2" id="passwdReg2" class='info_input red_focus'
							type='password' maxlength="16" />
					</div>
				</div>

				<div>
					<div class='nth-child1 vtop'>회원주소</div>
					<div class='nth-child2'>

						<div>
							<input name="zip1" class='info_input sub_input1' type='text'
								value='' id="id_zip1" readonly /> <input name="zip2"
								class='info_input sub_input1' type='text' value='' id="id_zip2"
								readonly /> <input name="addr1" class='info_input sub_input2'
								type='text' value='' id="id_addr1" readonly /> <span
								class='btn_124_bg_blue'
								onclick="execDaumPostcode(); return false;">우편번호</span> <span
								class='btn_124_bg_blue ml10' id="pay_delivery_list_open"
								id="pay_delivery_list_open">배송지관리</span>
						</div>

						<div>
							<input name="addr2" class='info_input' type='text' value=''
								id="id_addr2" />
						</div>
					</div>
				</div>

				<div>
					<div class='nth-child1'>환불계좌 관리</div>
					<div class='nth-child2'>
						<input name="bankTempName" class='info_input sub_input2'
							type='text' value='' style="width: 215px;" readonly
							id="id_bankTempName" /> <input name="bankTempAcount"
							class='info_input sub_input2' type='text' value='' readonly
							id="id_bankTempNum" /> <input name="bankTempNum"
							class='info_input sub_input2 no_m' type='text' value=''
							style="width: 102px;" readonly id="id_bankTempAcount" /> <span
							class='btn_124_bg_blue ml10' id="accountIn">계좌등록.수정</span>

					</div>
				</div>

				<div>
					<div class='nth-child1'>전화번호</div>
					<div class='nth-child2'>

						<select name="tel1_1" class='info_select'>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="02">02</option>
							<option value="051">051</option>
							<option value="053">053</option>
							<option value="032">032</option>
							<option value="062">062</option>
							<option value="042">042</option>
							<option value="052">052</option>
							<option value="044">044</option>
							<option value="031">031</option>
							<option value="031">031</option>
							<option value="033">033</option>
							<option value="043">043</option>
							<option value="041">041</option>
							<option value="063">063</option>
							<option value="061">061</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="064">064</option>
							<option value="060">060</option>
							<option value="070">070</option>
							<option value="080">080</option>
						</select> <input name="tel1_2" class='info_input sub_input2' type='text'
							value='' maxlength="4" /> <input name="tel1_3"
							class='info_input sub_input2 no_m' type='text' value=''
							maxlength="4" />

					</div>
				</div>

				<div>
					<div class='nth-child1'>휴대전화</div>
					<div class='nth-child2'>

						<select name="tel2_1" class='info_select'>
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> <input name="tel2_2" class='info_input sub_input2' type='text'
							value='9484' maxlength="4" /> <input name="tel2_3"
							class='info_input sub_input2 no_m' type='text' value='3365'
							maxlength="4" />

					</div>
				</div>

				<div>
					<div class='nth-child1'>이메일</div>
					<div class='nth-child2'>

						<div class='info_mail'>
							<input type='text' name="email1" class='info_mail_1'
								value="syong9233" /> @ <input type='text' name="email2"
								class='info_mail_1' value="naver.com" id="email2" />
						</div>

						<select class='info_select2' id="email3"
							onchange="email_change(this)">
							<option value="naver.com">(도메인선택)</option>
							<option value="">직접입력</option>
							<option value="naver.com" selected>naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="chol.com">chol.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="empal.com">empal.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanafos.com">hanafos.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="hitel.net">hitel.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="nate.com">nate.com</option>
							<option value="netian.com">netian.com</option>
							<option value="paran.com">paran.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
						</select> <span class='btn_124_bg_blue ml10' id="id_email_overlap_btn">중복확인</span>
						<input type="hidden" name="id_overlab_chk_flag"
							id="id_overlab_chk_flag">
					</div>
				</div>



			</div>

			<!-- button -->
			<div class='figure_footer'>

				<div>
					이메일 수신동의 하시면 마스터피스 메일을 통해 주문,결제 정보 등의 정보를 우선적으로 받아보실 수
					있습니다. <span class='info_radio'> <label
						style="cursor: pointer"><input name="email_agree"
							value="on" type='radio' />수신동의</label> <label style="cursor: pointer"><input
							name="email_agree" value="no" type='radio' class='nth-child2'
							checked />수신거부</label>
					</span>
				</div>

				<div class='text-red'>(주문관련 및 회사의 주요정책 관련 메세지는 수신동의 여부와 관계없이
					발송됩니다.)</div>

				<div class='btn_box'>

					<a href="/"><span class='btn_140_red'>취소</span></a> <span
						class='btn_140_bg_red' onclick="wSend();">변경</span>

				</div>



			</div>




		</div>
	</div>





</body>
</html>