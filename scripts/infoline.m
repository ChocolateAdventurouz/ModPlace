/*---------------------------------------------------
-----------------------------------------------------
Filename:	infoline.m
Version:	1.0

Type:		maki
Date:		06. Nov. 2007 - 22:40 
Author:		Martin Poehlmann aka Deimos
E-Mail:		martin@skinconsortium.com
Internet:	www.skinconsortium.com
		www.martin.deimos.de.vu
-----------------------------------------------------
---------------------------------------------------*/

#include <lib/std.mi>
#include "attribs/init_modplace.m"

Global Text txt;
Global Text label;
Global Layer link;
Global Group sg;
Global Int shift = 0;
Function InfoLine_AntiAlias();
System.onScriptLoaded ()
{
	initAttribs_ModPlace();
	sg = getScriptGroup();

	txt = sg.getObject("text");
	label = sg.getObject("label");
	link = sg.getObject("link");
	if (attr_antialias_mcv.getData() == "1"){
		InfoLine_AntiAlias();
	}
}

System.onSetXuiParam (String param, String value)
{
	if (strlower(param) == "shift") shift = stringToInteger(value);	
	if (strlower(param) == "label") label.setText(value);
	if (strlower(param) == "link") link.setXmlparam("tooltip", value);
}

label.onTextChanged (String newtxt)
{
	int w = label.getAutoWidth() + shift;
	txt.setXmlParam("x", integerToString(w));
	txt.setXmlParam("w", integerToString(-w));
}

InfoLine_AntiAlias(){
	if (attr_antialias_mcv.getData() == "1"){
		txt.setXMLParam("antialias", "1");
		label.setXMLParam("antialias", "1");
		link.setXMLParam("antialias", "1");
	}
	else {
		txt.setXMLParam("antialias", "0");
		label.setXMLParam("antialias", "0");
		link.setXMLParam("antialias", "0");
	}
}
attr_antialias_mcv.onDataChanged(){
	InfoLine_AntiAlias();
}