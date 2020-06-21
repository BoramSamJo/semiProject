<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
                height: 320px;
                background: #d2c4b9;
                text-align: center;
                top:0px;
                margin: 0px;
        }
        /* 상단 명(ENG.VER) */
        #notiTitle1{
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0px;
            margin-left: 50px;
            margin: auto;
            margin-top: 0px;
            font-size: 50px;
            padding-top:140px;
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
        /* 상단 강아지 이미지 */
        #headimg{
            width: 80px;
            height: 80px;
            position: absolute;
            margin-top: 130px;
            margin-left: -380px;
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
                width:85%; 
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
                width:85%;
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
            #btns{
                /* background-color: violet; */
                width: 200px;
                margin: auto;
                margin-top: 40px;
            }
            #notiSection input[type=submit]{
                position: relative;
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
            
            /* ----------파일추가하기 영역---------- */
            .filebox input[type="file"] {
                 position: absolute;
                 width: 0;
                 height: 0;
                 padding: 0;
                 overflow: hidden;
                 border: 0;
            }
            .filebox label {
                display: inline-block;
                padding: 5px 20px;
                vertical-align: middle;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                cursor: pointer;
                border-radius: 5px;
                margin-left: 8%;
                font-size:14px; 
            }
            .filebox label:hover {
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            .filebox .upload-name {
                display: inline-block;
                height: 30px;
                /* width: 78%; */
                font-size:12px; 
                padding: 2px 10px;
                vertical-align: middle;
                border: 1px solid black;
                border-radius: 5px;
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

              /* -----------------footerCSS 시작------------------------ */
            footer{
                background-color: #242424;
            }
            /* 풋터 콘텐츠 설정 */
            #footerTable{
                width: 1000px;
                margin-left: 30px;
                color:white;
            }
            #footerTable td{
                padding: 3px;
                padding-left: 50px;
                padding-right: 50px;
                font-size: 14px;
            }
            #footerTable th{
                text-align: left;
                padding-top: 10px;
                padding-bottom: 5px;
                padding-left: 50px;
                color:#b3a193;
            }
            /* 풋터 마지막 문구 설정 */
            #footerP{
                color:#534b44;
                font-size: 14px;
                margin-top: 10px;
                margin-left: 30px;
                line-height: 30px;
                padding-left: 50px;
                margin-bottom: 0px;
            }
            #footerTable a{
                text-decoration: none;
            }
            #footerTable tr:nth-of-type(6) a{
                color:white;
            }
            #animalProtectSys{
                background-color: #b3a193;
                color: #242424;
                padding: 1.5px 4px 2px 4px;
                font-size: 12px;
                font-family: 'Noto Sans KR', sans-serif;
            }
           
        </style>
        <!-- 노토산스kr 폰트 가져오기 -->
         <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
    </head>
    <body>
        <!--header시작-->
        <header>
        	<%@include file="../common/menubar.jsp"%>
        </header>

        <!--section시작-->
        <section id="notiSection">
             <!-- 고객센터 공통 상단 -->
            <div id='Backarea'>
                <img src="<%=request.getContextPath() %>/img/CS_icon4.png" id=headimg>
                <h1 id="notiTitle1">HYEYUM SKETCHBOOK</h1><h3 id="notiTitle2">혜윰 스케치북</h3>
            </div>
           <div id="smallTitles">
                <img src="<%=request.getContextPath() %>/img/CS_icon3.png" id = 'img1'>
                <h3 id="smallTitle">추억 기록하기</h3>
           </div>
           <div id="middleTitle">
               <div id="middleTitleContent">
                   <p><span><b>혜윰</b></span><span id="think" style="color: #242424;"> : 생각하다</span></p>
                   <p>
                       혜윰과 함께 별이 된 아이를 추억하고 항상 생각할 수 있는 공간입니다<br>
                       아이들과 함께한 소중한 추억을 나누어주세요
                    </p>
               </div>
                <img src="<%=request.getContextPath() %>/img/please.PNG" id = 'img2'>
           </div>
        
            <div id="wrapTable">
            
            <table>
	        	<form name="form" id='form' action="<%=request.getContextPath() %>/write.sb" method="post" encType="multipart/form-data">
                    <colgroup>
                    <col width = '20%'>
                    <col width = '80%'>
                    </colgroup>
	
                    <table>
                        <tr>
                        <td class = 'tdCss'><img src="<%=request.getContextPath() %>/img/service.png">제목</td>
                        <td>
                            <input type = 'text' placeholder="게시글 제목을 입력하세요"  id = 'title' name = "title" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><textarea rows="20" cols="100" placeholder="내용을 입력해주세요" id='content' name = "textarea" id= required></textarea></td>
                        </tr>
                        <tr>
                            <td class = 'tdCss'><img src="<%=request.getContextPath() %>/img/service.png">첨부</td>
                            <td class="filebox">
                                <label for='file'>업로드</label>
                                <input multiple="multiple" type="file"  accept = "image/*" name = "file" id="file">
                                <input id="fileTextArea" class="upload-name" placeholder="파일선택">
                            </td>
                        </tr>
                    </table>
                    <div id="btns">
                        <input type = 'reset' value = '취소' onclick="reset" id="reset">
                        <input type = 'submit' value = '등록' onclick="upload" id = 'upload'>
                    </div>
	        	</form>
            </table>
    		</div>        
        </section>
	

        <!--footer시작-->
        <footer>
            <table id="footerTable">
                <tr>
                    <th colspan="2">CUSTOMER CENTER</th>
                    <th colspan="2">HYEYUMM</th>
                </tr>
                <tr>
                    <td>24시 장례예약</td>
                    <td>1577-0996</td>
                    <td>동물장묘업 등록번호</td>
                    <td>
                        <a id="animalProtectSys" href="https://www.animal.go.kr/front/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
                            동물보호시스템
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>기타문의</td>
                    <td>09시부터 18시까지</td>
                    <td colspan="2">제 5540000-038-2016-0001호</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>potter3786@naver.com</td>
                    <td>사업자 등록번호</td>
                    <td>255-81-00588</td>
                </tr>
                <tr>
                    <td>운영시간</td>
                    <td>09시부터 20시</td>
                    <td>통신판매업 신고번호</td>
                    <td>제 2017-경기광주-0168호</td>
                </tr>
                <tr>
                    <td><a href="">오시는길</a></td>
                    <td><a href="">사이트맵</a></td>
                    <td><a href="">개인정보 처리방침</a></td>
                    <td><a href="">이용약관</a></td>
                </tr>
            </table>
            <p id="footerP">
                해윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린
                <br>
                Copyright © 2020-2020 hyeyum Institute All Right Reserved
            </p>
        </footer>



        <!-------------------------------------------------------------------------------------------------------------------------------------->
        <script>
            //등록버튼 클릭 시
/*             function upload(){
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
            } */

            
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
                    alert("등록이 완료되었습니다");
                    location.href = '<%=request.getContextPath()%>/views/board/sketchBoardList.jsp';
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

            //취소 버튼 페이지 전환
             $(function(){
                $('#reset').click(function(){
                    alert("메인으로 돌아갑니다");
                    location.href = '<%=request.getContextPath()%>/views/board/sketchBoardList.jsp';
                })
            })

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