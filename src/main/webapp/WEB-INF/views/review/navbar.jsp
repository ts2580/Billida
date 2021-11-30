<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${contextPath}/resources/css/reviewCss/navbar.css" rel='stylesheet' type='text/css' />
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body id="body-pd">

	<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/" class="nav__logo">home</a>
                </div>
                <div class="nav__list">
                    <a href="/member/mypage" class="">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">회원정보수정</span>
                    </a>
                    <a href="/review/myLocker-list" class="">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 등록한 사물함</span>
                    </a>
                    <a href="/review/rent-list" class="">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 빌린 사물함</span>
                    </a>
                    <a href="/review/review-list" class="">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 작성한 리뷰</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Logout</span>
                </a>
            </div>
        </nav>
    </div>
    
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="/resources/js/member/main.js"></script>

<script type="text/javascript">

	var selectedMenu = 'common_div';
	
	window.addEventListener('DOMContentLoaded', e=>{
	   document.querySelectorAll(".nav__list>a").forEach(e => {
	      if(e.dataset.loc == selectedMenu) {
	         e.classList[1] = 'active' 
	         e.className = 'active';
	      }
	   });
	})

</script>


</body>
</html>