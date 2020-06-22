<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	 /* ----------공통설정---------- */
        /* 전체설정 */
        html, body{
            margin: 0px;
            padding: 0px;
            /* background: palevioletred; */
        }
        body *{
            font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none;
        }

        #notiSection{
            text-align: center;
            position: relative;
        }
         /* 인풋태그,드롭박스,textarea 버튼제외 테두리 */
         #notiSection input, #notiSection select,#notiSection textarea{
            border:1px solid #b3a193;
        }
        /* ----------고객센터 공통 상단 -----------*/
        #Backarea{
                width: 100%;
                height: 260px;
                background: #d2c4b9;
                text-align: center;
                top:0px;
                margin: 0px;
        }
        /* 상단 명(ENG.VER) */
        #notiTitle1{
            font-family: 'Noto Sans KR', sans-serif;
          margin: 0px;
	margin: auto;
	margin-top: 0px;
	font-size: 50px;
	padding-top: 40px;
	position: relative;
	width: 600px;
            /* background-color: violet; */
        }
        /* 상단 명(KO.VER) */
        #notiTitle2{
            font-family: 'Noto Sans KR', sans-serif;
            margin-top:0px;
            color: black;
            opacity: 0.5;
            font-size: 22px;
            padding-top:40px;
        }

            #smallTitles{
                display: flex;
                margin-top: 50px;
            }
            /* 문의작성 */
            #smallTitle{
               position: relative;
            }
            /* 문의작성 앞 작은 이미지 */
            #img1{
                position: relative;
                width: 40px;
                height: 40px;
                margin-left:18%;
                top:10px;
            }
            /* 고객선터번호 */
            #notiSection h5{
                font-family: 'Noto Sans KR', sans-serif;
                position: absolute;
                margin-left: 72%;
                color :#b3a193;
            }
            /*---------- 혜윰의 중심 문단---------- */
            #notiSection p{
                font-family: 'Noto Sans KR', sans-serif;
            }
            #notiSection p:nth-of-type(1){
                font-size: 35;
            }
            #notiSection p:nth-of-type(3){
                font-size: 11;
                color: lightgrey;
            }
            #notiSection span{
                color: #d2c4b9;;
            }
            #smalltext{
                color: lightgrey;
                font-size: 12;
            }
            /* 문단 오른쪽 큰 이미지 */
            #img2{
                width: 25%;
                height: 38%;
                margin-left: 20%;
            }
           #middleTitle{
               display: flex;
               text-align: left;
               margin:auto;
               width: 60%;
               margin-bottom: 20px;
           }
           #think{
               opacity: 0;
               transition:2s;
               font-weight: 500;
           }
           /* -----------테이블 영역-----------*/
           #wrapTable>table{
                margin: auto;
                padding: 0px;
                margin-left: 11%;
                margin-top: 2%;
               /* height: 1000px; */
            }
            .tdCss{
                font-family: 'Noto Sans KR', sans-serif;
                padding: 12px;
                text-align: left;
                font-weight: bold; 
            }
            /* 각 라벨 앞 작은 이미지 */
            .tdCss img{
                position: absolute;
                margin-left: -40px;
                margin-top: 0px;
                width: 30px;
                height: 30px;
            }
           
            #notiSection input[type=password]{
                width: 100%;
                height: 30px;
                border-radius: 4px;
                /* border: 1px solid black; */
                margin-left: 8%;
            }
            #notiSection input[type=text]{
                border-radius: 4px;
                /* border: 1px solid black; */
                width:100%; 
                height: 30px;
                margin-left: 8%;
            }
            #notiSection label:nth-of-type(1){
                margin-left: 8%;
            }
            
            /* 카테고리 */
            #notiSection select{
                margin-left: 8%;
                width:100%;
                border-radius: 4px;
                /* border: 1px solid black; */
                height: 30px;
            }
            /* 글 내용 */
            #notiSection textarea{
                font-family: 'Noto Sans KR', sans-serif;
                margin-left: 8%;
                resize: none;
                border-radius: 4px;
                /* border: 1px solid black; */
            }

            /* 테이블 뒷 배경 네모선 */
            #notiSection #wrapTable{
                height: 670px;
                width: 65%;
                border:11px solid #d2c4b9;
                margin:auto;
                border-radius: 30px;
                margin-bottom:100px;
            }
            /* ----------취소/등록버튼 ---------- */
          
            #uploadtn{
                position: absolute;
                margin-left:40px;
                padding: 10px 25px;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border: none;
                font-weight: 500;
                font-size: 14px;
            }
            #notiSection input[type=reset]{
                margin-right: 2%;
                padding: 10px 25px;
                border-radius: 4px; 
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border: none;
                font-weight: 500;
                font-size: 14px;
            }
            #notiSection input[type=submit]:hover {
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            #notiSection input[type=reset]:hover {
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            

            /* 반응형 */
            @media only screen and (max-width: 1400px) {
                #notiSection table{
                    float: none;
                    width: 100%;
                }
                #notiSection input[type=text],#notiSection input[type=password],#notiSection select,#notiSection textarea{
                    float: none;
                    width: 70%;
                }
                .filebox .upload-name {
                    float: none;
                    /* width: 55%; */
                }
                .radio{
                    float: none;
                    width: 10%;
                }
                #img2{
                   display: none;
                }
                #middleTitle{
                    display: block;
                    text-align: center;
                    width: 600px;
                }
            }
