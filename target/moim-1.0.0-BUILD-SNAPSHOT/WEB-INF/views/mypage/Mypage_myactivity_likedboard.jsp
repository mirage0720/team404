<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<script>
	
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mypage_myactivity_likedboard.html</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet"
	href="resources/css/Mypage_myactivity_commbyme.css">
<link rel="stylesheet"
	href="resources/css/Mypage_myactivity_commbyme_min.css">
<script src="https://kit.fontawesome.com/1652357a48.js"
	crossorigin="anonymous"></script>


</head>


<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<div class="header"></div>

	<div class="area">

		<div class="Mypage_myactivity_selection">
			<ul>
				<li><a href="Mypage_myactivity_boardbyme.do?user_id=${user_id }">내가 쓴 글</a></li>
				<li><a href="Mypage_myactivity_communitybyme.do?user_id=${user_id }">내가 쓴 커뮤니티</a></li>
				<li><a href="Mypage_myactivity_commbyme.do?user_id=${user_id }">내가 쓴 댓글</a></li>
				<li><a href="mypage_myactivity_good.do?user_id=${user_id }">좋아요 사진</a></li>
				<li><a href="Mypage_myactivity_likedboard.do?user_id=${user_id }">좋아요 게시글</a></li>
			</ul>
		</div>
	</div>
	<hr style="margin-bottom: 50px;">

<c:forEach var="vo" items="${vos}">
	<div class="like_List">
		<ul class="asldkjasd">
			<li>
				<div class="liked_board">
					<ul class="board_profile_info">
						<li class="info_item1">

							<div class="profile">
								<div class="circle">
									<img src="resources/uploadimg/아이유.png" alt="프로필 이미지">
								</div>
							</div>

						</li>
						
						
						<ul>
							<li class="info_item2">
								<div class="vertical_info">
									<a href="join_selectOne.do?num=${vo.num }" style="display: inline;">${vo.title }</a>
									<a href="join_selectOne.do?num=${vo.num }" style="font-size: 0.2rem; display: inline;">${vo.write_date }</a>
								</div>
							</li>
							
							<li><a href="join_selectOne.do?num=${vo.num }">${vo.content }</a><hr></li>
						</ul>
						

					</ul>
				</div>

			</li>
		</ul>
	</div>
</c:forEach>

	<div class="footer">
		<div>
			<strong>온앤오프</strong>
			<ul>
				<li>공지사항</li>
				<li>이벤트</li>
				<li>자주 믿는 질문</li>
			</ul>
		</div>
		<div>
			<strong>소셜 미디어</strong>
			<ul>
				<li>인스타그램</li>
				<li>네이버 블로그</li>

			</ul>
		</div>
		<div class="footer_company">
			<strong>온앤오프</strong>
			<ul>
				<li>대표: 팀404 개인정보관리책임자: 팀404</li>
				<li>이메일: Team404@Team404.com 대표번호: 123-1234-1234</li>
				<li>주소: 서울시 강남구 태헤란로 ~~~~~</li>
			</ul>
		</div>

	</div>
</body>
</html>