<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ユーザー登録画面</title>
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
		<h1><font size="8" color="silver">ユーザー登録画面</font></h1>

		<span style="color:white;">${message}</span>

		<form action="/Tetris/UserRegisterCompleteServlet" method="post">
			<table>
				<tr>
					<td><font size="4" color="silver">ユーザID</font></td>
					<td><input type="text" name="id" placeholder="4～16文字"></td>
				</tr>
				<tr>
					<td><font size="4" color="silver">ユーザ名</font></td>
					<td><input type="text" name="name" placeholder="4～16文字"></td>
				</tr>
				<tr>
					<td><font size="4" color="silver">パスワード</font></td>
					<td><input type="password" name="pass" placeholder="4～16文字"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="登録">
					</td>
				</tr>
			</table>
		</form>
		<a href="/Tetris/LoginServlet"><font size="5" color="gold">ログイン画面へ戻る</font></a>
	</div>

	<div class="wrapper">
	</div>

	<div class="video2">
	<video   width="800px" height="600px" autoplay  src="テトリスBGM.mp4" loop  ></video>
	</div>

	<div class="video3">
	<video   width="300px" height="400px" autoplay  src="物品とおります.mp4"  loop  ></video>
	</div>

	<div class="video4">
	<video   width="300px" height="400px" autoplay  src="物品とおります.mp4"  loop  ></video>
	</div>

	<div class="video5">
	<video   width="1200px" height="700px" autoplay  src="花火夢想.mp4" loop  ></video>
	</div>




</body>
</html>