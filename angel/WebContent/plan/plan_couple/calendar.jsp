<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>clendar</title>
<link rel='stylesheet' href='/practice/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.css' />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


<style type="text/css">

    body {
        margin :40px 10px;
        padding : 0;
        font-size : 14px;
    }
    #calendar {
         max-width : 100%; 
  
        margin : 20px;

    }
    
    #startDay, #endDay, #content {
    
    	height : 30px;
    	width :  300px;
    }
   
   #startTime, #endTime{
   
    	height : 30px;
    	width :  100px;
   }
   .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */


.modal.modal-center { text-align: center; }

.modal-dialog.modal-fullsize {
 width: 100%;
 height: 100%;
  margin: 0; 
  padding: 0; 
   text-align: center;
  }



   .modal-content.modal-fullsize {
 width: 600px;
  height: 400px; 
  margin: 0; 
  padding: 0;
  display: inline-block; text-align: left; vertical-align: middle; 
 text-align: center;


}


   

</style>

<script src='/practice/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/jquery.min.js'></script>
<script src='/practice/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
<script src='/practice/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0//fullcalendar.js'></script>
<script src="/practice/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/locale-all.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script type="text/javascript">


  


jQuery(document).ready(function($) {

    $('#calendar').fullCalendar({
    	
    	locale : "ko",
       header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        },
        editable : true,
        defaultDate: moment().format('YYYY-MM-DD'),    
        events: {
        	url : 'plan?cmd=list-page&ajax=true',
           dataType : 'json'

        },
        weekends: true,
       
        navLinks : true
        
       ,navLinkDayClick:function(date, jsEvent, view) { 
          
       
          
          
          $("#startDay").val(date.toISOString());
           $("#myModal").modal("show");
          
       }//날짜클릭
       

  
    });//캘린더
    
    
    $("#submit").click(function() {
       
    	  $("#submit").click(function(){
    		  
    		  if($("#startDay").val() == "" || $("#endDay").val() == "" || $("#content").val() == ""){
    			  alert("모든 항목을 입력해주세요!");
    			  return false;
    		  }
    		  
    		  //정규화
    		  var sDay = $("#startDay").val();
    		  var eDay = $("#endDay").val();
    		  
    		  var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;  
    		  var Sresult = sDay.match(dayRegExp);
    		  var Eresult = eDay.match(dayRegExp);
    		  if(!Sresult || !Eresult ){  
    			  alert("날짜 형식을 맞춰주세요");
    			  return false;
    		  }
    		  
    		  var sTime = $("#startTime option:selected").val();
    		  var eTime = $("#endTime option:selected").val();
    			
    		  var FullSDay = sDay + "T" + sTime+":00:00Z";
    		  var FullEDay = eDay + "T" + eTime+":00:00Z";
    			
    		 var fsd = new Date(FullSDay);
    		 var fed = new Date(FullEDay);
    		 
    		 if(fsd>fed){
    			 alert("종료날짜가 시작날짜보다 더 빠릅니다!");
    			 return false;
    		 }
    		 
    		 //타이틀, endTiemd, sTiemd, 
    		  var title = $("#content").val();
    		 FullSDay = sDay + " " + sTime+":00:00";
    		 FullEDay = eDay + " " + eTime+":00:00";
    		 
    			var url =  "plan?cmd=insert-page&title="+title+"&startDay="+FullSDay+"&endDay="+FullEDay;
    			alert(url);
    			$(location).attr('href',url);
    			
     		   	
    	  });//클릭 
    });

    

}); //ready

</script>

</head>
<body>
<br/><br/>
<div id='calendar'></div>


<!-- Modal-->
	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">INSERT YOUR SCHEDULE </h4>
				</div>
				<div class="modal-body">

					<form id="container2" name="container2">
						START DAY <input type="text" name="startDay" autocomplete="off" id="startDay"placeholder="ex)2017-05-11" /> 
						시작시간 <select name="startTime"
							id="startTime">
							<%for(int i=0; i<=24;i++){ %>
							<%  if(i<10){%>
							<option value="0<%=i%>">0<%=i %></option>
							<%}else{ %>
							<option value="0<%=i%>"><%=i %></option>
							<%} %>
							<%} %>
						</select> 시 <br />
						 종료날짜 <input type="text" name="endDay" autocomplete="off"
							id="endDay" placeholder="ex)2017-05-11" /> 
							종료시간 <select
							name="endTime" id="endTime">

							<%for(int i=0; i<=24;i++){ %>

							<%  if(i<10){%>

							<option value="0<%=i%>">0<%=i %></option>


							<%}else{ %>

							<option value="0<%=i%>"><%=i %></option>
							<%} %>

							<%} %>

						</select> 시 
						<br /> <br /> <br />
						 일정내용 <input type="text" name="title" autocomplete="off"	id="content"  name="content"/> <br />

					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"  id="submit" name="submit">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				

			</div>
		</div>
	</div>






</body>
</html>