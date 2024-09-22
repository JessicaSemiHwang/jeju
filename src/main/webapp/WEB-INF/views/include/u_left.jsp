<%-- <%@page import="java.util.ArrayList"%> --%>
<%-- <%@page import="util.ProdSpec"%>
<%@page import="model.CategoryDTO"%>
<%@page import="model.CategoryDAO"%>
<%@page import="model.BrandDAO"%>
<%@page import="model.BrandDTO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	li>a{
		color:grey;
	}
	li>a:hover{
		color:#ff80ff;
	}
</style>

<!-- 카테고리 -->
<!-- <aside class="sub_menu border-end sticky-top" style="width:250px"> -->
<aside class="sub_menu border-end" style="width:250px">

	<h6>카테고리</h6>
		<ul>
			<c:if test="${categorylist.size() != 0}">
				<c:forEach var="dto" items="${categorylist}">
					 <li><a href="UcatList.do?cat_num=${dto.cat_num}&code=${dto.code}&cat_name=${dto.cat_name}">${dto.cat_name}</a></li>
			   	</c:forEach>
			</c:if>
			<c:if test="${clist.size() == 0}">
				<li>카테고리 없음</li>
			</c:if>
		</ul>
	<ul class='mt-3'><br></ul>
	
	<!-- <h4>스펙별 상품</h4> -->
	<div class="d-flex">
		<h6>베스트</h6>&nbsp;<h6><span class="badge bg-dark mt-1">HOT</span></h6>
	</div>
		<ul>
			<c:forEach var="spec" items="${pdSpecs}">
				<li>
					<a href="UspecList.do?pSpec=${spec.name()}">${spec.value}상품</a>
                </li>									
          	</c:forEach>
		</ul>
	
	<ul class='mt-3'><br></ul>
	<ul class='mt-3'><br></ul>

	<h6>고객센터</h6>
	<ul>
		<li><a href="boardList.do">공지사항</a></li>
		<li><a href="boardList.do">FAQ</a></li>
		<li><a href="boardList.do">1:1 문의</a></li>
		<li><a href="boardList.do">매장안내</a></li>
	</ul>
</aside>

