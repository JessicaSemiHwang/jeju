<%@page import="com.mbc.jeju.domain.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin/ad_header.jsp" %>	

<!-- msg 띄우는 것 -->
<c:if test="${requestScope.msg != null}">
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>
                                                                                                
	<div class='container mt-5 text-center'>                                                                     
		<h2>회원 리스트</h2><br>                                                                         
		<table class='table'>                                                                        
			<thead class='table-dark'>                                                               
				<tr>                                                                                 
	   				<th>번호</th>
	   				<th>아이디</th>
	   				<th>비밀번호</th>
	   				<th>이름</th>
	   				<th>나이</th>
	   				<th>전화번호</th>
	   				<th>이메일</th>
	   				<!-- <th>참고항목</th> -->
	   				<th>수정</th>
	   				<th>삭제</th>                                                                   
				</tr>                                                                                
			</thead>                                                                                 
			<tbody>                                                                                  

	   			<c:forEach var="dto" items="${requestScope.list}">
	      		<tr>
	      			<th>${dto.no}</th>
	   				<th>${dto.id}</th>
	   				<th>${dto.pw.substring(0,4)}</th>
	   				<th>${dto.name}</th>
	   				<th>${dto.age}</th>
	   				<th>${dto.tel}</th>
	   				<th>${dto.email}</th>

	   				<%-- <th>${dto.plus_addr}</th> --%>
	   				<th><a href="memberInfo.do?no=${dto.no}" class="btn btn-sm btn-info">수정</a></th>
	   				<th><a href="memberDelete.do?no=${dto.no}" class="btn btn-sm btn-danger">삭제</a></th>
	   			</tr>
	   			</c:forEach>

<!--------------------- Ajax 리스트 --------------------->
			<tr>
				<td colspan="12">
					<input type="button" value="Ajax 회원리스트" class="btn btn-secondary btn-sm" onclick="showList()"/>
				</td>
			</tr>
			<tr>
				<td colspan="12" id="ajaxList">
				
				</td>
			</tr>
<!------------------- Ajax 리스트 end ------------------->

				<tr>                                                                                  
					<td colspan='12' class='text-center'><a href='memberRegister.do' class='btn btn-primary'>회원가입</a></td>
				</tr>
			</tbody>                                                                          
		</table>                                                                              
	</div>      
	<script>
		function showList(){
			$.ajax({
				url : "<c:url value='/memberAjaxList.do'/>", // 접속할 요청주소
				type : "get", // 전송방식(get, post)
				dataType : "json", // 서버에서 응답하는 데이터 형식
				success : resultList, // 서버에서 성공적으로 요청이 수행되었을때 호출되는 함수(콜백함수)를 지정
				error : function(){alert("Error")} // 서버에서 요청처리를 실패했을때 처리되는 함수를 지정
			});
		}
		
		function resultList(data){
			console.log(data);
			
			let html= "<table class='table'>";                                                                                     
			    html+="   <thead class='table-dark'>  ";                                                                            
			    html+="     <tr>                      ";
			    html+="       <th>번호</th>           ";                                                                            
			    html+="       <th>아이디</th>         ";                                                                            
			    html+="       <th>비밀번호</th>       ";                                                                            
			    html+="       <th>이름</th>           ";                                                                            
			    html+="       <th>나이</th>           ";                                                                            
			    html+="       <th>전화번호</th>           ";                                                                            
			    html+="       <th>이메일</th>           ";                                                                            
			    html+="     </tr>                     ";                                                                            
			    html+="   </thead>                    ";                                                                            
			    html+="   <tbody>                     ";
		   
		   $.each(data, function(index, obj){
		      html+="<tr>";
		      html+="<td>"+obj.no+"</td>";   
		      html+="<td>"+obj.id+"</td>";   
		      html+="<td>"+obj.pw+"</td>";   
		      html+="<td>"+obj.name+"</td>";   
		      html+="<td>"+obj.age+"</td>";   
		      html+="<td>"+obj.tel+"</td>";   
		      html+="<td>"+obj.email+"</td>";
		      html+="</tr>";
		   }); 
		      html+="</tbody>";
		      html+="</table>";
		     
		      /* 데이터를 집어넣은걸 id=ajaxList 인 jsp에다가 출력해줌 */
		   $("#ajaxList").html(html);
		}
	
		function delMember(no){
			location.href="memberDelete.do?no="+no;
		}
	</script>         
	                                                                     
<%@ include file="../admin/ad_footer.jsp" %>



