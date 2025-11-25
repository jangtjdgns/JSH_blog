<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section>
	<h3 class="font-bold text-3xl">게시판 페이지</h3>

	<div>
		<section>
			<c:forEach var="article" items="${articles }">
				<div>${article.id }</div>
				<div>${article.regDate }</div>
				<div>${article.updateDate }</div>
				<div>
					<a href="detail?id=${article.id }">${article.title }</a>
				</div>
				<div class="border-b"></div>
			</c:forEach>

			<a href="write" class="btn">게시글 작성</a>
		</section>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>