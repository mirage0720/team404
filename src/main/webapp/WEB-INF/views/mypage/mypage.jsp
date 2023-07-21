<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/mypage.css">
    <link rel="stylesheet" href="resources/css/mypage_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>

    <style>
        /* 버튼 스타일 */

        button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            outline: none;
            color: dimgray; /* 기본 글씨 색상은 검은색으로 설정 */
        }

        /* 버튼 호버 시 글씨 색상 변경 */
        button:hover {
            color: lightgray;
        }


        /* 인풋 테두리 숨기기 */
        input[type="text"] {
            border: 1px lightgray solid;
        }

        /* 두번째 자식 인풋의 가로 길이 조정 */
        .note_title > div:nth-child(2) > input {
            width: 90%;
            border: #5f6368 1px solid;
        }

        /* 세번째 자식 인풋의 가로 길이 조정 */
        .note_title > div:nth-child(3) > input {
            width: 80px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	console.log('onload....mypage');

    	$.ajax({
    		url:'mypageSelectSomoim.do',
    		success: function(vos){
    			console.log('ajax successed...');
    			console.log('data vos:{}', vos);

    			let tag_vos = '';

    			$.each(vos,function(index,vo){
    				console.log(index,vo);
	    			console.log('somoim_img : ', vo.somoim_img);

    				tag_vos += `

    					<a href="som_selectOne.do?num=\${vo.num}"> <li>
                        <div>
                            <img src="resources/uploadimg/\${vo.somoim_img}" width="230"; height="230"; style="border-radius:150%; border: 1px lightgray solid;">
                        </div>
  						  <p>\${vo.som_title}</p>
                  	    </li> </a>

        			`;

        			if(index>=3) {
	    				console.log('3보다 많다.');
	    				return false;
    				}

    			});



    			$('#img_somoim').html(tag_vos);

    		},
    		error: function(xhr, status, error){
    			console.log('xhr.status:', xhr.status);
    		}

    	});
    });



</script>

    <script>
        function longPolling() {
            $.ajax({
                url: "josn_message.do",
                type: "GET",

                success: function (mes) {
                    console.log('mes ajax successed...');
                    console.log('mes data vos:', mes);
                    console.log(mes);
                    let tag_mes = '';
                    $.each(mes, function (index, mes_one) {
                        console.log('mes_one... ', mes_one);
                        tag_mes += `
                <li>
    <div class="note_title">
        <strong>\${mes_one.sender}</strong>
        <br>
        <form id="myForm" action="message_insertOK.do">
            <input type="hidden" name="user_id" value="${user_id}">
            <input type="hidden" name="receiver" value="\${mes_one.sender}">
            <input type="hidden" name="sender" value="\${mes_one.receiver}">
            <input id="hidden_content_input" type="hidden" name="content" value="\${mes_one.content}">
            <button class="custom-button reply-button" id="submitButton" type="submit">답장하기</button>
        </form>
        <form action="message_deleteOK.do">
            <input type="hidden" name="num" value="\${mes_one.num}">
            <button class="custom-button delete-button" type="submit">삭제하기</button>
        </form>
    </div>
    <div class="note_content" style="border: 1px solid gray; padding: 5px; margin: 5px 0; width:50%;">
        \${mes_one.content}
    </div>
    <div style="display: flex; width:35%">
        <input id="join_comments" type="text" name="content" placeholder="답장을 입력하세요!" style="flex: 1; padding: 5px; height: 75%; width:35%">
        <div class="note_date" style="padding: 5px; height: 30px;">
            \${mes_one.sending_date}
        </div>
    </div>
</li>`;
                    });

                    $('.mypage_grid03').html(tag_mes);

                    // Add button styles using jQuery
                    $('.reply-button, .delete-button').css({
                        'color': 'gray',
                        'text-decoration': 'underline',
                        'cursor': 'pointer',
                        'background-color': 'transparent',
                        'border': 'none'
                    });

                    // Button hover effect
                    $('.reply-button, .delete-button').hover(function () {
                        $(this).css({
                            'color': 'lightgray'
                        });
                    }, function () {
                        $(this).css({
                            'color': 'gray'
                        });
                    });

                    setTimeout(longPolling, 100000);
                },
                error: function (xhr, status, error) {
                    console.log('xhr.status:', xhr.status);
                    setTimeout(longPolling, 500000);
                },
            });
        }

        $(function () {
            longPolling();
        });
    </script>


</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
    <div class="mypage_sec">
        <div class="mypage_top_sec">
            <div class="mypage_left_profile">
<!--                 <div class="mypage_myprofile"> -->
                    <img src="resources/uploadimg/${vo2.save_name }" width="180" height="180">
                    <br>
<!--                 </div> -->

                <button type="button" id="update_profile"><a href="mypage_update.do">프로필 편집</a></button>
​
            </div>
            <div class="mypage_right_info">
                <ul class="mypage_grid">
                    <li>
                        <h2>이름/아이디</h2>
                        <p>${vo2.name } / ${vo2.user_id }</p>
                    </li>
                    <li>
                        <h2>보유 포인트</h2>
                        <p>${vo2.point }</p>
                    </li>
                    <li>
                        <h2>이메일</h2>
                        <p>${vo2.email }</p>
                    </li>
                    <li>
                        <h2>나의 생일</h2>
                        <p>${vo2.birthday }</p>
                    </li>
                    <li>
                        <a href="Mypage_myactivity_boardbyme.do?user_id=${vo2.user_id}">나의 활동</a>
                    </li>
                    <li>
                        <a href="myfeed_feed_mine.do?user_id=${vo2.user_id}">내 피드 들어가기</a>
                    </li>
