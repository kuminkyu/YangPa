$(document).ready(function() {
	
	$(".tablesearch").click(function() {
		$(".board-title").empty();
		let typeno = $(this).text();
		switch (typeno){
	      case "운동" :
	    	  typeno = 1;
				$(".board-title").append(
					"<i class='fas fa-dumbbell mr-2'></i>"  
					+"<span style='color: red' class='mr-2'>"
					+ "운동</span>판매목록"		
				);
	          break;
	      case "여행" :
	    	  typeno = 2;
				$(".board-title").append(
					"<i class='fas fa-umbrella-beach mr-2'></i>"
					+"<span style='color: blue' class='mr-2'>"
					+"여행</span>판매목록"		
				);
	          break;
	      case "티켓" :
	    	  typeno = 3;
				$(".board-title").append(
					"<i class='fas fa-ticket-alt mr-2'></i>"
					+"<span style='color: brown' class='mr-2'>티켓</span>판매목록"		
				);
	          break;
	      case "기타" :
	    	  typeno = 4;
				$(".board-title").append(
					"<i class='fas fa-plus mr-2'></i>"	
					+"<span style='color: gray' class='mr-2'>기타</span>판매목록"		
				);
	          break;
	      case "전체" :
	    	  typeno = 0;
				$(".board-title").append(
					"<i class='fas fa-seedling mr-2'></i>"	
					+"<span style='color: green' class='mr-2'>양파</span>판매목록"		
				);
	          break;
	      default :
	    	  alert("리스트 로딩중 오류 다시 시도해 주십시요");
	    }
		
		$.ajax({
			contentType : "application/json"
			, url : "${root}/boardRest/searchAll/"+typeno
			, success : function(data, status) {
				$("tbody").empty();
				$.each(data, function(index, dto){
					if(dto.state == "0"){
						dto.state = "<span class='badge badge-pill badge-success'>판매중</span>";
					}else if(dto.state == "1"){
						dto.state = "<span class='badge badge-pill badge-light'>판매완료</span>";
					}
					$("tbody").append(
							"<tr class='text-center'>"
							+"<td><b>"+dto.state+"</b></td>"
							+"<td><b>"+dto.addrname+"</b></td>"
							+"<td>"+dto.type+"</td>"
							+"<td>"
							+"<a href='${pageContext.request.contextPath}/free/detail?bno="
							+dto.bno+"'>"+dto.title+"</a>"
							+"</td>"
							+"<td>"+dto.useday+"</td>"
							+"<td>"+dto.price+"</td>"
							+"<td>"+dto.write_date+"</td>"
							+"</tr>"
						);
				});
			}
		});
	});
	
});