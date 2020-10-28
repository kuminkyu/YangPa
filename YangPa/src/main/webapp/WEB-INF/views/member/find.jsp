<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>

<title>Bootstrap Example</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 아이디 찾기  -->
                           <script>
                                 $(document).ready(function() {
                                    $("#com").click(function() {
                                       if( $.trim( $("#id").val() ) == "" ){
                                          alert("아이디를 확인해 주세요.");
                                          return;
                                       }else if( $.trim( $("#emi").val() ) == ""){
                                          alert("이메일을 확인해 주세요.");
                                          return;
                                       }
                                       alert("성공");
                                       $("com").submit();
                                    });//click
                                 });//ready
                           
                           <!--비번찾기 -->
                                 $(document).ready(function() {
                                    $("#com2").click(function() {
                                       if( $.trim( $("#id2").val() ) == "" ){
                                          alert("아이디를 확인해 주세요.");
                                          return;
                                       }else if( $.trim( $("#name").val() ) == ""){
                                          alert("이름을 확인해 주세요.");
                                          return;
                                       }else if( $.trim( $("#emi2").val() ) == ""){
                                          alert("이메일을 확인해 주세요.");
                                          return;
                                       }
                                       alert("성공");
                                       $("com2").submit();
                                    });//click
                                 });//ready
                              </script>
<body>

<%@ include file="../header.jsp" %>

   
      <div class="ABA-wrap-box AB-cr ABA-layout-align" id="ABA-column-wrap"
         style="padding: 50px 0 30px 0;">
         
         <div class="ABA-container-box-1080">
            <table width=100% cellpadding=0 cellspacing=0 border=0>
               <tr>
                  <td></td>
                  <td width=650><div id='AB_contents'
                        style="padding: 0 30px; background-color: #ffffff;">
                        <form>
                           <div class="ABA-content-box pageMember"
                              style="padding-bottom: 0;">
                              <div class="container p-3 my-3 border" style="width: 100%;">
                                 <h2 style="text-align: center;">Yang Pa</h2>
                                 <ul class="nav nav-tabs justify-content-center">
                           
                                    <li><a data-toggle="tab" class = "mr-3" href="#home">아이디찾기</a></li>         
                                    <li><a data-toggle="tab" class = "ml-3" href="#menu1">비밀번호찾기</a></li>
                                    
                                 </ul>

                                 <div class="tab-content">
                                    <div id="home" class="tab-pane in active ">
                                       <div
                                          style="font-family: NanumGothic; padding: 30px 20px 20px 20px;">
                                          <div
                                             style="color: #FF3300; letter-spacing: -1px; margin-bottom: 10px;">아이디가
                                             기억나지 않으신가요?</div>
                                          <div style="color: #FF3300; margin-bottom: 30px;">
                                             회원가입시 입력한 <a style = "color:#A9A9A9;">아래의 정보를 입력해주세요.</a>
                                          </div>
                                          <div style="margin-bottom: 20px;">
                                             <div>
                                                <input type="text" id="id"
                                                   style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
                                                   placeholder="아이디" maxlength="50" />
                                             </div>
                                             <div>
                                                <input type="password" id="emi"
                                                   style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
                                                   placeholder="이메일" maxlength="50" />
                                             </div>
                                          </div>
                                          <div>
                                             <div>
                                                <input type="submit" value="입력완료" id="com"
                                                   style="padding: 15px 0; width: 100%; background-color: #FF9900; font-size: 16px; color: #fff" />
                                             </div>

                                          </div>
                                          <div style="text-align: center; padding-top: 16px;">
                                             <div style="color: #a8a8a8; letter-spacing: -0.6px;">가입문의
                                                0507-1412-7235</div>
                                          </div>
                                       </div>
                                    </div>
                                    <div id="menu1" class="tab-pane fade">
                                       <div
                                          style="font-family: NanumGothic; padding: 30px 20px 20px 20px;">
                                          <div
                                             style="color: #FF3300; letter-spacing: -1px; margin-bottom: 10px;">비밀번호가
                                             기억나지 않으신가요?</div>
                                          <div style="color: #FF3300; margin-bottom: 10px;">
                                             회원가입시 입력한 <a style = "color:#A9A9A9;">아래의 정보를 입력해주세요.</a>
                                          </div>
                                          <div style="color: #FF3300; margin-bottom: 30px;">
                                             <a style = "color:#A9A9A9;">비밀번호는</a> 가입시 입력한 이메일로 발송 <a style = "color:#A9A9A9;">됩니다.</a>
                                          </div>
                                          <div style="margin-bottom: 20px;">
                                             <div>
                                                <input type="text" id="id2"
                                                   style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
                                                   placeholder="아이디" maxlength="50" />
                                             </div>
                                             <div>
                                                <input type="text" id="name"
                                                   style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
                                                   placeholder="이름" maxlength="50" />
                                             </div>
                                             <div >
                                                <input type="password" id="emi2" 
                                                   style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
                                                   placeholder="이메일" maxlength="50" />
                                             </div>
                                          </div>
                                          <div style="text-align: center; padding-bottom: 10px">
                                             <a>가입시 입력한 이메일로 조회 바랍니다.</a>
                                          </div>
                                          <div>
                                             <div>
                                                <input type="submit" value="입력완료"  id="com2"
                                                   style="padding: 15px 0; width: 100%; background-color: #FF9900; font-size: 16px; color: #fff"
                                                   tabindex="3" />
                                             </div>
                                          </div>
                                          <div style="text-align: center; padding-top: 16px;">
                                             <div style="color: #a8a8a8; letter-spacing: -0.6px;">가입문의
                                                0507-1412-7235</div>
                                          </div>
                                       </div>

                                    </div>

                                 </div>
                              </div>

                           </div>
                           
                        </form>
                     </div></td>
                  <td></td>
               </tr>
               
               
               
            </table>
         </div>
      </div>
</body>
</html>