<%
dim form : set form=aspl.form

dim titleTag : set titleTag=form.field("script")
titleTag.add "text","window.document.title='Dynamic title-tag'"

dim style : set style=form.field("style")
style.add "text","#body{margin:0 auto;max-width:500px;margin-top:20px;background-color:#EEE;padding:20px;border-radius:6px;box-shadow: 5px 5px 3px #aaaaaa;}"

dim element : set element=form.field("element")
element.add "tag","h3"
element.add "html","aspLite ajax form example"

dim plain : set plain=form.field("plain")
plain.add "html","<p>This is a pure <i>ajax</i> form developed in ASP/VBScript using aspLite, the new framework for ASP/VBScript developers.</p>"

dim input : set input=form.field("text")
input.add "name","input"
input.add "class","form-control"
input.add "label","Your name"
input.add "required",true

dim story : set story=form.field("textarea")
story.add "name","story"
story.add "class","form-control"
story.add "label","Your story"
story.add "rows",4

dim options : set options=aspl.dict
options.add "yes","yes"
options.add "no","no"

dim areyouhappy : set areyouhappy = form.field("radio")
areyouhappy.add "name","areyouhappy"
areyouhappy.add "required",true
areyouhappy.add "options",options
areyouhappy.add "label","Are you happy?"

dim hr : set hr=form.field("element")
hr.add "tag","hr"

if form.postback then

	dim feedback : set feedback=form.field("element")
	feedback.add "tag","div"
	feedback.add "class","alert alert-success"
	feedback.add "html","Well done " & aspl.pcase(server.htmlencode(aspl.getRequest("input")))
	
	dim continue : set continue=form.field("button")
	continue.add "html","Continue"
	continue.add "class","btn btn-success"
	continue.add "onclick","return false;"

else

	dim submit : set submit=form.field("submit")
	submit.add "class","btn btn-primary"
	submit.add "value","Click me"
	submit.add "container","span"

	dim space : set space=form.field("plain")
	space.add "html","<span>&nbsp;&nbsp;</span>"

	dim reload : set reload=form.field("button")
	reload.add "html","Reset"
	reload.add "class","btn btn-warning"
	reload.add "onclick","aspAjax('GET',aspLiteAjaxHandler,'asplEvent=body',getAspForm)"

end if

form.build
%>