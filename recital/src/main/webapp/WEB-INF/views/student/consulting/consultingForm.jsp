<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="card bg-white">
		<h4 class="card-header">상담 > 상담등록폼</h4>
		
		<hr class="mb-0">
		<div class="card-body">	
			<form action="/student/consultingInsert" method="post" id="insertForm">
			
			<div class="row mb-3">
				<div class="col-md-6">
<!--                 	<div class="card mb-4"> -->
                		<h5 class="card-header">상담등록</h5>
                    	<sec:csrfInput/>
		                <div class="card-body">
		                   	<div class="mb-3 row">		                        
		                       	<label for="conTitle" class="col-md-2 col-form-label">상담명</label>                        
		                       	<div class="col-md-10">                        
		                         	<input class="form-control" type="text" name="conTitle" value="${consultingVO.conTitle }" id="conTitle"/>
		                       	</div>
		                	</div>
		                    <div class="mb-3 row">
		                       	<label for="stuNo" class="col-md-2 col-form-label">학번</label>
		                       	<div class="col-md-10">
		                       		<input readonly="readonly" class="form-control" type="text" name="stuNo" value="${stuVO.stuNo }" id="stuNo"/>
		                       	</div>
		                    </div>
		                    <div class="mb-3 row">
		                      	<label for="stuName" class="col-md-2 col-form-label">이름</label>
		                       	<div class="col-md-10">
		                       		<input class="form-control" type="text" id="stuName" name="stuName" readonly="readonly" value="${stuVO.stuName }"/>
		                       	</div>
		                    </div>
		                    <div class="mb-3 row">		                       	
	                       		<input type="hidden" name="proNo" id="proNo">
	                       		<label for="stuName" class="col-md-2 col-form-label">교수명</label>
                       			<div class="col-md-10">
		                       		<div class="input-group">
			                       		<input class="form-control" type="text" name="proName" id="proName" value="${consultingVO.proName }"/>
			                       		<button class="btn btn-primary" type="button" id="findPro">검색</button>
		                       		</div>
	                       		</div>		                       	
		                    </div>
		                    <div class="mb-3 row">
		                      	<label for="comDetNNo" class="col-md-2 col-form-label">상담구분</label>
		                       	<div class="col-md-10">
		                       		<select name="comDetNNo" id="comDetNNo" class="form-select">
		                       			<c:forEach items="${common }" var="com">
		                       				<option value="${com.comDetNo }">${com.comDetName }</option>
		                       			</c:forEach>
		                       		</select>
		                      	</div>
		                    </div>                        
                     
		                    <div class="mb-3 row">
		                      	<label for="html5-date-input" class="col-md-2 col-form-label">상담일자</label>                        
		                      	<div class="col-md-10">
		                       		<input class="form-control" type="date" name="conDate" value="${consultingVO.conDate }" id="conDate" />
		                       	</div>
		                    </div>
                      
                      		<div class="mb-3 row">
                        		<label for="html5-month-input" class="col-md-2 col-form-label">대면/비대면</label>
                        		<c:if test="${empty consultingVO.conOnoff or consultingVO.conOnoff eq 'Y'}">
	                        		<div class="col-md-10"> 
	                          			<select name="conOnoff" class="form-select" id="conOnoff">
	                          				<option value="Y" <c:if test="${consultingVO.conOnoff eq 'Y' }">selected='selected'</c:if>>대면</option>
	                          				<option value="N" <c:if test="${consultingVO.conOnoff eq 'N' }">selected='selected'</c:if>>비대면</option>
	                          			</select>
	                        		</div>
		                        </c:if>
		                        <c:if test="${consultingVO.conOnoff eq 'N' }">
			                        <div class="col-md-7"> 
	                          			<select name="conOnoff" class="form-select" id="conOnoff">
	                          				<option value="Y" <c:if test="${consultingVO.conOnoff eq 'Y' }">selected='selected'</c:if>>대면</option>
	                          				<option value="N" <c:if test="${consultingVO.conOnoff eq 'N' }">selected='selected'</c:if>>비대면</option>
	                          			</select>
			                        </div>
			                        <div class="col-md-3">
				                        <button style="float:right;" type="button" class="btn btn-primary" id="onlineBtn">화상상담</button>
			                        </div> 
		                        </c:if>
		                        
                      		</div>
                      			                    
                 		</div>						
					</div>
