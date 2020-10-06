<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>ログイン</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/Tetris.css">
	<script src="${pageContext.request.contextPath}/js/Tetris.js"></script>
</head>

<body>


	<div class="container">
		<p class="bound">
			<span>T</span>
			<span>e</span>
			<span>t</span>
			<span>r</span>
			<span>i</span>
			<span>s</span>
			<span>!</span>
		</p>
    </div>
	<div class="form1">
		<span style="color:#ff0000;">${message}</span>

		<form action="/Tetris/MainServlet" method="post" id="sample" >
			<table>
				<tr>
					<td><font size="5" color="gold">ユーザID</font></td>
					<td><input type="text" name="id" placeholder="4～16文字"></td>
				<tr>
					<td><font size="5" color="gold">パスワード</font></td>
					<td><input type="password" name="pass" placeholder="4～16文字"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					    <input type="submit" value="ログイン">
					</td>
				</tr>
			</table>

		</form>
			<a href="/Tetris/UserRegisterServlet"><font size="5" color="gold">新規ユーザ登録</font></a>
	</div>

	<div class="wrapper">
	</div>

	<div class="video2">
	<video   width="800px" height="600px" autoplay  src="テトリスBGM.mp4" loop  ></video>
	</div>

	<div class="video3">
	<video   width="300px" height="400px" autoplay  src="伊佐山.mp4"  loop  ></video>
	</div>

	<div class="video4">
	<video   width="300px" height="400px" autoplay  src="伊佐山.mp4"  loop  ></video>
	</div>
</body>
</html>