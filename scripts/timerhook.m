#include <lib/std.mi>
#include "attribs/init_modplace.m"

Global Text timeLayout;
Global Group sg;

System.onScriptLoaded(){

    initAttribs_ModPlace();
    Group mainnormal = getContainer("main").getLayout("normal");
    timeLayout = mainnormal.findObject("SongTime");
}
attr_oldtimer.onDataChanged(){
	if (attr_oldtimer.getData() == "1"){
		timeLayout.setXMLParam("x", "8");
		timeLayout.setXMLParam("y", "11");  
        //x="8" y="11"
	}
	else {
		timeLayout.setXMLParam("x", "7");
		timeLayout.setXMLParam("y", "8"); 
        //x="7" y="8"
	}
}