​
                </ul>
            </div>
        </div>
        <div class="mypage_center_sec">
           <h2>나의 모임  <a href="som_selectAll.do"> <img src="resources/uploadimg/plus.png" style="width:15px; height:15px;"></a>  </h2>
            <ul id="img_somoim" class="mypage_grid02">
<!--                 <li> -->
<!--                     <div class="mypage_moim_profile"> -->
<!--                         dgdgdg -->
<!-- ​ -->
<!--                     </div> -->
<!--                     <p>카테고리</p> -->
<!-- ​ -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <div class="mypage_moim_profile"> -->
<!--                         <i class="fas fa-plus"></i> -->
<!-- ​ -->
<!--                     </div> -->
<!--                    <a href="som_selectAll.do"><button type="button">새 모임 추가</button></a> -->
<!--                    </li> -->
​
​
            </ul>
        </div>
        <div class="mypage_bottom_sec">
            <h2>
                쪽지함
            </h2>
            <div style=" text-align: right; margin-right: 3%;">
                <button type="button" style="background-color: #5f6368;color: white;" onclick="openPopup()">쪽지 발송</button>
            </div>
            <button type="submit"> </button>
            <ul class="mypage_grid03">
            </ul>
​
        </div>
​
​
    </div>
​
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
​
    </div>
<script>
    function openPopup() {
        const popupName = 'popupWindow';
        const popupWidth = 800;
        const popupHeight = 900;
        const popupLeft = (window.screen.width - popupWidth) / 2;
        const popupTop = (window.screen.height - popupHeight) / 2;
        const popupOptions = `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop},resizable=no,scrollbars=no`;

        const popupWindow = window.open('', popupName, popupOptions);

        const formHTML = `
        <!DOCTYPE html>
        <html>
        <head>
            <title>쪽지</title>
        </head>
        <body>
            <h2>쪽지 발송</h2>
            <form id="myForm" action="popup_message_sedningOK.do" method="post">
                <input type="hidden" name="user_id" value="${user_id}">

                <label for="sender">보내는 사람:</label>
                <input type="text" id="sender" name="sender" readonly value="${user_id}" required><br>
                <label for="receiver">받는 사람:</label>
                <input type="text" id="receiver" name="receiver" required><br>
                <label for="content">내용:</label>
                <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>
                <button type="submit">제출</button>
            </form>

        </body>
        </html>
    `;

        popupWindow.document.write(formHTML);
        popupWindow.document.close();
    }
</script>

<%--<script>--%>
<%--    function openPopup() {--%>
<%--        const popupWidth = 800;--%>
<%--        const popupHeight = 900;--%>
<%--        const popupLeft = (window.innerWidth - popupWidth) / 2;--%>
<%--        const popupTop = (window.innerHeight - popupHeight) / 2;--%>

<%--        const popupContainer = document.createElement('div');--%>
<%--        popupContainer.className = 'popup-container';--%>
<%--        popupContainer.style.display = 'flex';--%>
<%--        popupContainer.style.justifyContent = 'center';--%>
<%--        popupContainer.style.alignItems = 'center';--%>

<%--        const popupContent = document.createElement('div');--%>
<%--        popupContent.className = 'popup-content';--%>
<%--        popupContent.style.width = popupWidth + 'px';--%>
<%--        popupContent.style.height = popupHeight + 'px';--%>
<%--        popupContent.style.backgroundColor = '#fff';--%>
<%--        popupContent.style.padding = '20px';--%>
<%--        popupContent.style.borderRadius = '5px';--%>
<%--        popupContent.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.2)';--%>
<%--        popupContent.style.overflow = 'auto';--%>

<%--        const formHTML = `--%>
<%--                <h2>쪽지 발송</h2>--%>
<%--                <form id="myForm" action="popup_message_sedningOK.do" method="post">--%>
<%--                    <input type="hidden" name="user_id" value="${user_id}">--%>
<%--                    <label for="sender">보내는 사람:</label>--%>
<%--                    <input type="text" id="sender" name="sender" readonly value="${user_id}" required><br>--%>
<%--                    <label for="receiver">받는 사람:</label>--%>
<%--                    <input type="text" id="receiver" name="receiver" required><br>--%>
<%--                    <label for="content">내용:</label>--%>
<%--                    <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>--%>
<%--                    <button type="submit" onclick="closePopup()">제출</button>--%>
<%--                </form>--%>
<%--            `;--%>

<%--        popupContent.innerHTML = formHTML;--%>

<%--        popupContainer.appendChild(popupContent);--%>
<%--        document.body.appendChild(popupContainer);--%>

<%--        // 팝업창 중앙 정렬--%>
<%--        popupContainer.style.position = 'fixed';--%>
<%--        popupContainer.style.top = '0';--%>
<%--        popupContainer.style.left = '0';--%>
<%--        popupContainer.style.width = '100%';--%>
<%--        popupContainer.style.height = '100%';--%>
<%--        popupContainer.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';--%>

<%--        // 스크롤 방지--%>
<%--        document.body.style.overflow = 'hidden';--%>
<%--    }--%>

<%--    function closePopup() {--%>
<%--        const popupContainer = document.querySelector('.popup-container');--%>
<%--        popupContainer.remove();--%>

<%--        // 스크롤 활성화--%>
<%--        document.body.style.overflow = 'auto';--%>
<%--    }--%>

<%--    // Your other existing scripts here--%>

<%--    $(function () {--%>
<%--        longPolling();--%>
<%--    });--%>
<%--</script>--%>


</body>
</html>