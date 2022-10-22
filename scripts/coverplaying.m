
/*------------------------

	 CoverPlaying
	 =========
   Metadata Transmitter

	Version 1.2.0.1

Coded by: ChocolateAdventurouz
Description: It obtains the song title and "transmits" it to the mod
------------------------*/

#include <lib/std.mi>

#include <lib/com/songinfo.m>
#include "attribs/init_coverplaying.m"
Global GuiObject sg_title, buildinfo;
Global Text cp_title;
Global String str_buildinfo;
Function loadmetadata();
System.onScriptLoaded()
{
	initAttribs_CoverPlaying();
	Group mainnormal = getContainer("main").getLayout("normal");
	String str_buildinfo = "CoverPlaying - Version 1.2";
	sg_title = mainnormal.findObject("CoverPlaying.Title");
	cp_title = sg_title.findObject("text");
	buildinfo = mainnormal.findObject("buildinfo");

	if (attr_buildinfo_enable_disable.getData() == "1"){
		buildinfo.setXMLParam("visible", "1");
		//messagebox("BuildInfo -> Enabled", "Information", 0, "");
	}
	else {
		buildinfo.setXMLParam("visible", "0");
		//messagebox("BuildInfo -> Disabled", "Information", 0, "");
	}
	if (attr_nowplaying_enable_disable.getData() == "1"){
		sg_title.setXMLParam("visible", "1");
		//messagebox("NowPlaying -> Enabled", "Information", 0, "");
	}
	else {
		sg_title.setXMLParam("visible", "0");
		//messagebox("NowPlaying -> Disabled", "Information", 0, "");
	}
	loadmetadata();

}

loadmetadata()
{
	String METATITLE = System.getplayitemmetadatastring("title");
	String METARTIST = System.getplayitemmetadatastring("artist");
	String NULLTitle = System.removePath(getPlayItemString());
	if (getplayitemmetadatastring("title") == "")
	{
			sg_title.setXMLParam("text", "Loading Metadata...");
			sg_title.setXMLParam("text", "Now Playing: " + NULLTitle);

	}
	else{
		if (getplayitemmetadatastring("artist") != "")
		{
			sg_title.setXMLParam("text", "Loading Metadata...");
			sg_title.setXMLParam("text", "Now Playing: " + METATITLE + " - With: " + METARTIST);
		}
		else{
			sg_title.setXMLParam("text", "Loading Metadata...");
			sg_title.setXMLParam("text", "Now Playing: " + METATITLE);
		}
	}
}
System.onStop()
{
	sg_title.setXMLParam("text", "Stopped.");
}
System.onResume()
{
	loadmetadata();
}
System.onTitleChange(String newtitle)
{
	loadmetadata();
}
attr_buildinfo_enable_disable.onDataChanged(){
	if (attr_buildinfo_enable_disable.getData() == "1"){
		buildinfo.setXMLParam("visible", "1");
		//messagebox("BuildInfo -> Enabled", "Information", 0, "");
	}
	else {
		buildinfo.setXMLParam("visible", "0");
		//messagebox("BuildInfo -> Disabled", "Information", 0, "");
	}
}
attr_nowplaying_enable_disable.onDataChanged(){
	if (attr_nowplaying_enable_disable.getData() == "1"){
		sg_title.setXMLParam("visible", "1");
		//messagebox("NowPlaying -> Enabled", "Information", 0, "");
	}
	else {
		sg_title.setXMLParam("visible", "0");
		//messagebox("NowPlaying -> Disabled", "Information", 0, "");
	}
}