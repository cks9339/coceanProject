<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">

<title>Cocean</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 담당자 지정 jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<style>
	
	 .detailBar { 
	    width: 100%;
	    height: 60px;
	    left: 130px;
	 	background-color: #86B0F3; 
	 	display: flex; 
		
	 	justify-content: space-evenly; 
	 } 
	 .detailBar div{ 
		
	 	width: 100%; 
	 	height: 100%; 
	 	position: relative; 
	 	text-align: center; 
	 	font-size: 21px; 
	 	padding-top: 14px; 
	 	cursor: default; 
	 } 
	
	.imgChange{
		width: 100%;
		z-index: 1;
	}
	.imgChange:hover{
		cursor: pointer;
	}
	

</style>
</head>

<body>

<c:import url="/side"/>
	<div class="container-fluid contentField">
		
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">코션친구들</h1>
		</div>
		
		<div class="col-12 mx-auto">
			<div id="animalTitle" class="mb-2">
				<span id="animalStatus" class="badge mr-1" style="font-size: 1.4rem">${title.status}</span>
				<span style="font-size: 1.8rem; font-weight: 600">${title.nickname}</span>
				<span style="font-size: 1.3rem">&nbsp${title.commonName}-${title.animalCode} </span>
			</div>
			<div class="detailBar">
				<div class="detailBar_item" id="base" onclick="detailPage('base')">친구들 정보</div>
				<div class="detailBar_item" id="log" onclick="detailPage('log')">친구들 기록</div>
				<div class="detailBar_item" id="plan" onclick="detailPage('plan')">관리 계획</div>
			</div>
			
			<br/>
			
			<div class="row">
			
				<div class="col-md-6">
					<div class="card shadow pt-4 p-2 mx-2">
						<div class="row">
						
							<div class="imgChange col-md-1 mb-2 pr-0" onclick="imgChange(-1)">
								<div class="d-flex align-items-center text-center" style="height: 100%;">
									<img alt="#" src="<c:url value='/resource/img/carrot-side2.png'/>" width="100%">
								</div>
							</div>
							<div class="col-md-10 mb-2 text-center">
								<div style="height:100%; width:100%; margin:0 auto; ">
									<img class="img-fluid img-thumbnail" id="mainPic" alt="#" src="#" style="max-height: 500px; min-height: 100%;min-width: 80%;">
								</div>
							</div>
							<div class="imgChange col-md-1 mb-2 pl-0" onclick="imgChange(1)">
								<div class="d-flex align-items-center text-center" style="height: 100%;">
									<img alt="#" src="<c:url value='/resource/img/carrot-side2.png'/>" width="100%" style="transform:rotate(180deg)">
								</div>
							</div>
							
							<div class="col-md-4 mb-2 pl-4">
								<div class="animalImg">
									<img class="img-fluid img-thumbnail" alt="#" src="<c:url value='/resource/img/no_image.png'/>">
								</div>
							</div>
							<div class="col-md-4 mb-2">
								<div class="animalImg text-center">
									<img class="img-fluid img-thumbnail" alt="#" src="<c:url value='/resource/img/no_image.png'/>">
								</div>
							</div>
							<div class="col-md-4 mb-2 pr-4">
								<div class="animalImg text-center">
									<img class="img-fluid img-thumbnail" alt="#" src="<c:url value='/resource/img/no_image.png'/>">
								</div>
							</div>
						</div>
					</div>	
				</div>
				
				<div class="col-md-6">
					<div class="card shadow pt-4 p-2 mx-2">
						<table class="animalTable table table-bordered">
							<tr>
								<th class="text-center" scope="col">코션친구들 코드</th>
								<td>${base.animalCode}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">분류</th>
								<td>${base.taxonomy}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">학명</th>
								<td>${base.scientificName}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">국명</th>
								<td>${base.commonName}</td>
							<tr>
								<th class="text-center" scope="col">지점</th>
								<td>${base.branchName}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">코션하우스</th>
								<td>${base.tankName} 
									<a href="<c:url value='/tank/detail.go?tankID=${base.tankID}'/>">
										<button class="btn btn-outline-primary btn-sm ml-2">하우스 이동</button>
									</a>
								</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">마리 수</th>
								<td>${base.individual}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">태어난 날</th>
								<td>${base.birthDate}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">들어온 날</th>
								<td>${base.entryDate}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">세부 정보</th>
								<td class="splitCon">${base.details}</td>
							</tr>
							<tr>
								<th class="text-center" scope="col">
									<p>담당자</p>
									<c:if test="${(userInfo.departmentName eq '사육팀' or userInfo.departmentName eq '질병관리팀') and (userInfo.positionID eq 2)}">
										<button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#inchargeModal">담당자 지정</button>
									</c:if>
								</th>
								<td>
									<c:if test="${empty incharge}">담당자 없음</c:if>
									<c:forEach items="${incharge}" var="ic">
										<p>${ic.departmentName} ${ic.name}</p>
									</c:forEach>
								</td>
							</tr>
						</table>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-secondary mr-2 mb-2" onclick="animaList()">이전</button>
							<c:forEach items="${incharge}" var="item">
								<c:if test="${item.employeeID eq userInfo.employeeID}">
									<button class="btn btn-primary mr-2 mb-2" onclick="animalUpdate(${base.animalID})">수정</button>
								</c:if>
							</c:forEach>
							<c:if test="${(userInfo.departmentName eq '사육팀' or userInfo.departmentName eq '질병관리팀') and (userInfo.positionID eq 2)}">
								<button class="btn btn-primary mr-2 mb-2" onclick="animalDel(${base.animalID})">삭제</button>
							</c:if>
							
						</div>
					</div>
				</div>
				
			</div>
	

		</div>
	</div>
	<!-- 담당자 지정 모달창 -->
	<!-- 버튼 클릭 시 열리는 모달창 -->
	<div class="modal fade" id="inchargeModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">코션친구들 담당자 지정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-6" style="border-right:1px solid #EDEDED">
							<div id="oraganizationDiv">
								<c:import url="/personnel/organization/1"/>
							</div>
						</div>
	
						<div class="col-md-6">
							<div id="inchargeList">
								<table class="table table-hove" id="inchargeTable" style="width: 100%; text-align: center">
									<colgroup>
										<col style="width: 30%">
										<col style="width: 30%">
										<col style="width: 30%">
										<col style="width: 10%">
									</colgroup>
									<tr style="text-align: center; background-color: #86B0F3">
										<th>본부</th>
										<th>부서</th>
										<th>이름</th>
										<th></th>
									</tr>
									<c:forEach items="${incharge}" var="item">
										<tr>
											<th>${item.hqName}</th>
											<th>${item.departmentName}</th>
											<th>${item.name}</th>
											<th>
												<button	class="close" onclick="inchargeDel(this,${item.employeeID})">
													<span aria-hidden="true">&times;</span>
												</button>
											</th>
											<th class="inchargeEmployeeID" style="display: none">${item.employeeID}</th>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="inchargeChange()">저장</button>
				</div>

			</div>
		</div>
	</div>
	<c:import url="/footer"></c:import>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}
	
	var category = 'base';
	
	$('.detailBar').find('#'+category).css({'color':'#FFFFFF'});
	
	
	$('.detailBar_item').hover(
		function(){
			if($(this).attr('id') != category){
				$(this).css({'cursor':'pointer','background-color':'#2F80ED'});
			}
		},
		function(){
			if($(this).attr('id') != category){
				$(this).css({'background-color':'#86B0F3'});
			}
		}
	);
	
	
	
	
	function detailPage(c){
		var month = getMonth();
		var rink;
		if(c == 'base'){
			rink = 'detailBase?animalID=${base.animalID}';
		}else{
			rink = 'detailLogPlan?animalID=${base.animalID}&category='+c+'&month='+month;
		}
		console.log(rink);
		location.href=rink;
	}
	
	
	function getMonth(){
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
		return year + '-' + month;
	}
	
	$('#jstree').css({
		'height':'435px',
		'overflow-y':'auto'
	});
	
	$('.animalImg').css({'width':'100%','height':'100%','margin':'0 auto'});
	$('.animalImg').find('img').css({'width':'100%','height':'100%'});
	
	
	
	// 이미지 리스트
	var imgList = [];
	<c:forEach items='${image}' var='item'>
	imgList.push('${item.serverFileName}');
	</c:forEach>
	var length = imgList.length;
	var num = 0;
	drawImg(num);
	
	// 이미지 그려주기
	function imgChange(val){
		num = numCalc(num, val);
		drawImg(num);
	}
	
	function numCalc(index, val){
		index += val;
		if(index == -1){
			index = length - 1;
		}
		if(index == length){
			index = 0;
		}
		return index;
	}
	
	function drawImg(num){
		if(length != 0){
			$('#mainPic').attr('alt',imgList[num]);
			$('#mainPic').attr('src','/photo/cocean/animal/'+imgList[num]);	
		}
		if(length > 1){
			var index = num;
			for(var i = 0; i <3; i++){
				index = numCalc(index, 1);
				var $selector = $('.animalImg').eq(i).find('img');
				$selector.attr('alt',imgList[index]);
				$selector.attr('src','/photo/cocean/animal/'+imgList[index]);
			}
		}
	}
	
	// 담당자 리스트
	var inchargeList_before = [];
	var inchargeList_after = [];
	<c:forEach items='${incharge}' var='item'>
		inchargeList_before.push('${item.employeeID}');
		inchargeList_after.push('${item.employeeID}');
	</c:forEach>
	

	/* 담당자 관련 */
	
	// 조직도 값 가져오기
	function getEmployeeID(emp,node){
		console.log('get');
		console.log('emp : '+emp);
		console.log('node : '+node);
		inchargeDraw(emp);
	}
	
	// 담당자 그리기
	function inchargeDraw(emp){
		if(inchargeList_after.includes(emp)){
			swal({
				title :'이미 지정된 담당자입니다.',
				button : '확인' 
			});
		}else{
			$.ajax({
				type:'post',
				url:'employeeInfo',
				data:{'employeeID':emp},
				success:function(data){
					//console.log(data);
					if(data.msg != null){
						swal({
							title:data.msg,
							button:'확인'
						});
					}else{
						var info = data.info
						var con = '<tr><th>'+info.hqName+'</th><th>'+info.departmentName+'</th><th>'+info.name+'</th>';
						con += '<th><button class="close" onclick="inchargeDel(this,'+emp+')"><span aria-hidden="true">&times;</span></button></th>';
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
			swal({
				title: "담당자를 추가해주세요.",
				button: "확인"
			});
		}else{
			swal({
				title: "담당자를 변경하시겠습니까?",
				icon:'info',
				buttons:['취소','확인']
			}).then((isOkey) => {
				if(isOkey){
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
							swal({
								title: data.msg,
								button: "확인"
							}).then((isOkey) => {
								if(isOkey){
// 									console.log('aaaa');
// 									$("#inchargeModal").modal('hide');
// 									$('.modal-backdrop').remove();
// 									getContents('base');
									location.href = location.href;
								}
							});
						},
						error:function(e){console.log(e);}
					});
				}
			});
		}
	}
	
	
	function animaList(){
		location.href = "list.go"
	}
	
	
	function animalUpdate(animalID){
		swal({
			title:'수정하시겠습니까?',
			icon:'info',
			buttons:['취소','수정']
		}).then((isOkey) => {
			if(isOkey){
				location.href= "update.go?animalID="+animalID;
			}
		});
	}
	
	function animalDel(animalID){
		swal({
			title:'삭제하시겠습니까?',
			icon:'error',
			buttons:['취소','삭제']
		}).then((isOkey) => {
			if(isOkey){
				location.href= "delete.do?animalID="+animalID;
			}
		});
	}
	
	
	function split(){
		$('.splitCon').each(function(con){
			var c = $(this).html();
			var s = c.replace(/\n/g, '<br>');
			$(this).html(s);
		});
	}
	split();
	
	var animalStatus = $('#animalStatus').html();
	if(animalStatus == '정상'){
		$('#animalStatus').addClass('badge-success');
	}else if(animalStatus == '질병'){
		$('#animalStatus').addClass('badge-warning');
	}else if(animalStatus == '격리'){
		$('#animalStatus').addClass('badge-danger');
	}else if(animalStatus == '폐사'){
		$('#animalStatus').addClass('badge-dark');
	}

	
	
</script>
</html>
