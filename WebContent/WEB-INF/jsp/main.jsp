<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>メイン画面だよ～んw</title>
</head>
    <body style="background-image: url(http://www.netyasun.com/home/bk-img/b008.jpg)">
    </body>
<body>
   <div align="right">
     <a href="/Tetris/LoginServlet">ログアウト</a>
   </div>

   <marquee scrollamount="20" truespeed><font size="100">いらっしゃ～いw</font></marquee>

   <div align="center">
     <h1>${sessionScope.user.name}さんこんにちは！！！</h1>
     <img src="おおわだでっす！.jpg" width="350" height="200">
   </div>

   <div align="center">
     <br><img src="001.png" width="50" height="50">
     <font color="#ff0000" size="100">メイン画面<img src="001.png" width="50" height="50">
     </font>
   </div>

    <div align="center">
      <font size="7">
        <br><a href="/Tetris/IndexTetrisServlet">
        <img src="mario_text_small.png" width="300px"></a>
      </font>
    </div>

    <div align="center">
      <font size="7">
        <br><a href="/Tetris/RankingServlet">
        <img src="Luigi_small.png" width="400px"></a>
      </font>
    </div>

	<audio loop = "loop" autoplay = "autoplay">
      <source src="地上BGMメドレー.mp3" type= "audio/mpeg">
	</audio>

</body>
</html>