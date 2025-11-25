<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section>
	<h3 class="font-bold text-3xl">${article.id }번 게시판 상세보기 페이지</h3>

	<textarea id="body" class="hidden">${article.body }</textarea>
	<div>${article.id }</div>
	<div>${article.regDate }</div>
	<div>${article.updateDate }</div>
	<div>${article.title }</div>
	<div>${article.body }</div>
	
	<div>
		<a href="doDelete?id=${article.id }" class="btn">삭제</a>
		<a href="modify?id=${article.id }" class="btn">수정</a>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>