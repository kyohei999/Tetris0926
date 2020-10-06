<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>結果画面</title>
	<style type="text/css">
	body { background-image:url("夏.jpg");
	       background-repeat:  no-repeat;                         /* 画像の繰り返しを指定  */
	       background-position:center;                            /* 画像の表示位置を指定  */
	       background-attachment:fixed;                           /* 画像の固定を指定  */
	       background-size: 1370px 900px;                         /* 画像のサイズを指定    */
	       }
	</style>
</head>
<body>
	<div align="center">
     <br><img src="王冠.png" width="50" height="50">
     <font color="#ff0000" size="100">SCORE<img src="王冠.png" width="50" height="50">
     </font>
   </div>

	<div align="center">
	  <br><br>
	      <font size="50"><c:out value="${rank.name}" />の点数は…</font>
	  <br><br><br>
          <font size="50"><c:out value="${rank.score}" />点です！</font>
    </div>

	<a href="${pageContext.request.contextPath}/IndexTetrisServlet">
	  <font  size="5">もう一度プレイする</font></a>
	<br>
	  <div align="right">
	    <a href="${pageContext.request.contextPath}/RankingServlet">
	    <font  size="5">ランキング・コメント</font></a>
	  </div>

	<Marquee scrollamount="20" truespeed><img src="mario-yossy.png" width="200" height="200"></Marquee>

	<audio autoplay = "autoplay">
      <source src="fanfare.mp3" type= "audio/mpeg">
	</audio>

</body>
</html>