<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@page import="org.json.simple.JSONArray"%> 
 <%@page import="org.json.simple.JSONObject"%>
 <%@page import="java.util.HashMap"%> 
<%@page import="java.util.Map"%> 

<%


 //받아올때 num을 아이디로 같이 받아오기

String title[] = {"실험","타이틀1", "타이틀2", "타이틀 3","타이틀4"};
String startDay[] = {"2017-04-05","2017-05-01", "2017-05-02", "2017-05-03", "2017-05-04"};
String endDay[] = {"2017-04-06","2017-05-01", "2017-05-04", "2017-05-04", "2017-05-04"};


ArrayList<String>Atitle = new ArrayList<String>();
ArrayList<String>AstartDay = new ArrayList<String>();
ArrayList<String>AendDay = new ArrayList<String>();


for(int i=0; i<title.length;i++){
	Atitle.add(title[i]);
	AstartDay.add(startDay[i]);
	AendDay.add(endDay[i]);
	
}



String reTitle = request.getParameter("title");
String reSDay = request.getParameter("startDay");
String reEDay = request.getParameter("endDay");
System.out.print(reTitle);


if(reTitle != null ||reSDay != null || reEDay != null ){
	Atitle.add(reTitle);
	AstartDay.add(reSDay);
	AendDay.add(reEDay);
	System.out.print("여긴 돌긴해??????");
}

JSONObject obj = new JSONObject();

JSONArray jArray = new JSONArray();

//array 리스트로 vo를 받아올때는 그거 사이즈만큼 돌림. 지금은 일단 title만큼
for(int i=0; i<Atitle.size(); i++){
	
	JSONObject sObject = new JSONObject();

	
	sObject.put("end",AendDay.get(i));
	sObject.put("start",AstartDay.get(i));
	sObject.put("title",Atitle.get(i));
	jArray.add(sObject);
	
}

System.out.print(jArray.toString() +"\n");
obj.put(null, jArray);
out.write(jArray.toString());

%>

