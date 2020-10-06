<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ユーザ登録完了画面</title>
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

	<div class="form3">
		<p id="sample">
		登録ありがとNya(=^・^=)
		<br>
		☆ユーザー情報を登録しました☆
			id:${user.id}<br>
			name:${user.name}<br>
			pass:${user.pass}<br>
	    ☆ユーザー情報を登録しました☆
		</p>
		<a href="/Tetris/LoginServlet"><font size="5" color="yellow">ログイン画面へ</font></a>
	</div>

	<div class="wrapper">
	</div>

	<div class="video2">
	<video   width="800px" height="600px" autoplay  src="テトリスBGM.mp4" loop  ></video>
	</div>

     <p id="sample">
		id:${user.id}<br>
		name:${user.name}<br>
		pass:${user.pass}<br>
	</p>


    <div class="video3">
	     <video   width="300px" height="400px" autoplay  src="くろねこ.mp4"  loop  ></video>
	</div>

	<div class="video4">
	   <video   width="300px" height="400px" autoplay  src="ほげねこ.mp4"  loop  ></video>
	</div>
</body>
</html>