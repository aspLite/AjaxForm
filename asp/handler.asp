<%
if not aspl.isEmpty(aspL.getRequest("asplEvent")) then
	aspL("asp/" & lcase(aspL.getRequest("asplEvent")) & ".asp")
else
	response.write aspl.loadText("static/html/default.htm")
end if
%>