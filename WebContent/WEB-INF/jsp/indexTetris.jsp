<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tetris</title>
	<style type="text/css">
		#field {
			border: solid 1px #000000;
			}
	</style>
<!--  <style type="text/css">
body { background-image:url("gameboyi3-1.png");
       background-repeat:  no-repeat;                         /* 画像の繰り返しを指定  */
       background-position:47.5% 59.3%;                            /* 画像の表示位置を指定  */
       background-attachment:fixed;                           /* 画像の固定を指定  */
       background-size: 1031px 1100px;                         /* 画像のサイズを指定    */
       }
</style>-->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/Tetris2.css">


</head>
<body>
	<div class="form1">
		<canvas id="field" width="600" height="600"></canvas>
		<script type="text/javascript" src="js/tetrimino.js"></script>
		<script type="text/javascript" src="js/tetris.js"></script>

	<form action="/Tetris/ResultServlet" method="post" name="scoreForm">
		<button type="submit" name="action" >スコア結果画面へ</button>
		<input type="hidden" name="score" value="0">

	</form>


	</div>






    <div style="position:absolute; top:-122px; left:161px">
      <br><img src="gameboyiFrame.png" width="1025px" height="716px">
    </div>

    <div style="position:absolute; top:60px; left:750px">
      <br><img src="Mario.gif" width="150px" height="150px">
    </div>


	<audio loop = "loop" autoplay = "autoplay">





<source src="short_song_mary_nostalgia.mp3" type= "audio/mpeg">

	</audio>



</body>
</html>