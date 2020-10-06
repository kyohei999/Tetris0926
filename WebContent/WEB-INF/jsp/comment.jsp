<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>コメント画面</title>
    <style type="text/css">
      body { background-image:url("Mario01.jpg");
             background-repeat:no-repeat;
             background-position:center;
             background-attachment:scroll;
             background-size:cover;
            }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Tetris.css">
    <script src="${pageContext.request.contextPath}/js/Tetris.js"></script>
</head>

<body>
  <div align="center">
  <form action="${pageContext.request.contextPath}/CommentServlet" method="post">
    <table>
      <tr>
        <td><br><p><img src="スーパーキノコ.png" width="15" height="15">ニックネーム（20字以内）<br><input type="text" size="20" maxlength="20" name="name" placeholder="ニックネーム"></td>
      </tr>
      <tr>
        <td><p><img src="1upキノコ.png" width="15" height="15">コメント欄（500字以内）<br><textarea rows="5" cols="70" maxlength="500" name="text" placeholder="コメント入力"></textarea></td>
      </tr>
      <tr>
        <td style="text-align: center;"><input type="submit" value="投稿"></td>
      </tr>
    </table>
  </form>
	<c:forEach var="comment" items="${commentList}">
			<p id="comment">
			       <c:out value="${comment.name}" />
			       <c:out value="${comment.text}" />
			</p>
	</c:forEach>
  </div>

  <div align="right">
      <font size="3">
        <br><br><a href="/Tetris/RankingServlet">
        <font  size="5">ランキングに戻る</font></a>
      </font>
  </div>

  <div align="right">
      <font size="3">
        <br><a href="/Tetris/MainServlet">
        <font  size="5">メインに戻る</font></a>
      </font>
  </div>

  <audio loop = "loop" autoplay = "autoplay">
    <source src="マリオ地上面の弦楽三重奏アレンジ.mp3" type= "audio/mpeg">
  </audio>

</body>
</html>
