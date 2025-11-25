<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="">
	<h3 class="font-bold text-3xl">게시글 작성 페이지</h3>
	
	<form action="doWrite" method="post" onsubmit="submitForm(this); return false;">
		<div>
			<span>제목</span><br/>
			<input name="title" placeholder="제목을 입력해주세요" type="text">
		</div>
		<div>
			<span>내용</span><br/>
			<textarea name="body" placeholder="내용을 입력해주세요."></textarea>
		</div>
		<div>
			<button>작성</button>
		</div>
	</form>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>