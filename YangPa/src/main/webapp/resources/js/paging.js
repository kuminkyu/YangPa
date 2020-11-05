	let totCnt;
	let beginPage ,endPage;
	
function paging(totCnt , beginNum , endNum ,typeno) {
	$(".pagination").empty();
	let maxPage ;
	beginPage = beginNum;
	endPage = endNum;
	if(totCnt % 15 > 0){
		maxPage = (totCnt / 15) +  1;
	}else{
		maxPage = totCnt/15;
	}
	
	if(endPage > maxPage) {endPage = maxPage}
	
	if(beginPage > 10){
		$(".pagination").append(
				'<li class="page-item"><a class="page-link movepage" href="#"'
				+'onclick="movepage(0 ,'+typeno+')" id = "prevpage"> 이전 </a></li>'		
		);
	}else{
		$(".pagination").append(
				'<li class="page-item disabled"><a class="page-link" href="#" id = "prevpage"> 이전 </a></li>'		
		);
	}
	
	//리스트 숫자 찍는 for문 부분
	for (let i = beginPage ; i <= endPage  ; i++) {
		if(i == beginPage){
			$(".pagination").append(
					'<li class="page-item active nowpage" id="gbh'+i+'">'
					+'<a class="page-link" onclick="list('+i+','+typeno+');" href="#">'
					+ i +'</a></li>'
			);	
		}else{
			$(".pagination").append(
				'<li class="page-item" id="gbh'+i+'">'
				+'<a class="page-link" onclick="list('+i+','+typeno+');" href="#">'
				+ i +'</a></li>'
			);	
		}	
	}
	
	if(maxPage == endPage){
		$(".pagination").append(
				'<li class="page-item disabled"><a class="page-link" href="#" id = "nextpage"> 다음 </a></li>'		
		);					
	}else{
		$(".pagination").append(
				'<li class="page-item"><a class="page-link" onclick="movepage(1 ,'+typeno+')" href="#" > 다음 </a></li>'		
		);		
	}
}

function movepage(num , typeno) {
	if(num == 0){
		if(endPage % 10 != 0){
			endPage = beginPage + 9;
		}
		paging(totCnt,beginPage-10,endPage-10,typeno);
		list(beginPage,typeno);
	}else{
		paging(totCnt,beginPage+10,endPage+10,typeno);
		list(beginPage,typeno);
	}
}

function list(reqNum,typeno){
	
	$(".nowpage").removeClass('active nowpage');
	$("#gbh"+reqNum).addClass('page-item active nowpage');
	
	$.ajax({
		contentType : "application/json"
		, url : "/yangpa/boardRest/searchAll/"+typeno+"/"+reqNum
		, success : function(data, status) {
			$("tbody").empty();
			$.each(data, function(index, dto){
				if(dto.state == "0"){
					dto.state = "<span class='badge badge-pill badge-success'>판매중</span>";
				}else if(dto.state == "1"){
					dto.state = "<span class='badge badge-pill badge-light'>판매완료</span>";
				}
				if(dto.buy_type == "1"){
					dto.useday = dto.useday + "회";
				}else if(dto.buy_type == "0"){
					dto.useday = dto.useday + "일";
				}else if(dto.useday == undefined){
					dto.useday = "내용참조";
				}
				
				$("tbody").append(
						"<tr class='text-center'>"
						+"<td><b>"+dto.bno+"</b></td>"
						+"<td><b>"+dto.state+"</b></td>"
						+"<td><b>"+dto.addrname+"</b></td>"
						+"<td>"+dto.type+"</td>"
						+"<td>"
						+"<a href='/yangpa/board/detail?bno="
						+dto.bno+"'>"+dto.title+"</a>"
						+"</td>"
						+"<td><b>"+dto.useday+"</b></td>"
						+"<td>"+dto.price+"</td>"
						+"<td>"+dto.write_date+"</td>"
						+"</tr>"
					);//append
				
				
			});//each
		}//function
	});//ajax
}//function list



