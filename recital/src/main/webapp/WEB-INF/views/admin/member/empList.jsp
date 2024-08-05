<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="container-xxl flex-grow-1 container-p-y">
<!-- 	<h4 class="py-3 mb-4" style="font-weight:bold; padding-left:20px;">회원관리</h4> -->
	<div class="row">
		<div class="col-xl-12">
			<div class="card mb-4 bg-white">
				<h5 class="card-header">인원관리 > 직원조회</h5>
				<hr class="my-0">
				<div class="card-body">
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label" for="memberSelect"><font size="4">회원종류</font></label>
						<div class="col-sm-3">
		   					<select class="form-select" id="memberSelect">
		   						<option>학생</option>
		   						<option>교수</option>
		   						<option selected>직원</option>
		   					</select>
	   					</div>
   					
   						<div class="col-sm-6">
		   					<form id="searchForm">				    					
			    				<div class="input-group">		    					
			    					
			   						<input type="hidden" name="page" id="page">
			   						<select class="form-select" id="searchType" name="searchType">
			   							<option value="99">검색옵션 선택</option>
			   							<option value="empNo" <c:if test="${searchType eq 'empNo' }">selected</c:if>>아이디</option>
			   							<option value="empName" <c:if test="${searchType eq 'empName' }">selected</c:if>>이름</option>
			   						</select>
			  							<input type="text" name="searchWord" class="form-control float-right" style="width:40%;" placeholder="Search" value="${searchWord }">
			                           <button type="submit" class="btn btn-primary">
			                              <i class="fas fa-search">검색</i>
			                           </button>
		                       		    					
			   					</div>
							</form>	
						</div>
					</div>
   					
	    			<div class="table-responsive text-nowrap"  style="overflow:hidden;">			
	    				<table class="table table-hover" style="text-align: center;">
	      					<thead>
	        					<tr>
						          	<th width="">아이디</th>
						          	<th width="">부서</th>
						          	<th width="">직위</th>
						          	<th width="">성별</th>
						          	<th width="">이름</th>
						          	<th width="">전화번호</th>
						          	<th width="">입사일</th>
						          	<th width="">재적상태</th>
						          	<th width=""></th>
						     	</tr>
	      					</thead>
	      					<c:set value="${pagingVO.dataList }" var="empList"/>
	      					
	      					<tbody class="table-border-bottom-0" id="tbody">
	      						<c:forEach items="${empList }" var="emp">	      				
	      						
	      							<tr class="subject">
	      								<td class="empNo">${emp.empNo }</td>
	      								<td>
	      									<c:if test="${emp.comDetDNo eq 'D0101' }">행정과</c:if>
	      									<c:if test="${emp.comDetDNo eq 'D0102' }">인사과</c:if>	      								
	      								</td>
	      								<td>
	      									<c:if test="${emp.comDetPNo eq 'P0101' }">과장</c:if>	      									
	      									<c:if test="${emp.comDetPNo eq 'P0102' }">직원</c:if>	      									
	      								</td>
	      								<td>
	      									<c:if test="${emp.comDetGNo eq 'G0101'}">남자</c:if>
	      									<c:if test="${emp.comDetGNo eq 'G0102'}">여자</c:if>
	      								</td>
	      								<td>${emp.empName }</td>
	      								<td>${emp.empPhone }</td>	      								
	      								<td>${emp.empSdate }</td>	      								
	      								<td>
	      									<c:if test="${emp.comDetMNo eq 'M0201'}">재직</c:if>
	      									<c:if test="${emp.comDetMNo eq 'M0202'}">휴가</c:if>
	      									<c:if test="${emp.comDetMNo eq 'M0203'}">퇴사</c:if>
	      								</td>
	      								<td>
											<a class="btn btn-sm btn-secondary" href="/admin/empDetail?empNo=${emp.empNo }">상세보기</a>
										</td>
	      							</tr>
	      						</c:forEach>
	      					</tbody>
	   	 				</table>	   	 				
	  				</div>	  	
	  				<div class="card-footer clearfix" id="pagingArea">
                  		${pagingVO.pagingHTML }
               		</div>			
				</div>
				<div class="card-footer" align="right">
					<!-- 등록 버튼 이 버튼을 통해 일괄등록을 진행하는 페이지...-->
					<button type="button" class="btn btn-primary" id="insertBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	var pagingArea = $("#pagingArea");
	var searchForm = $("#searchForm");
	var memberSelect = $("#memberSelect");
	
	$("#insertBtn").click(function(){
		location.href="/admin/empInsertForm";
	})
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();	// a태그의 href속성 이벤트를 꺼준다.
		var pageNo = $(this).data("page");	// pageNo 전달
		
		// 검색 시 사용할 form태그 안에 넣어준다.
		// 검색 시 사용할 form 태그를 활용해서 검색도하고 페이징 처리도 같이 진행함
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	memberSelect.on("change", function(){
		if($("#memberSelect option:selected").text() == '학생'){
			location.href="/admin/stuList";
			return false;
		}
		if($("#memberSelect option:selected").text() == '교수'){
			location.href="/admin/proList";
			return false;
		}
	});
})

</script>