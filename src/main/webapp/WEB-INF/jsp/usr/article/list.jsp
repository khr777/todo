<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="title" value="단어장" />
<%@ include file="../../part/head.jspf"%>

<style>
.popup {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: fixed;
	display: flex;
	justify-content: center;
	align-items: center;
	display: none;
}

.popup .popup-content-box {
	
}

.popup .popup-content-box .head {
	padding: 10px;
}

.popup .popup-content-box .body {
	padding: 20px;
}

.popup .popup-content-box .btn-close {
	position: relative;
	width: 30px;
	height: 30px;
	margin-left: auto;
}

.popup .popup-content-box .btn-close:hover {
	transform: rotate(5deg);
	cursor: pointer;
}

.popup .popup-content-box .btn-close::before, .popup .popup-content-box .btn-close::after
	{
	content: "1";
	position: absolute;
	background-color: black;
	width: 20%;
	height: 100%;
	top: 0;
	left: 40%;
	transform: rotate(45deg);
}

.popup .popup-content-box .btn-close::after {
	transform: rotate(-45deg);
}

.popup .popup-content-box {
	border: 10px solid black;
	background-color: white;
	width: 500px;
	height: calc(100% - 300px);
}
</style>

<div class="popup">
	<div class="popup-content-box">
		<div class="head">
			<div class="btn-close"></div>
		</div>
		<div class="body"></div>
	</div>
</div>

<div class="list-box con ">
	<div class="btn-box ">
		<button class="btn-1">모두 보기</button>
	</div>
	<div class="list-box-content flex margin-top-40">
		<div class="word-box ">
			<div class="word-box-title">
				<a href="#" class="btn-2">단어 또는 문장</a>
			</div>
			<c:forEach items="${articles}" var="article">
				<div class="word ">${article.word }</div>
			</c:forEach>
		</div>
		<div class="mean-box ">
			<div class="mean-box-title">
				<a href="#" class="btn-3">의미</a>
			</div>
			<c:forEach items="${articles}" var="article">
				<c:set var="orginArticle" value="${article}" />
				<div class="mean ">${article.mean }</div>
			</c:forEach>
		</div>
	</div>
</div>


<style>

/* 리스트 박스 버튼 시작 */
.list-box .btn-box {
	text-align: right;
}

.list-box .btn-box button {
	height: 30px;
	width: 100px;
}

/* 리스트 박스 버튼 끝 */

.list-box {
	margin-top: 120px;
	margin-bottom: 100px;
}
.list-box .list-box-content {
	width: 100%;
}

.list-box .list-box-content .word-box {
	margin-right: 6%;
}

.list-box .list-box-content .word-box, .list-box .list-box-content .mean-box
	{
	width: 47%;
	text-align: center;
}

.list-box .list-box-content .word-box .word-box-title, .list-box .list-box-content .mean-box .mean-box-title
	{
	font-weight: bold;
	border-bottom: 2px solid #afafaf;
	font-size: 1.2rem;
	padding: 10px;
	margin-bottom: 10px;
	padding: 10px;
}

.list-box .list-box-content .word-box .word-box-title:hover>a, .list-box .list-box-content .mean-box .mean-box-title:hover>a
	{
	text-decoration: underline;
	padding: 10px 110px;
}

.list-box .list-box-content .word-box .word {
	font-weight: bold;
}

.list-box .list-box-content .word-box .word, .list-box .list-box-content .mean-box .mean
	{
	height: 25px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>


<script>
	btnClicked(1);
	btnClicked(2);
	btnClicked(3);

	function btnClicked(no) {
		if (no == 1) {
			$('.list-box .btn-' + no).click(
					function() {
						if ($('.list-box .mean').hasClass('remove')
								|| $('.list-box .word').hasClass('remove')) {
							$('.list-box .mean').removeClass('remove');
							$('.list-box .word').removeClass('remove');
						}
					});
		}

		if (no == 2) {
			$('.list-box   .btn-' + no).click(function() {
				$('.list-box .mean').addClass('remove');
				if ($('.list-box .mean').hasClass('remove')) {
					$('.list-box .word').removeClass('remove');
				}
			});
		}

		if (no == 3) {
			$('.list-box  .btn-' + no).click(function() {
				$('.list-box .word').addClass('remove');
				if ($('.list-box .word').hasClass('remove')) {
					$('.list-box .mean').removeClass('remove');
				}
			});
		}

	};
</script>




<%@ include file="../..//part/foot.jspf"%>