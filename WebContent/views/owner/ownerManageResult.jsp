<%@page import="daily.owner.vo.OwnerCafeInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<OwnerCafeInfoVO> ownerList = (List<OwnerCafeInfoVO>)request.getAttribute("ownerList");
for(int i=0; i<ownerList.size(); i++){
	if(i>0){
%>,<%
	}
	OwnerCafeInfoVO ownerVO = ownerList.get(i);
	
	String rwNum = ownerVO.getRwNum();
	String ownerId = ownerVO.getOwnerId();
	String ownerPw = ownerVO.getOwnerPw();
	String ownerName = ownerVO.getOwnerName();
	String ownerHp = ownerVO.getOwnerHp();
	String ownerEmail = ownerVO.getOwnerEmail();
	String ownerZip = ownerVO.getOwnerZip();
	String ownerAddr1 = ownerVO.getOwnerAddr1();
	String ownerAddr2 = ownerVO.getOwnerAddr2();
	String ownerBirth = ownerVO.getOwnerBirth();
	String regionName = ownerVO.getRegionName();
	String cafeName = ownerVO.getCafeName();
	String runName = ownerVO.getRunName();
%>
	{
		"rwNum" : "<%=rwNum %>"
		,"ownerId" : "<%=ownerId %>"
		,"ownerPw" : "<%=ownerPw %>"
		,"ownerName" : "<%=ownerName %>"
		,"ownerHp" : "<%=ownerHp %>"
		,"ownerEmail" : "<%=ownerEmail %>"
		,"ownerZip" : "<%=ownerZip %>"
		,"ownerAddr1" : "<%=ownerAddr1 %>"
		,"ownerAddr2" : "<%=ownerAddr2 %>"
		,"ownerBirth" : "<%=ownerBirth %>"
		,"regionName" : "<%=regionName %>"
		,"cafeName" : "<%=cafeName %>"
		,"runName" : "<%=runName %>"
	}	
	<%
}
%>

]