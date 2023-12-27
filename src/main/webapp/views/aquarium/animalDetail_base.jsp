<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

<div id="animalDetailBase">
	<div class="animalImg">
		<div class="mainImgDiv">
			<div class="imgButton"></div>
			<div class="mainImg"></div>
			<div class="imgButton"></div>
		</div>
		<div class="subImgDiv">
			<c:forEach items="${image}" var="item">
				<div class="subImg">
					<img alt="${item.serverFileName}" src="/photo/cocean/animal/${item.serverFileName}" width="30%" height="50%">
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="animalBase">
		<table class="animalTable">
			<colgroup>
				<col style="width:30%">
				<col style="width:70%">
			</colgroup>
			<tr>
				<th>코션친구들코드</th>
				<td>${base.animalCode}</td>
			</tr>
			<tr>
				<th>분류</th>
				<td>${base.taxonomy}</td>
			</tr>
			<tr>
				<th>학명</th>
				<td>${base.scientificName}</td>
			</tr>
			<tr>
				<th>국명</th>
				<td>${base.commonName}</td>
				
			<tr>
				<th>지점</th>
				<td>${base.branchName}</td>
			</tr>
			<tr>
				<th>코션하우스</th>
				<td>${base.tankName}</td>
			</tr>
			<tr>
				<th>마리 수</th>
				<td>${base.individual}</td>
			</tr>
			<tr>
				<th>태어난 날</th>
				<td>${base.birthDate}</td>
			</tr>
			<tr>
				<th>들어온 날</th>
				<td>${base.entryDate}</td>
			</tr>
			<tr>
				<th>세부 정보</th>
				<td>${base.details}</td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>
					<button onclick="inchargeAdd()">담당자 지정</button><br/>
					<c:if test="${empty incharge}">담당자 없음</c:if>
					<c:forEach items="${incharge}" var="ic" >${ic.departmentName} ${ic.name}<br/></c:forEach>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 담당자 지정 모달창 -->
	<div id="inchargeModal">
		<div id="inchargeDiv">
			<div id="oraganizationDiv">
				<c:import url="/animal/organization"/>
			</div>
			<div id="inchargeList">
				<table id="inchargeTable" style="width:100%">
					<colgroup>
						<col style="width:27%">
						<col style="width:27%">
						<col style="width:27%">
						<col style="width:19%">
					</colgroup>
					<tr style="text-align:center">
						<th>본부</th>
						<th>부서</th>
						<th>이름</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${incharge}" var="item">
					<tr>
						<th>${item.hqName}</th>
						<th>${item.departmentName}</th>
						<th>${item.name}</th>
						<th><button onclick="inchargeDel(this,${item.employeeID})">삭제</button></th>
						<th class="inchargeEmployeeID" style="display:none">${item.employeeID}</th>			
					</tr>
					</c:forEach>
				</table>
				<button onclick="inchargeChange()">확인</button>
				<button onclick="inchargeNone()">취소</button>
			</div>
		</div>
	</div>
</div>
<script>
	$('#animalDetailBase').css({'display':'flex'});
	$('.animalImg').css({'width':'50%'});
	$('.mainImg').css({'width':'90%', 'height':'350px'});
	$('.subImgDiv').css({'width':'100%', 'height':'200px'});
	$('.subImg').css({'margin':'1px auto', 'display':'inline'});
	
	$('.animalBase').css({'width':'50%'});
	$('.animalTable').css({'width':'400px'});
	$('#inchargeModal').css({
		'display':'none',
		'position':'fixed',
		'top':'0',
		'left':'0',
		'width':'100%',
		'height':'100%',
		'background-color':'rgba(0, 0, 0, 0.5)',
		'z-index':'3',
	});
	$('#inchargeDiv').css({
		'position':'fixed',
		'display':'flex',
		'border':'1px solid black',
		'width':'700px',
		'height':'500px',
		'top':'20%',
		'left':'30%',
		'background-color':'white',
	});
	$('#oraganizationDiv').css({
		'border':'1px solid black',
		'width':'350px',
		'height':'480px',
		'margin':'10px',
		'padding':'5px'
	});
	$('#jstree').css({
		'height':'435px',
		'overflow-y':'auto'
	});
	$('#inchargeList').css({
		'border':'1px solid black',
		'width':'312px',
		'height':'480px',
		'margin':'10px',
		'padding':'5px'
	});

	
	// 담당자 리스트
	var inchargeList_before = [];
	var inchargeList_after = [];
	<c:forEach items='${incharge}' var='item'>
		inchargeList_before.push('${item.employeeID}');
		inchargeList_after.push('${item.employeeID}');
	</c:forEach>
	
	
	// 조직도 값 가져오기
	function getEmployeeID(emp){
		console.log('get');
		console.log(emp);
		inchargeDraw(emp);
	}
	
	
	/* 담당자 관련 */
	
	// 담당자 모달 표시
	function inchargeAdd(){
		$('#inchargeModal').css({'display':'block'});
	}
	
	// 담당자 그리기
	function inchargeDraw(emp){
		if(inchargeList_after.includes(emp)){
			alert('이미 지정된 담당자입니다.');
		}else{
			$.ajax({
				type:'post',
				url:'employeeInfo',
				data:{'employeeID':emp},
				success:function(data){
					//console.log(data);
					if(data.msg != null){
						alert(data.msg);
					}else{
						var info = data.info
						var con = '<tr><th>'+info.hqName+'</th><th>'+info.departmentName+'</th><th>'+info.name+'</th>';
						con += '<th><button onclick="inchargeDel(this,'+emp+')">삭제</button></th>';
						con += '<th class="inchargeEmployeeID" style="display:none">'+emp+'</th></tr>';
						$('#inchargeTable').append(con);
						inchargeList_after.push(emp);
						console.log(inchargeList_after);
					}
				},
				error:function(e){
					console.log(e);
				}
			});	
		}
	}
	
	// 담당자 삭제
	function inchargeDel(button,emp){
		$(button).closest('tr').remove();
		for(var i = 0; i<inchargeList_after.length; i++){
			if(inchargeList_after[i] == emp){
				inchargeList_after.splice(i,1);
				break;
			}
		}
		console.log(inchargeList_after);
	}
	
	// 담당자 변경
	function inchargeChange(){
		if(inchargeList_after.length == 0){
			alert('담당자가 없습니다.');
		}else{
			console.log(inchargeList_after);
			var data = {};
			data.animalID = '${base.animalID}';
			data.inchargeList_before = inchargeList_before;
			data.inchargeList_after = inchargeList_after;
			console.log(data);
			$.ajax({
				type:'post',
				url:'inchargeChange',
				contentType:'application/json; charset=utf-8',
				data:JSON.stringify(data),
				dataType:'JSON',
				success:function(data){
					alert(data.msg);
					getContents('base');
				},
				error:function(e){console.log(e);}
			});
			//inchargeNone();
		}
	}
	
	// 담당자 모달 숨기기
	function inchargeNone(){
		$('#inchargeModal').css({'display':'none'});
	}
	window.addEventListener('click',function(event) {
		if (event.target === $('#inchargeModal')[0]) {
			inchargeNone();
	    }
	});
</script>