</style>
 		<!-- 노토산스kr 폰트 가져오기 -->
         <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
</head>
<body>

  <!--section시작-->
      <section id="notiSection">
             <!-- 고객센터 공통 상단 -->
            <div id='Backarea'>    
                <h1 id="notiTitle1">FAQ MANAGE</h1><h3 id="notiTitle2">고객센터 관리</h3>
            </div>
           <div id="smallTitles">
                <img src="img/CS_icon3.png" id = 'img1'>
                <h3 id="smallTitle">자주묻는 질문 글 작성</h3>
           </div>
           <div id="middleTitle">
               <div id="middleTitleContent">
                   <p><span><b>혜윰</b></span><span id="think" style="color: #242424;"> : 생각하다</span></p>
                   <p>
           
                    </p>
               </div>
                <img src="img/please.PNG" id = 'img2'>
           </div>
        
            <div id="wrapTable">
            <table>
                <form name="form" id='form' action="<%=request.getContextPath() %>/insert.fbo" method="post">

                    <colgroup>
                    
                    <col width = '20%'>
                    <col width = '80%'>
                    </colgroup>

                    <table>
                    <tr>
                    <td class = 'tdCss'><img src="img/service.png">카테고리</td>
                    <td>
                    <select name="selectBox" id="forselect">
                   <option value="">카테고리를 선택해주세요</option> 
                	<option value="first">예약문의</option>
               		<option value="second">가격문의</option>
                 	<option value="third">보험/장례</option>
                	<option value="forth">기타문의</option>
            		</select>
            		</td>
            		
            		</tr>
                       
                        <tr>
                        <td class = 'tdCss'><img src="img/service.png">제목</td>
                        <td>
                            <input type = 'text' placeholder="게시글 제목을 입력하세요"  id = 'title' name = "title" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><textarea rows="20" cols="100" placeholder="내용을 입력해주세요" id='content' name = "textarea" required></textarea></td>
                        </tr>
                        <tr>
                            <td class = 'tdCss'></td>
                            <td class="filebox"></td>
                        </tr>
                    </table>
                    <div id="btns">
                       
                       <!--  <input type = 'submit' value = '등록' onclick="upload" id = 'upload'> -->
                       <button type="button" onclick="uploadtest12();" id="uploadtn">등록</button>
                    </div>
                </form>
                 <a href="<%=request.getContextPath()%>/manageFbList.bo;"><input type="reset" value="취소"></a>
            </table>
        </section>


        <!-------------------------------------------------------------------------------------------------------------------------------------->
        <script>
            //등록버튼 클릭 시
            function upload(){
                //1.radio 공개/비공개 값 넘겨주기
                var radiobtn = document.getElementById('radio');
                var radiobtn_check = 0;
                
                for(var i = 0; i<radiobtn.lenght; i++){
                    if(radiobtn[i].checked==true){
                        alert(radiobtn[i].value);
                        radiobtn_check++;
                    }
                }
                //2.첨부파일 값 넘겨주기
                document.file.select();
                alert(document).selection.createRange().text();
            }
            
            function uploadtest12(){
            	if(($("#forselect")).val()==""){
            		alert("카테고리를 선택해 주세요");
            	}else{
            		$("#form").submit();
            	}
            }

            
            //등록 버튼 페이지 전환(null이 아닐때)
            //***라디오 버튼,카테고리 처리
            $(function(){
                $('#upload').click(function(){
                    var frmArr =["title","pass","content","category"];
                    var forRadio = document.getElementById('radio');

                    for(var i=0; i<frmArr.length; i++){
                        if($.trim($('#'+frmArr[i]).val()) == '' && forRadio[i].checked==true){
                            alert('빈 칸을 모두 입력해 주세요.');
						    $('#'+frmArr[i]).focus();
						    return false;
                        }
                    }
                    $('#form').submit();
                    location.href = 'CS_NotiMain.html';
                    alert("등록이 완료되었습니다");
                })
            })

            // 등록버튼 활성화/비활성화 설정
            // $(function(){
            //     $("#title").on('input',function(){
            //         if($("#title").val()=='')
            //             $("#uplaod").prop("disabled",true);
            //         else
            //             $("#upload").prop("disabled",false).css({background:'rgb(208, 198, 196)', color:'black','border':'none'});
            //     })
            // })

  
            //1. 이미지파일 추가
            $("#file").on('change',function(){
                var fileName = $("#file").val();

                $(".upload-name").val(fileName);
            });
        
            //생각하다 문구를 나타내기
            window.setTimeout(function(){
                $('#think').css('opacity', '1');
            },2000) 
            
           //파일선택 텍스트창 크기조정
           $('#fileTextArea').css('width', $('#content').width()-78)
           $(window).resize(function(){
               if($('html').innerWidth()>=1350){
                   $('#fileTextArea').css('width', $('#content').width()-132)
                }else{
                    $('#fileTextArea').css('width', $('#content').width()-130)
               }
            })
        </script>
</body>
</html>