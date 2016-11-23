<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".btn").click(function() {
			var path=$(this).attr("id");
			$("#frm").attr("action", path);
			$("#frm").submit();
		});
	});
</script>
</head>
<body>
	<form id="frm" action="fileUp1" method="post" enctype="multipart/form-data">
		<input type="text" name="id"><br>
		<input type="file" name="pic"><br>
		<input type="button" id="fileUp1" class="btn" value="FILE1">
		<input type="button" id="fileUp2" class="btn" value="FILE2">
		<input type="button" id="fileUp3" class="btn" value="FILE3">
	</form>

</body>
</html>