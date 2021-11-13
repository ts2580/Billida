<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<div class="content">
	<div class="wrapper">
		<div class="locker_list">
			<c:forEach items="${list}" var="lockerList">
			<a>${lockerList.lockerTitle}</a>
			
				<div class="locker_area">
					<img class="mainImg" src="${lockerList.lockerImage}">
					<div class="locker_name">${lockerList.lockerTitle}</div>
					<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${lockerList.lockerContent}</div>
					<div class="locker_info">
						<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 :~ ${lockerList.rentableDate}</span> 
						<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${lockerList.lockerSize}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	 <!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
 <tr>
        <td colspan = "7" align = "center">
            <c:if test="${paging.curBlock > 1}">
  <a href="#" onclick="list('1')">[처음]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 -->
        
            <c:if test="${paging.curBlock > 1}">
                <a href="#" onclick="list('${paging.prevPage}')">[이전]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 -->
            
            <c:forEach var="num"
                begin="${paging.blockBegin}"
                end="${paging.blockEnd}">
                <c:choose>
                    <c:when test="${num == paging.curPage}">
                    
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
                        <span style="color:red;">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="list('${num}')" >${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            
            <c:if test="${paging.curBlock <= paging.totBlock}">
                <a href="#" onclick="list('${paging.nextPage}')">[다음]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
            
            
            <c:if test="${paging.curPage <= paging.totPage}">
                <a href="#" onclick="list('${paging.totPage}')">[끝]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함-->
            </td>
    </tr>
	
	
	</div>
</div>


<script>
//아래쪽에서 이 함수를 호출해서 페이지값을 컨트롤러에 맵핑시킨다
function list(page){
    console.log("페이지를 이동합니다.");
    location.href="search?curPage="+page;
}
</script>







</body>
</html>