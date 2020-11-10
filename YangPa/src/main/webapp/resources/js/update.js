
$(document).ready(function() {
	let in_bunryu;
	let in_kind;
	//유형별로 판매 정보를 바꿈
	$("#in_kind").change(function() {
		in_bunryu = $("#in_kind").val();
		
		//이 부분은 유형을 새로 선택시 그에 맞응 세부유형을 가져오는곳
		$.get(
				"../boardRest/getOption"
				,{ typeno : in_bunryu }
				,function(data , status){
					$("#in_kind_option").empty();
					$("#in_kind_option").append(
					 '<option value="0" class="">세부유형</option>'	
					);
					$.each(data , function(index , dto) {
						$("#in_kind_option").append(
								"<option value='"+dto.option_code+"'>"
								+ dto.option_name
								+ "</option>"	
						);
					});
				}
			);
		
		if(in_bunryu == "1"){
			$("#in_ex_kind").css("display","block");
			$("#limitdate").show();
			$("#useday").hide();
		}else if(in_bunryu == "4"){
			$("#limitdate").hide();
			$("#useday").hide();
			$("#in_ex_kind").hide();
		}else{
			$("#limitdate").hide();
			$("#useday").show();
			$("#in_ex_kind").hide();
		}
		
		
	});//유형별로 판매 정보를 바꿈
	
   $(function() {
       //모든 datepicker에 대한 공통 옵션 설정
       $.datepicker.setDefaults({
           dateFormat: 'yy-mm-dd' //Input Display Format 변경
           ,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:false//년도 먼저 나오고, 뒤에 월 표시
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
           ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
           ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
           ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
           ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+3Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
       });

       //input을 datepicker로 선언
       $("#in_datepicker").datepicker();                    
       
   });//datepicker
});