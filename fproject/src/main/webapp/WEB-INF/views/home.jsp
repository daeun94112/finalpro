<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
#join_div {
	width: 80%;
	height: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

#join_sub_1 {
	width: 80%;
	height: 700px;
	margin: 0 auto;
}

table {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	width: 80%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}

.td_1 {
	width: 25%;
	height: 50px;
	text-align: center;
}

#btn1 {
	width: 80px;
	height: 30px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	font-weight: bold;
	outline: none;
}

#btn1:HOVER {
	border: 1px solid white;
	background-color: #737373;
	color: white;
}

#true, #false {
	display: none;
	color: red;
	margin-left: 10px;
}

#true {
	color: blue;
}

.categ1 {
	margin-left: 20px;
	width: 60%;
	height: 20px;
}

.categ2 {
	margin-left: 20px;
	width: 80px;
	height: 20px;
}

.categ3 {
	width: 60px;
	height: 20px;
}

.categ4 {
	width: 105px;
	height: 20px;
}

#join_sub_2 {
	width: 45%;
	height: 60px;
	margin: 0 auto;
	margin-top: 30px;
}

.btn2 {
	width: 40%;
	height: 100%;
	margin-left: 30px;
	float: left;
	border: 1px solid #00ace6;
	background-color: #00ace6;
	font-size: 20px;
	color: white;
}

.btn2:HOVER {
	border: 1px solid #00ace6;
	background-color: white;
	color: #00ace6;
}

#btn3 {
	border: 1px solid #737373;
	background-color: #737373;
	outline: none;
}

#btn3:HOVER {
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- JavaScript 처리  시작 -->
	<script type="text/javascript">
		$(function() {
			//
			$("#id").focus();
			// 중복 확인 버튼
			$("#btn1").click(function (){
				openWindow();
			});
			
			// HOME 버튼
			$("#btn3").click(function (){
				location.href = "../main/index.jsp";
			});
			
			// 회원 가입 버튼
			$("#btn4").click(function (){
				$.post("join.member", {
					id : $("#id").val(),
					pw : $("#pw2").val(),
					name : $("#name").val(),
					year : $("#year").val(),
					phone : "["+$("#tel").val()+"]"
							+ $("#pFirst").val()+"-"
							+ $("#pSecond").val()+"-"
							+ $("#pThird").val(),
					email : $("#email_1").val()+"@"
							+ $("#email_2").val(),
				}, function(data) {
					alert(data);
					location.href = "../main/index.jsp";
				});
			});
		});
		
		// Opener 열기
		function openWindow() {
			var scWidth = screen.availWidth;
			var scHeight = screen.availHeight;
			
			var left = (parseInt(scWidth)-400)/2;
			var top = (parseInt(scHeight)-400)/2;
			var id = $("#id").val();
			var newWindow = window.open("../member/checkID.jsp?id="+id, 
					"newWindow", "height=130, width=400, top="+top+", left="+left+", resizable=yes");
		}
		
		// ID 얻기
		function getId(getId) {
			$("#id").val(getId);
		}
		
		// PW 일치, 불일치
		function equalPW() {
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			
			if(pw1 == pw2) {
				$("#true").css("display", "inline");
				$("#false").css("display", "none");
			} else {
				$("#true").css("display", "none");
				$("#false").css("display", "inline");
			}
		}
		
		// 비밀번호 초기화
		function rePW() {
			$("#pw2").val("");
			$("#true").css("display", "none");
			$("#false").css("display", "none");
		}
	</script>
	<!-- JavaScript 처리 끝 -->
</body>
</head>
<body>
	<!-- Join 시작 -->
	<div id="join_div">
		<!-- 입력 부분 시작 -->
		<div id="join_sub_1">
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">ID</td>
					<td><input type="text" id="id" class="categ1">
						<button id="btn1">CHECK</button></td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td class="td_1">PASSWORD</td>
					<td><input type="password" class="categ1" id="pw1"
						onkeyup="rePW()"></td>
				</tr>
				<!-- 비밀번호 재확인 -->
				<tr>
					<td class="td_1">PASSWORD CHECK</td>
					<td><input type="password" class="categ1" id="pw2"
						onkeyup="equalPW()"> <span id="false">NO</span> <span
						id="true">YES</span></td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">NAME</td>
					<td><input type="text" class="categ1" id="name"></td>
				</tr>
				<!-- 나이 -->
				<tr>
					<td class="td_1">BIRTH</td>
					<td><select class="categ2" id="year">
							<c:forEach begin="1" end="77" varStatus="status">
								<option>${ 2017-status.count }</option>
							</c:forEach>
					</select> . <select class="categ3">
							<c:forEach begin="1" end="12" varStatus="status">
								<option>${ status.count }</option>
							</c:forEach>
					</select> . <select class="categ3">
							<c:forEach begin="1" end="31" varStatus="status">
								<option>${ status.count }</option>
							</c:forEach>
					</select> </td>
				</tr>
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">TEL</td>
					<td><select class="categ2" id="tel">
							<option>SKT</option>
							<option>KT</option>
							<option>LGU+</option>
					</select> <select class="categ3" id="pFirst">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>019</option>
					</select> - <input type="text" class="categ3" id="pSecond"> - <input
						type="text" class="categ3" id="pThird"></td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td>
					<td><input type="text" class="categ2" id="email_1"> @
						<select class="categ4" id="email_2">
							<option>hanmail.net</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>gmail.com</option>
							<option>hotmail.com</option>
					</select></td>
				</tr>
				<!-- address -->
				<tr>
					<td class="td_1">ADDRESS</td>
					<td><input type="text" class="categ2" id="address">
					</td>
				</tr>
			</table>
		</div>
		<!-- 버튼처리 부분 -->
		<div id="join_sub_2">
			<button class="btn2" id="btn3">HOME</button>
			<button class="btn2" id="btn4">JOIN</button>
		</div>
	</div>
	<!-- Join 끝 -->
</body>
</html>
