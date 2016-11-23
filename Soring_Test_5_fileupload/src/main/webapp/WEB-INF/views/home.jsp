<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="files/fileUp1">FileUp1_RequestParam</a><br>
<a href="files/fileUp1">FileUp2</a>
<a href="files/multi_fileup">multiFile</a>
<a href="board/boardWrite">WRITE</a>

</body>
</html>
