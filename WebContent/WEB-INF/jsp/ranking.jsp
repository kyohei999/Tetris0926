<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ランキング</title>
    <style type="text/css">
      body { background-image:url("galaxy.jpg");
             background-repeat:  no-repeat;                         /* 画像の繰り返しを指定  */
             background-position:center;                            /* 画像の表示位置を指定  */
             background-attachment:fixed;                           /* 画像の固定を指定  */
             background-size: 1400px 800px;                         /* 画像のサイズを指定    */
            }
    </style>
</head>

  <body>
    <div align="center">
      <br><img src="ランキングロゴ.png" width="500" height="100">
    </div>
    <div style="position:absolute; top:100px; left:1000px">
      <br><img src="Bowser.png" width="400px" height="400px">
    </div>
      <br>
    <div align="center">
      <table border="1" style="font-size: 20pt;" class="table table-hover" style="table-layout:fixed;">
    <tr>
        <th>順位</th>
        <th style="width:500px;">点数</th>
    </tr>
    <tr>
        <td><img src="RankingIcon1.png" width="50" height="50" align="middle"></td>
        <td align="center" style="color:gold">
        	<c:out value="${rank1.name}"/>    <c:out value="${rank1.score}"/>
	  	</td>
    </tr>
    <tr>
        <td><img src="RankingIcon2.png" width="50" height="50" align="middle"></td>
        <td align="center" style="color:silver">
        	<c:out value="${rank2.name}"/>    <c:out value="${rank2.score}"/>
        </td>
    </tr>

    <tr>
        <td><img src="RankingIcon3.png" width="50" height="50" align="middle"></td>
        <td align="center" style="color:brown">
        	<c:out value="${rank3.name}"/>    <c:out value="${rank3.score}"/>
        </td>
    </tr>

    <tr>
        <td align="center" style="color:green">4位</td>
        <td align="center" style="color:green"><c:out value="${rank4.name}"/>    <c:out value="${rank4.score}"/></td>
    </tr>

    <tr>
        <td align="center" style="color:green">5位</td>
        <td align="center" style="color:green"><c:out value="${rank5.name}"/>    <c:out value="${rank5.score}"/></td>
    </tr>
  </table>
  </div>

	<a href="${pageContext.request.contextPath}/IndexTetrisServlet">
	<font color="red" size="5">もう一度プレイする</font></a>
	  <div align="right">
	    <a href="${pageContext.request.contextPath}/CommentServlet">
	    <font color="red" size="5">コメント</font></a>
	  </div>

	<audio loop = "loop" autoplay = "autoplay">
<source src="マリオがステージ1でテンヤワンヤするBGM.mp3" type= "audio/mpeg">
	</audio>

</body>
</html>