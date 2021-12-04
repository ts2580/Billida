<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${contextPath}/resources/css/navbar.css" rel='stylesheet' type='text/css' />
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body id="body-pd">

	<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                	<i class="fas fa-bars nav__toggle navIcons" id="nav-toggle"></i>
                    <a href="/" class="nav__logo">home</a>
                </div>
                <div class="nav__list">
                    <a href="/member/change" class="">
                        <i class="fas fa-user-edit navIcons"></i>
                        <span class="nav_name">회원정보수정</span>
                    </a>
                    <a href="/mileage/mileageInfo" class="">
                        <i class="fas fa-coins navIcons"></i>
                        <span class="nav_name">내 마일리지 정보</span>
                    </a>
                    <a href="/review/myLocker-list" class="">
                        <i class="fas fa-archive navIcons"></i>
                        <span class="nav_name">내가 등록한 사물함</span>
                    </a>
                    <a href="/review/rent-list" class="">
                        <i class="fas fa-door-open navIcons"></i>
                        <span class="nav_name">내가 빌린 사물함</span>
                    </a>
                    <a href="/review/review-list" class="">
                        <i class="fas fa-edit navIcons"></i>
                        <span class="nav_name">내가 작성한 리뷰</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <i class="fas fa-sign-out-alt navIcons"></i>
                    <span class="nav_name">Logout</span>
                </a>
            </div>
        </nav>
    </div>
    
    
    
    
<!--마이페이지에 있던 원본 navbar  -->    

<!--         <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="/" class="nav__logo">home</a>
                </div>
                <div class="nav__list">
                    <a href="/member/mypage" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">회원정보수정</span>
                    </a>
                    <a href="/review/myLocker-list" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 등록한 사물함</span>
                    </a>

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">시벌럼</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="/review/rent-list" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 빌린 사물함</span>
                    </a>

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Team</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Data</a>
                            <a href="#" class="collapse__sublink">Group</a>
                            <a href="#" class="collapse__sublink">Members</a>
                        </ul>
                    </div>

                    <a href="/review/review-list" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">내가 작성한 리뷰</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
            </div>
        </nav>
    </div> -->
    
    
    
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="/resources/js/member/main.js"></script>

<script type="text/javascript">

	$(function(){
	    var url = window.location.href; 
	    $(".nav__list a").each(function() {
	        if(url == (this.href)) { 
	            $(this).closest("a").addClass("active");
	        }
    	});
	});

</script>


</body>
</html>