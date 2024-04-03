#include <lib/std.mi>
#include "attribs/init_modplace.m"

Global Button nowPlayingBtn, findBtn;

System.onScriptLoaded(){

    initAttribs_ModPlace();
    Group mainnormal = getContainer("main").getLayout("normal");
    nowPlayingBtn = mainnormal.findObject("nowplaying");
    findBtn = mainnormal.findObject("search");
}
attr_search_enable_disable.onDataChanged(){
	if (attr_search_enable_disable.getData() == "1"){
		nowPlayingBtn.setXMLParam("visible", "1");
		findBtn.setXMLParam("visible", "1");  
	}
	else {
		nowPlayingBtn.setXMLParam("visible", "0");
        findBtn.setXMLParam("visible", "0");
	}
}