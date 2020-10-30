$(document).ready(function() {
   let in_bunryu;
   let in_kind;
   //유형별로 판매 정보를 바꿈
   $("#in_kind").change(function() {
      in_bunryu = $("#in_kind").val();
      
      //이 부분은 유형을 새로 선택시 그에 맞응 세부유형을 가져오는곳
      $.get(
            "boardRest/getOption"
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
      
      //이 부분은 유형을 선택시 새로운 판매 양식을 띄우는 곳
      $("#sell_info").empty();
      switch (in_bunryu){
         case "1" :
            in_bunryu = 1;
            in_kind = $("input:radio[name='in_kind']:checked").val();
              $("#sell_info").append(
                  '<div class="form-inline mt-1 mb-1 ml-3">'
                  +'<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매타입 : </b></h6></label>'
                  +'<label><input type="radio" name="ex_kind" checked value="0">기간제</label>'
                  +'<label><input type="radio" name="ex_kind" class="ml-2" value="1">횟수제</label></div>'
               +'<div class="form-inline mt-1 mb-1 ml-3">'
               +   '<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매금액 : </b>'
               +   '</h6></label> <input class="form-control col-6 mr-1" type="text"> 원</div>'
               +'<div class="form-inline mt-1 mb-1 ml-3">'
               +'<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>잔여기간 : </b>'
               +'</h6></label> <input class="form-control col-4" type="text"> 월/회</div>'
            );
             break;
         case "2" :
            in_bunryu = 2;
              $("#sell_info").append(
               '<div class="form-inline mt-1 mb-1 ml-3">'
               +   '<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매금액 : </b>'
               +   '</h6></label> <input class="form-control col-6 mr-1" type="text"> 원</div>'
               +'<div class="form-inline mt-1 mb-1 ml-3">'
               +'<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>체크인 날짜 : </b>'
               +'</h6></label> <input class="form-control col-4" type="text"> ex)2020-12-12</div>'
            );
             break;
         case "3" :
             in_bunryu = 3;
              $("#sell_info").append(
                  '<div class="form-inline mt-1 mb-1 ml-3">'
                  +   '<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매금액 : </b>'
                  +   '</h6></label> <input class="form-control col-6 mr-1" type="text"> 원</div>'
                  +'<div class="form-inline mt-1 mb-1 ml-3">'
                  +'<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>사용 날짜 : </b>'
                  +'</h6></label> <input class="form-control col-4" type="text"> ex)2020-12-12</div>'
               );
             break;
         default :
            in_bunryu = 4;
           $("#sell_info").append(
               '<div class="form-inline mt-1 mb-1 ml-3">'
               +   '<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매금액 : </b>'
               +   '</h6></label> <input class="form-control col-6 mr-1" type="text"> 원</div>'
         );
       }
   });//유형별로 판매 정보를 바꿈
   
   $("#insert_button").click(function() {
      
   });
});