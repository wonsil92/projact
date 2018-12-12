

window.onload=function(){
        var myFrame0 = $(".myFrame0").contents().find('body');
        var myFrame1 = $(".myFrame1").contents().find('body');
        var myFrame2 = $(".myFrame2").contents().find('body');
        var myFrame3 = $(".myFrame3").contents().find('body');
        var myFrame4 = $(".myFrame4").contents().find('body');
        var myFrame5 = $(".myFrame5").contents().find('body');
        var myFrame6 = $(".myFrame6").contents().find('body');
        var myFrame7 = $(".myFrame7").contents().find('body');
        var myFrame8 = $(".myFrame8").contents().find('body');
        var myFrame9 = $(".myFrame9").contents().find('body');
        
        //수정할부분
        var mapcode="<script>var container = document.getElementById(\"map\");var options = {center: new daum.maps.LatLng(33.450701, 126.570667),level: 3};var map = new daum.maps.Map(container, options);</scri";
		mapcode+="pt>";        
// 		alert(mapcode);

		document.getElementsByName("contentValue")[0].value=document.getElementsByName("contentValue")[0].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[0].value=document.getElementsByName("contentValue")[0].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[0].value=document.getElementsByName("contentValue")[0].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[0].value=document.getElementsByName("contentValue")[0].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");

	    
// 		alert(document.getElementsByName("contentValue")[0].value);
   
        
		document.getElementsByName("contentValue")[1].value=document.getElementsByName("contentValue")[1].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[1].value=document.getElementsByName("contentValue")[1].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[1].value=document.getElementsByName("contentValue")[1].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[1].value=document.getElementsByName("contentValue")[1].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[2].value=document.getElementsByName("contentValue")[2].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[2].value=document.getElementsByName("contentValue")[2].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[2].value=document.getElementsByName("contentValue")[2].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[2].value=document.getElementsByName("contentValue")[2].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[3].value=document.getElementsByName("contentValue")[3].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[3].value=document.getElementsByName("contentValue")[3].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[3].value=document.getElementsByName("contentValue")[3].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[3].value=document.getElementsByName("contentValue")[3].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[4].value=document.getElementsByName("contentValue")[4].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[4].value=document.getElementsByName("contentValue")[4].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[4].value=document.getElementsByName("contentValue")[4].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[4].value=document.getElementsByName("contentValue")[4].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[5].value=document.getElementsByName("contentValue")[5].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[5].value=document.getElementsByName("contentValue")[5].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[5].value=document.getElementsByName("contentValue")[5].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[5].value=document.getElementsByName("contentValue")[5].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[6].value=document.getElementsByName("contentValue")[6].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[6].value=document.getElementsByName("contentValue")[6].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[6].value=document.getElementsByName("contentValue")[6].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[6].value=document.getElementsByName("contentValue")[6].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[7].value=document.getElementsByName("contentValue")[7].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[7].value=document.getElementsByName("contentValue")[7].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[7].value=document.getElementsByName("contentValue")[7].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[7].value=document.getElementsByName("contentValue")[7].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[8].value=document.getElementsByName("contentValue")[8].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[8].value=document.getElementsByName("contentValue")[8].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[8].value=document.getElementsByName("contentValue")[8].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[8].value=document.getElementsByName("contentValue")[8].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
		document.getElementsByName("contentValue")[9].value=document.getElementsByName("contentValue")[9].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");
        document.getElementsByName("contentValue")[9].value=document.getElementsByName("contentValue")[9].value.replace("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713\">","");
        document.getElementsByName("contentValue")[9].value=document.getElementsByName("contentValue")[9].value.replace("<div id=\"map\" style=\"width:500px;height:400px;\"></div>","");
        document.getElementsByName("contentValue")[9].value=document.getElementsByName("contentValue")[9].value.replace(mapcode,"<img src=\'img/google_image.jpg' style='width:500px; height: 400px;'>");


        
        myFrame0.html(document.getElementsByName("contentValue")[0].value);
        myFrame1.html(document.getElementsByName("contentValue")[1].value);
        myFrame2.html(document.getElementsByName("contentValue")[2].value);
        myFrame3.html(document.getElementsByName("contentValue")[3].value);
        myFrame4.html(document.getElementsByName("contentValue")[4].value);
        myFrame5.html(document.getElementsByName("contentValue")[5].value);
        myFrame6.html(document.getElementsByName("contentValue")[6].value);
        myFrame7.html(document.getElementsByName("contentValue")[7].value);
        myFrame8.html(document.getElementsByName("contentValue")[8].value);
        myFrame9.html(document.getElementsByName("contentValue")[9].value);
    }
	