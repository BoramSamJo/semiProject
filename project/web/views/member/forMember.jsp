<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For Member</title>
    <script src = "http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        /* 전체설정 */
        body{
            margin: 0px;
            padding: 0px;
        /* background: palevioletred; */
        }
        body *{
            font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none;
        }
        section{
            background-color: rgb(65, 64, 64);
        }
        h2{
            margin: 0;
        } 
        h3{
            margin: 0;
        }
        p{
            margin:0;
        }

        /* 인트로(브랜드스토리) 설정 */
        #forMemberIntro{
            position: relative;
            width: 100%;
            height: 700px;
            background-color: #242424;
        }
        #forMemberIntroVideo{
            width: 100%;
            opacity: 0;
            margin: 0px;
        }
        #forMemberIntroImg{
            position: absolute;
            top:0;
            left:0;
            opacity: 0.1;
            height: 700px;
        }
        #introText0{
            position: absolute;
            top: 150px;
            left: 80px;
            transition: 2s;
            opacity: 0;
        }
        #introText0 p{
            font-family: 'Lovers Quarrel', cursive;
            font-family: 'Cairo', sans-serif;
            font-family: 'Amiri', serif;
            /* font-family: 'Dancing Script', cursive;
            font-family: 'Dynalight', cursive; */
            font-size: 70px;
            color: white;
            font-weight: 100;
        }
        #introText{
            position: absolute;
            top:400px;
            right: 40px;
            /* background-color: violet; */
            z-index: 100;
        }
        #introText2{
            position: absolute;
            top:550px;
            left: 100px;
            color:white;
            font-size: 25px;
            transition: 2s;
            opacity: 0;
        }
        #introText p{
            color:white;
            font-size: 25px;
            line-height: 40px;
            font-family: 'Nanum Brush Script', cursive;
            font-family: 'Nanum Myeongjo', serif;
            opacity: 0;
            transition: 1s;
        }

        /* 회원혜택 영역 */
        #forMember{
            background-color: rgb(65, 64, 64);
            margin: 0px;
        }
        #forMember>h2{
            color: #b3a193;
            padding: 30px;
            font-size: 30px;
        }

        /* 무료상담영역 */
        #consultingArea{
            background-color:#242424;
            color:#b3a193;
            padding: 20px;
            height: 650px;
            position: relative;
        }
        #consultingArea>h3{
            padding: 20px;
            text-align: center;
        }
        #consult{
            
        }
        #consult>table{
            padding: 15px;
            width: 1100px;
            /* height: 400px; */
        }
        #consult>table td{
            padding: 15px;
        }
        #consult>table tr:nth-of-type(1) p:nth-child(2){
            font-weight: 600;
            padding: 5px;
        }
        #consultTitle{
            font-style: italic;
            font-size: 25px;
            font-weight: 550;
        }
        #consultAsk{
            font-size: 20px;
            font-weight: 550;
            /* color: rgb(49, 49, 49); */
        }
        #consult1Content{
            font-size: 18px;
            font-weight: 500;
        }
        .consultIntroTh{
            font-size: 18px;
            font-weight: 500;
        }
        #consultPerson{
            position: absolute;
            top:190px;
            right: 100px;
        }
        #consultImg{
            position: absolute;
            top:0px;
            left:0px;
            width: 100%;
            height: 740px;
            opacity: 0.1;
        }
        #consultInform{
            background-color: rgb(63, 62, 62);
            padding: 20px;
            margin: 20px;
            color:white;
            width: 1000px;
            margin: auto;
            border-radius: 5px;
        }
        #consultInform table{
            /* margin: auto; */
        }
        #consultInform table td{
            padding: 15px;
        }
        #consultInform table tr:nth-of-type(1) td{
            font-size: 20px;
        }
        #wantConsult{
            background-color: #b3a193;
            color:#242424;
            font-weight: 600;
            font-size: 14px;
            padding: 5px;
        }
        /* 픽업서비스영역 */
        #pickUpArea{
            background-color: rgb(49, 49, 49);
            color:#b3a193;
            position: relative;
        }
        #pickUpArea>img{
            position: absolute;
            top:0px;
            left: 0px;
            height: 630px;
            opacity: 0.7;
        }
        #pickUpArea>h3{
            position: relative;
            z-index: 100;
            color:#242424;
        }
        #pickUpContent{
            display: flex;
            text-align: center;
            align-items: center;
            z-index: 100;
        }
        #pickUpArea1{
            position: relative;
            top:160px;
            background-color: black;
            margin: auto;
            width: 400px;
            height: 300px;
            z-index: 100;
            opacity: 0.8;
        }
        #pickUpTitle1{
            border-bottom: 1px solid white;
            padding: 15px;
            font-size: 20px;
            font-weight: 500;
        }
        #pickUpArea2{
            position: relative;
            top:160px;
            background-color: white;
            margin: auto;
            width: 400px;
            height: 300px;
            z-index: 100;
            opacity: 0.9;
        }
        #pickUpArea2>p:nth-of-type(1){
            margin-top: 50px;
        }
        #pickUpArea1>p:nth-of-type(1){
            margin-top: 30px;
        }
        #pickUpTitle2{
            border-bottom: 1px solid black;
            padding: 15px;
            font-size: 20px;
            font-weight: 500;
        }
        [id^='pickUpArea']>p{
            padding: 10px;
        }
        #wantPickUp{
            background-color: #b3a193;
            color: #242424;
            padding: 4px;
            width: 60px;
            font-weight: 600;
            font-size: 12px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #wantPickUpArea{
            display: flex;
            /* background-color: #302823; */
            width: 217px;
            margin: auto;
        }
        #wantPickUpArea * {
            margin: 10px;
        }
        /* 회원혜택 타이틀 문구 */
        .benefits{
            padding: 30px;
            font-size: 22px;
        }
        #benefit1{
            background-color: #b3a193;
            color:#242424;
        }
        #benefit2{
            background-color: #b3a193;
            color:#242424;
        }
    </style>
    <!-- 아마리 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Amiri:ital@1&display=swap" rel="stylesheet">
    <!-- 카이로 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@600&display=swap" rel="stylesheet">
    <!-- 나눔명조 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <!-- 노토산스kr 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- 나눔브러쉬 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <!-- 필기체 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Lovers+Quarrel&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dynalight&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="../common/menubar.jsp" %>

    <section>
        <div id="forMemberIntro">
            <video id="forMemberIntroVideo" src="<%=request.getContextPath() %>/video/past2.mp4" frameborder="0" loop="loop" autoplay="autoplay" onmouseover="play()" volume="0.1"></video>
            <img id="forMemberIntroImg" src="<%=request.getContextPath() %>/img/fog-571786_1920.jpg" width="100%">
            <div id="introText0">
                <p>
                    HyeYum brand story
                </p>
            </div>
            <div id="introText">
                <p id="p1">
                    혜다 - 생각하다<br>
                    혜윰은 생각함의 의미를 가집니다<br>
                    <br><br>
                </p>

                <p id="p2">
                    먼저 떠나보낼 수밖에 없던 사랑하는 우리 아이들을 생각하고<br>
                    <br><br>
                </p>

                <p id="p3">
                    이별 이후 오랜세월이 지나서도 기억 너머 가슴한켠에 남아 <br>
                    홀로 추억하고 슬퍼할 보호자의 마음을 생각합니다<br>
                    <br><br>
                </p>

               <p id="p44">
                    최선을 다해 사랑했지만 행복했던 기억과 더불어<br>
                    더 잘해주지 못했다는 생각에 눈물짓게 됩니다<br>
                    <br><br>
               </p>

               <p id="p5">
                    마지막까지도 누구보다 잘 보내주고 싶은 마음<br>
                    그 마음을 누구보다 잘 알기에<br>
                    <br><br>
               </p>

                <p id="p6"> 
                    어느순간 과거를 돌아보았을 때<br>
                    후회되지 않는 최선의 선택이 되도록 혜윰이 도와드리겠습니다<br>
                    <br><br>
                </p>

                <p id="p7">
                    언제든지 기대셔도 괜찮습니다<br>
                    혜윰은 24시간 여러분을 생각합니다<br>
                    <br><br>
                </p>
            </div>
            <div id="introText2">
                단지 모습만 다를 뿐, 가족입니다.<br>
                소중한 아이의 마지막 산책길을 함께합니다
            </div>
        </div>
        
        <div id="forMember">
            <h2 align="center">혜윰 회원을 위한 혜택</h2>
            <h3 align="center" id="benefit1" class="benefits">첫번째, 무료 심리 상담 제공</h3>
            <div id="consultingArea">
                <div id="consult">
                    <table align="center">
                        <tr>
                            <td>
                                <p id="consultTitle">"누군가에게 털어놓는 것 만으로 큰 힘이 될 수 있습니다"</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p id="consultAsk">펫 로스 증후군을 아시나요?</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p id="consult1Content">
                                    사랑하는 가족이었던 반려동물이 내 곁을 영영 떠나가게 되면서 느끼게 되는 우울감, 상실감을 말합니다<br>
                                    충분히 슬픔의 시간을 가지고 서로에게 집중하는 것이 중요합니다<br>
                                    특히 다른 반려동물이 남아있거나 집에 어린아이가 있는경우 각별히 신경써주세요<br>
                                    혼자라 힘들다면, 주변사람들이 이해해주지 못한다면<br>
                                    부담없이 찾아오세요
                                </p>
                            </td>
                        </tr>
                        <tr>
                        </table>
                        <div id="consultInform">
                            <table>
                                <tr>
                                    <td colspan="4"><p>상담사 김이준 박사</p></td>
                                </tr>
                                <tr>
                                    <td align="center" class="consultIntroTh">학력</td>
                                    <td>
                                        <p id="consultEducation">
                                            이화여자대학교 심리학과 졸업<br>
                                            고려대학교 교육대학원 상담심리교육 졸업<br>
                                            숙명여자대학교 심리치료학과 전공 박사
                                        </p>
                                    </td>
                                    <td align="center" class="consultIntroTh">현직</td>
                                    <td>
                                        <p id="consultCurrentJob">
                                            숙명여자대학교 심리학과 초빙대우교수<br>
                                            경희대학교 멘탈케어센터 겸임교수<br>
                                            혜윰 전문 상담 심리사
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="consultIntroTh"><p id="wantConsult">상담신청</p></td>
                                    <td colspan="3">
                                        <p id="consultPhone">010-4853-3545</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                </div>
                <div id="consultPerson">
                    <img src="<%=request.getContextPath() %>/img/738014526_orig-removebg-preview.png" width="370">
               </div>
                <!-- <img id="consultImg" src="img/graffiti-1472472_1280.jpg" alt=""> -->
            </div>

            <h3 align="center" id="benefit2" class="benefits">두번째, 무료 픽업 서비스</h3>
            <div id="pickUpArea">
                <div id="pickUpContent">
                    <div id="pickUpArea1">
                        <div id="pickUpTitle1">접근성이 안좋은 장례식장</div>
                        <p>모든 반려동물 장례식장이 도시밖 변두리에 있고</p>
                        <p>대중교통 또한 용이치 않아</p>
                        <p> 
                            자차가 없으면 특히<br>
                            많은 불편을 겪으십니다
                        </p>
                    </div>
                    <div id="pickUpArea2">
                        <div id="pickUpTitle2">픽업 서비스로 한번에 해결</div>
                        <p>
                            저희 혜윰은 여러분이 어디에있던<br>
                            오는길과 가는길 안전히 모셔다 드립니다
                        </p>
                        <div id="wantPickUpArea">
                            <div id="wantPickUp">픽업신청</div><p>010-4853-3545</p>
                        </div>
                    </div>
                </div>
                <img id="pickUpImg" src="<%=request.getContextPath() %>/img/traffic2.jpg" alt="">
                <img id="pickUpImg2" src="<%=request.getContextPath() %>/img/traffic1.jpg" alt="">
            </div>
        </div>
    </section>

    <footer>

    </footer>

    <script>
        // $('video').css('height', $('html').innerHeight());
        // $('#introText').children().css('opacity', '1')
        // setTimeout(function(){
        //     $('#introText').css({'top':'800px'});
        // },2000)
       setTimeout(function(){
    	   var play = function() {
    		    var videoTag = document.getElementsByTagName('video')[0]; //비디오 태그를 가져옴
    		    videoTag.volume = 0.2;
    		    videoTag.play(); //videoTag 변수에 플레이 이벤트를 부여 
    		};
       },1000)

        var forMemberInterval = window.setInterval(function(){
            
            setTimeout(function(){
                clearInterval(forMemberInterval);
            }, 1000)

            window.setTimeout(function(){
                $('#introText').animate({'top':-($('#introText').height()+150)},35000 ,'linear');
            }, 1000);//6000
            window.setTimeout(function(){
                $('#p1').css('opacity', '1');
            },2000);
            window.setTimeout(function(){
                $('#p1').css('opacity', '0');
                $('#p2').css('opacity', '1');
            },5000);
            window.setTimeout(function(){
                $('#p2').css('opacity', '0');
                $('#p3').css('opacity', '1');
            },8000);
            window.setTimeout(function(){
                $('#p3').css('opacity', '0');
                $('#p44').css('opacity', '1');
            },11000);
            window.setTimeout(function(){
                $('#p44').css('opacity', '0');
                $('#p5').css('opacity', '1');
            },15000);
            window.setTimeout(function(){
                $('#p5').css('opacity', '0');
                $('#p6').css('opacity', '1');
            },19000);
            window.setTimeout(function(){
                $('#p6').css('opacity', '0');
                $('#p7').css('opacity', '1');
            },23000);
            window.setTimeout(function(){
                $('#p7').css('opacity', '0');
            },27000);
            window.setTimeout(function(){
                $('#introText0').css('opacity', '1');
                $('#introText2').css('opacity', '1');
            },29000);

           
        },1000);


        $('#pickUpImg').css('width', $('html').innerWidth()/2);
        $('#pickUpImg2').css('width', $('html').innerWidth()/2).css('left',$('#pickUpImg').css('left', $('html').innerWidth()/2));
        $(window).resize(function(){
            $('#pickUpImg').css('width', $('html').innerWidth()/2);
            $('#pickUpImg2').css('width', $('html').innerWidth()/2).css('left', $('#pickUpImg').css('left', $('html').innerWidth()/2));
        })
        $('#pickUpArea').css('height', $('#pickUpImg').height());
    </script>
</body>
</html>