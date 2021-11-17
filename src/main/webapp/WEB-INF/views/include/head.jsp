<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE HTML>
<html>
   <head>
      <title>Billida</title>
      <link href="../../../resources/css/style.css" rel='stylesheet' type='text/css' />
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
      <meta charset="UTF-8">
	  <link rel="stylesheet" href="${contextPath}/resources/css/all.css">
	  <script type="text/javascript" src="${contextPath}/resources/js/webUtil.js"></script>
	  <script type="text/javascript" src="${contextPath}/resources/js/urlEncoder.js"></script>
      <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
      </script>
      <!----webfonts---->
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
      <!----//webfonts---->
      <!-- Global CSS for the page and tiles -->
      <link rel="stylesheet" href="../../../resources/css/main.css">
        <!-- //Global CSS for the page and tiles -->
      <!---start-click-drop-down-menu----->
      <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <!----start-dropdown--->
         <script type="text/javascript">
         var $ = jQuery.noConflict();
            $(function() {
               $('#activator').click(function(){
                  $('#box').animate({'top':'0px'},500);
               });
               $('#boxclose').click(function(){
               $('#box').animate({'top':'-700px'},500);
               });
            });
            $(document).ready(function(){
            //Hide (Collapse) the toggle containers on load
            $(".toggle_container").hide(); 
            //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
            $(".trigger").click(function(){
               $(this).toggleClass("active").next().slideToggle("slow");
                  return false; //Prevent the browser jump to the link anchor
            });
                           
         });
      </script>
        <!----//End-dropdown--->
      <!---//End-click-drop-down-menu----->
   </head>
   <body>
      <!---start-wrap---->
         <!---start-header---->
         <div class="header">
            <div class="wrap">
            <div class="logo">
               <a href="/"><img src="${contextPath}/resources/images/logo.gif" title="pinbal" /></a>
            </div>
            <div class="nav-icon">
                <a href="#" class="right_bt" id="activator"><span> </span> </a>
            </div>
             <div class="box" id="box">
                <div class="box_content">                                                
                  <div class="box_content_center">
                      <div class="form_content">
                        <div class="menu_box_list">
                           <ul>
                         	  <li><a href="/"><span>HOME</span></a></li>
                              <li><a href="/member/check"><span>마이페이지</span></a></li>
                              <li><a href="#"><span>빌리기</span></a></li>
                              <li><a href="#"><span>빌려주기</span></a></li>
                              <li><a href="#"><span>예약확인</span></a></li>
                              <li><a href="#"><span>문의하기</span></a></li>
                              <div class="clear"> </div>
                           </ul>
                        </div>
                        <a class="boxclose" id="boxclose"> <span> </span></a>
                     </div>                                  
                  </div>    
               </div> 
            </div>            
            <div class="top-searchbar">
               <form action="/search" method="get">
                  <input type="text" name="keyword" required="required" value="${paging.cri.keyword}" placeholder="지역, 사물함명으로 찾아보세요."/>
                  <input class="search_area" type="submit" value="" />
               </form>
            </div>
            <div class="userinfo">
               <div class="user">
                  <ul>
                  <c:if test="${empty authentication}">
                     <li><a href="/member/login"><img src="${contextPath}/resources/images/login.png" style="width: 18%"/></a>
                     <a href="/member/signUp"><img src="${contextPath}/resources/images/signup.png" style="width: 18%"/></a></li>
                  </c:if>
                  
                  <c:if test="${not empty authentication}">
                     <a href="/member/logout">로그아웃</a>
                  </c:if>
                  </ul>
               </div>
            </div>
            <div class="clear"> </div>
         </div>
      </div>
      
      <!----wookmark-scripts---->
        <script src="${contextPath}/resources/js/jquery.imagesloaded.js"></script>
        <script src="${contextPath}/resources/js/jquery.wookmark.js"></script>
        <script type="text/javascript">
          (function ($){
            var $tiles = $('#tiles'),
                $handler = $('li', $tiles),
                $main = $('#main'),
                $window = $(window),
                $document = $(document),
                options = {
                  autoResize: true, // This will auto-update the layout when the browser window is resized.
                  container: $main, // Optional, used for some extra CSS styling
                  offset: 20, // Optional, the distance between grid items
                  itemWidth:280 // Optional, the width of a grid item
                };
            /**
             * Reinitializes the wookmark handler after all images have loaded
             */
            function applyLayout() {
              $tiles.imagesLoaded(function() {
                // Destroy the old handler
                if ($handler.wookmarkInstance) {
                  $handler.wookmarkInstance.clear();
                }
      
                // Create a new layout handler.
                $handler = $('li', $tiles);
                $handler.wookmark(options);
              });
            }
            /**
             * When scrolled all the way to the bottom, add more tiles
             */
/*             function onScroll() {
              // Check if we're within 100 pixels of the bottom edge of the broser window.
              var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
                  closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
      
              if (closeToBottom) {
                // Get the first then items from the grid, clone them, and add them to the bottom of the grid
                var $items = $('li', $tiles),
                    $firstTen = $items.slice(0, 10);
                $tiles.append($firstTen.clone());
      
                applyLayout();
              }
            }; */
      
            // Call the layout function for the first time
            applyLayout();
      
            // Capture scroll event.
            $window.bind('scroll.wookmark', onScroll);
          })(jQuery);
        </script>
      <!----//wookmark-scripts---->
      
      <!---//End-wrap---->
<!--    </body>
</html> -->
