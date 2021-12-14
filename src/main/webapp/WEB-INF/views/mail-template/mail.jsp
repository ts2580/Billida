<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>

<html lang="ko" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<title></title>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->
<style type="text/css">
* {
	box-sizing: border-box;
}
a { text-decoration:none } 
body {
	margin: 0;
	padding: 0;
}

/*th.column{
	padding:0
}*/
a[x-apple-data-detectors] {
	color: inherit !important;
	text-decoration: inherit !important;
}

#MessageViewBody a {
	color: inherit;
	text-decoration: none;
}

p {
	line-height: inherit
}

@media ( max-width :720px) {
	.icons-inner {
		text-align: center;
	}
	.icons-inner td {
		margin: 0 auto;
	}
	.row-content {
		width: 100% !important;
	}
	.image_block img.big {
		width: auto !important;
	}
	.mobile_hide {
		display: none;
	}
	.stack .column {
		width: 100%;
		display: block;
	}
	.mobile_hide {
		min-height: 0;
		max-height: 0;
		max-width: 0;
		overflow: hidden;
		font-size: 0px;
	}
}
</style>
</head>
<body style="background-color: #f9f9f9; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
	<table border="0" cellpadding="0" cellspacing="0" class="nl-container"
		role="presentation"
		style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f9f9f9;
		width:100%; display: flex; justify-content: center;">
		<tbody>
			<tr>
				<td>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-1" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<div class="spacer_block"
														style="height: 10px; line-height: 10px; font-size: 1px;">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-2" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<table border="0" cellpadding="0" cellspacing="0"
														class="image_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
														width="100%">
														<tr>
															<td
																style="width: 100%; padding-right: 0px; padding-left: 0px;">
																<div align="center" style="line-height: 10px">
																	<a href="http:/localhost:9090">
																	<img  alt="Alternate text" src="https://www.billida.xyz/resources/images/mailLogo.gif"
																		style="display: block; height: auto; border: 0; width: 154px; max-width: 100%;"
																		title="Alternate text" width="154" />
																	</a>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-3" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<div class="spacer_block"
														style="height: 15px; line-height: 15px; font-size: 1px;">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-4" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 0px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<table border="0" cellpadding="0" cellspacing="0"
														class="image_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
														width="100%">
														<tr>
															<td
																style="width: 100%; padding-right: 0px; padding-left: 0px;">
																<div align="center" style="line-height: 10px">
																	<img alt="Alternate text" class="big"
																		src="https://www.billida.xyz/resources/images/mail/Up_pink.png"
																		style="display: block; height: auto; border: 0; width: 700px; max-width: 100%;"
																		title="Alternate text" width="700" />
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-5" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffd3e0; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 0px; padding-bottom: 0px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<table border="0" cellpadding="0" cellspacing="0"
														class="image_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
														width="100%">
														<tr>
															<td
																style="width: 100%; padding-right: 0px; padding-left: 0px; padding-top: 30px;">
																<div align="center" style="line-height: 10px">
																	<img alt="I'm an image" src="https://www.billida.xyz/resources/images/mail/Welcome_Email.png"
																		style="display: block; height: auto; border: 0; width: 420px; max-width: 100%;"
																		title="I'm an image" width="420" />
																</div>
															</td>
														</tr>
													</table>
													<table border="0" cellpadding="0" cellspacing="0"
														class="text_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
														width="100%">
														<tr>
															<td
																style="padding-bottom: 10px; padding-left: 40px; padding-right: 40px; padding-top: 10px;">
																<div style="font-family: sans-serif">
																	<div
																		style="font-size: 12px; mso-line-height-alt: 18px; color: #191919; line-height: 1.5; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
																		<c:if test="${not empty param.name}">
																		<p
																			style="margin: 0; font-size: 16px; text-align: center;">
																			<strong><span style="font-size: 38px;">Hi
																					${param.name}</span></strong>
																		</p>
																		<p
																			style="margin: 0; font-size: 16px; text-align: center;">
																			<strong><span style="font-size: 38px;">welcome
																					to Billida!</span></strong>
																		</p>
																		</c:if>
																		
																	</div>
																</div>
															</td>
														</tr>
													</table>
													<table border="0" cellpadding="0" cellspacing="0"
														class="text_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;"
														width="100%">
														<tr>
															<td
																style="padding-bottom: 65px; padding-left: 10px; padding-right: 10px; padding-top: 10px;">
																<div style="font-family: sans-serif">
																	<div
																		style="font-size: 12px; mso-line-height-alt: 14.399999999999999px; color: #191919; line-height: 1.2; font-family: Montserrat, Trebuchet MS, Lucida Grande, Lucida Sans Unicode, Lucida Sans, Tahoma, sans-serif;">
																		<c:if test="${not empty param.Id}">
																		<p
																			style="margin: 0; font-size: 14px; text-align: center;">
																			<span style="font-size: 22px;">ID : ${param.Id} </span>
																		</p>
																		</c:if>
																		<c:if test="${not empty param.NewId}">
																		<p
																			style="margin: 0; font-size: 14px; text-align: center;">
																			<span style="font-size: 22px; display: flex; flex-direction: column;">환영합니다. 
																			<br>
																			${param.NewId}님 버튼을 눌러 가입을 완료해주세요!</span>
																			<span style="font-size: 22px;"><a href="https://www.billida.xyz/member/signUpImpl/${param.persistToken}">welcome to bilida!</a></span>
																			
																		</p>
																		</c:if>
																		<c:if test="${not empty param.check}">
																		<p
																			style="margin: 0; font-size: 14px; text-align: center;">
																			<span style="font-size: 22px;"><a href="https://www.billida.xyz/member/findPasswordBy_Email/${param.persistToken}_${param.Id}">비밀번호 재설정</a></span>
																		</p>
																		</c:if>
																	</div>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-6" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff; color: #000000;"
										width="700">
										<tbody>

													</table>
													<table border="0" cellpadding="0" cellspacing="0"
														class="divider_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
														width="100%">
														<tr>
															<td>
																<div align="center">
																	<table border="0" cellpadding="0" cellspacing="0"
																		role="presentation"
																		style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
																		width="5%">
																	</table>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-8" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;" width="100%">
						<tbody>
							<tr>
								<td>

								</td>
							</tr>
						</tbody>
					</table>


					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="row row-13" role="presentation"
						style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; width:100%; display: flex; justify-content: center; background-color: #f9f9f9">
						<tbody>
							<tr>
								<td>
									<table align="center" border="0" cellpadding="0"
										cellspacing="0" class="row-content stack" role="presentation"
										style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000;"
										width="700">
										<tbody>
											<tr>
												<td class="column"
													style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 0px; padding-bottom: 5px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;"
													width="100%">
													<table border="0" cellpadding="0" cellspacing="0"
														class="image_block" role="presentation"
														style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;"
														width="100%">
														<tr>
															<td
																style="width: 100%; padding-right: 0px; padding-left: 0px;">
																<div align="center" style="line-height: 10px">
																	<img alt="Alternate text" class="big"
																		src="https://www.billida.xyz/resources/images/mail/white_down.png"
																		style="display: block; height: auto; border: 0; width: 700px; max-width: 100%;"
																		title="Alternate text" width="700" />
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					
					
	<!-- End -->
</body>
</html>