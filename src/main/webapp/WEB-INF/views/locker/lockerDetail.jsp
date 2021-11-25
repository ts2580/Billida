<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/resources/css/lockerForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">

</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg"">
	</div>
	<div class="billigi">
		<div class="title">빌려주기</div>
		<div class="contents">
			
			<div class="outline">
				<p class="price-and-time">
                	<span class="price">3,000원</span>
                	<span class="time">~/일</span>
           		</p>
				<form:form action="/locker/lockerMain" method="post" id="locker" class="rental-contents">
					<table>
						<tr>
							<td>택배함 이름</td>
							<td>
								<form action="locker_title" method="post">
								<input style="width: 260px" type="text" id="locker_title" class="locker_title" placeholder="택배함 이름을 입력하세요.">
								</form>
							</td>
						</tr>
						<tr>
							<td>택배함 비밀번호</td>
							<td>
								<form action="locker_password" method="post" id="locker_password">
								<input style="width: 260px" type="password" class="locker_password" placeholder="택배함 비밀번호를 입력하세요">
								</form>
							</td>
						</tr>
						<tr>
							<td>택배함 위치</td>
							<td>
								<form action="location" method="post" id="location">
								<input style="width: 215px" type="text" class="location" placeholder="주소를 입력하세요."><button>입력</button>
								</form>
							</td>
						</tr>
						<tr>
							<td>택배함 상세위치</td>
							<td>
								<form action="locker_content" method="post" id="locker_content">
								<input style="width: 260px" type="text" class="locker_content" placeholder="예)00아파트 지하주차장 101번 택배함">
								</form>
							</td>
						</tr>
						<tr>
							<td class="locker-contents-title">사이즈</td>
							<td>
								<form action="locker_size" method="post">
								<select name="chooseSize">
									<option value="Small">Small</option>
									<option value="Medium">Medium</option>
									<option value="Large">Large</option>
									<option value="XLarge">XLarge</option>
								</select>
								</form>
							</td>
						</tr>
						<tr>
							<td class="locker-contents-title">이미지</td>
							<td>
								<form action="locker_image" method="post" enctype="multipart/form-data">
									<input type="file" name="files" id="locker_image" class="upload-box upload-plus" accept="image/*">
									<div id="preview" style="max-width: 100px"></div>
										<div class="file-edit-icon">
											<a href="#" class="preview-edit">수정</a>
											<a href="#" class="preview-de">삭제</a>
										</div>
								</form>	
							</td>
						</tr>
						<tr>
							<td class="locker-contents-title">대여 시작일</td>
							<td style="text-align: center;">
								<input style="width: 200px" type="date" name="rentable_date_start" value="${locker.rentable_date_start}" />
							</td>
						</tr>
						<tr>
							<td class="locker-contents-title">대여 종료일</td>
							<td style="text-align: center;">
								<input style="width: 200px" type="date" name="rentable_date_end" value="${locker.rentable_date_end}" />
							</td>
						</tr>
						<tr>
							<td class="locker-contents-title">이익금</td>
							<td>
								<input style="width: 260px" type="number" name="profit" placeholder="자동계산됩니다."/>
							</td>
						</tr>
						<tr>
							<td style="text-align: center;">
								<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">사이즈 정보</button>
								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">
	    
									<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">사이즈 정보</h4>
											</div>
											<div class="modal-body">
												<p>(가로, 세로, 높이 단위 = CM)</p>
												<p>Small : 27,18,15=60</p>
												<p>Medium : 34,25,21=80</p>
												<p>Large : 41,31,28=100</p>
												<p>XLarge : 48,38,34 =120</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td style="text-align: center;"><input type="submit" value="빌려주기" /></td>
						</tr>
						
						
					</table>
				</form:form>
			</div>
			<div>
				<iframe style="padding: 0 30px;" width= "1000px" height = "500px" src="/locker/lockerList" class="lockerListForm">
				</iframe>
			</div>
		</div>


	</div>
	
	<script type="text/javascript">
	console.log()
	function handleFileSelect(event) {
	    var input = this;
	    console.log(input.files)
	    if (input.files && input.files.length) {
	        var reader = new FileReader();
	        this.enabled = false
	        reader.onload = (function (e) {
	        console.log(e)
	            $("#preview").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
	        });
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#locker_image').change(handleFileSelect);
	$('.file-edit-icon').on('click', '.preview-de', function () {
	    $("#preview").empty()
	    $("#locker_image").val("");
	});
	$('.preview-edit').click( function() {
	  $("#locker_image").click();
	} );
	</script>

</body>
</html>