<!-- 				</div> -->
                
				<div class="col-md-6">
					<div class="card-body">						
						<div>
								<sec:csrfInput/>
								<input type="hidden" name="conNo" id="conNo" value="${consultingVO.conNo}">
								<label for="exampleFormControlTextarea1" class="form-label">상담내용</label>
								<textarea class="form-control" id="conContent" rows="8" name="conContent">${consultingVO.conContent}</textarea>
						</div>
						<c:if test="${not empty flag }">
							<div>
		                     	 <label for="exampleFormControlTextarea1" class="form-label">상담결과</label>
		                    	 <textarea class="form-control" readonly="readonly" id="conResult" rows="8" name="conResult">${consultingVO.conResult}</textarea>
	                    	</div>
                    	</c:if>
						<div class="mt-5" align="right">
							<c:if test="${empty consultingVO.comDetSNo or consultingVO.comDetSNo eq 'S0102'  }">                      				
		                    	<c:choose>
			                    	<c:when test="${flag eq 'Y' }">
			                    		<input type="button" id="modifyBtn" class="btn btn-primary" value="수정">
			                    	</c:when>
		                    		<c:otherwise>		                    			
				                    	<input type="button" id="fastBtn" class="btn btn-primary" value="시연용">	                    		
				                    	<input type="button" id="insertBtn" class="btn btn-primary" value="등록">	                    		
		                    		</c:otherwise>
		                    	</c:choose>
		                    </c:if>	
							<input type="button" class="btn btn-primary" id="listBtn" value="목록">
						</div>  
						
					</div>
				</div>					
			</div>
			</form>
		</div>
	</div>
</div>

<!--  교수 검색 모달 -->
<div class="modal fade" id="modalStu" tabindex="-1" aria-hidden="true">
  	<div class="modal-dialog" role="document">
     	<div class="modal-content">
       	<div class="modal-header">
         	<h5 class="modal-title" id="modalProLabel" 
         		style="font-weight:bold;">교수 검색</h5>
               	<button type="button" id="modal3Btn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
            <div class="modal-body">
                <div class="row mb-3">
                  	<div class="col-sm-12">
                    	<label for="searchProName" class="form-label">이름</label>
                    	<input type="text" class="form-control" id="searchstuName" name="stuName">
                    </div>
                   	<div class="col-sm-12 table-responsive text-nowrap">
    					<table class="table table-hover">
      						<thead>
        						<tr>	
					          		<th width="">학번</th>					          	
					          		<th width="">이름</th>
					          		<th width="">전화번호</th>
					     		</tr>
      						</thead>
      						<tbody class="table-border-bottom-0" id="tbody_stu">
      						
      						</tbody>
						</table>
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#fastBtn").click(function(){
		$("#conTitle").val("제가 수업을 잘 이해하고 들을 수 있을까요?");
		$("#proName").val("김민정");
		$("#proNo").val("p22");
		$("#comDetNNo").val("N0102").prop("selected", true);
		$("#conDate").val("2024-06-06");
		$("#conOnoff").val("N").prop("selected", true);
		$("#conContent").html("제가 광고쪽엔 재능이 없어서 잘 들을 수 있을지 걱정이 되네요.");
	});
	
	$("#listBtn").click(function(){
		location.href="/student/consultingList";
	});
	
	// 상담일 이전날자 못고르게 하기
	var now_utc = Date.now(); // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("conDate").setAttribute("min", today);

	
	$("#findPro").click(function(){
		$("#modalStu").modal("show");
	});
	
	$("#modifyBtn").click(function(){
		$("#insertForm").attr("action", "/student/consultingUpdate");
		$("#insertForm").submit();
	});

	$("#searchstuName").on("input", function(){
		if($("#searchstuName").val().trim() == "") return false;
		
		var student = {
				stuName : $("#searchstuName").val()
		}
		$.ajax({
			url:"/student/search",
			type : "post",
			beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(student),
			success : function(res){
				$(".searchStuList").remove();
				var html = "";
				
				$.each(res, function(i, v){
					console.log(i +" >> " + v.proName);
					
					html += "<tr class='searchStuList'>" +
								"<td class='searchStuNo'>"+v.proNo+"</span></td>" +						
								"<td class='searchStuName'>"+v.proName+"</td>" +
								"<td>"+v.proPhone+"</td>" +
							"</tr>";
				});
				
				$("#tbody_stu").append(html);
			}
		});
	});
	
	$(document).on('click', '.searchStuList', function(){		
		var searchStuNo = $(this).find('.searchStuNo').text();
		var searchStuName = $(this).find('.searchStuName').text();
				
		$("#proNo").val(searchStuNo);
		$("#proName").val(searchStuName);
		
		$("#modalStu").click();
		$("#searchStuName").val("");
		$(".searchStuList").remove();
	});
	
	$("#insertBtn").click(function(){
		// 서브밋 하기 전에 유효성검사
		title = $("#conTitle").val();
		proName = $("#proName").val();
		conDate = $("#conDate").val();
		
		if(title == null || title == ""){
			alert("상담명을 입력해주세요..");
			return false;
		}
		
		if(proName == null || proName == ""){
			alert("상담받을 교수를 선택해주세요..");
			return false;
		}
		
		if(conDate == null || conDate == ""){
			alert("상담일을 선택해주세요.");
			return false;
		}
		
		$("#insertForm").submit();
	})
	
	$("#onlineBtn").on('click', function(){
		location.href="/online/onlineConsulting?conNo="+$("#conNo").val();
	});
	
})
</script>















