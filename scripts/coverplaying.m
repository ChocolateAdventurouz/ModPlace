
/*------------------------

	 CoverPlaying
	 =========
	 Version 1.3

Coded by: ChocolateAdventurouz
Description: It obtains track's necessary metadata and updates the values
------------------------*/

#include <lib/std.mi>

#include <lib/com/songinfo.m>
#include "attribs/init_coverplaying.m"
Global GuiObject sg_title, sg_artist, buildinfo;
Global Text cp_title, cp_artist;
Global String str_buildinfo;
Function loadmetadata();

System.onScriptLoaded()
{
	initAttribs_CoverPlaying();
	Group mainnormal = getContainer("main").getLayout("normal");
	String str_buildinfo = "CoverPlaying - Version 1.3";
	sg_title = mainnormal.findObject("CoverPlaying.Title");
	cp_title = sg_title.findObject("text");
	sg_artist = mainnormal.findObject("CoverPlaying.Artist");
	cp_artist = sg_artist.findObject("text");
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
		sg_artist.setXMLParam("visible", "1");
		//messagebox("NowPlaying -> Enabled", "Information", 0, "");
	}
	else {
		sg_title.setXMLParam("visible", "0");
		sg_artist.setXMLParam("visible", "0");
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
			sg_title.setXMLParam("text", NULLTitle);
			sg_artist.setXMLParam("text", "Unknown Artist");

	}
	else{
		if (getplayitemmetadatastring("artist") != "")
		{
			sg_artist.setXMLParam("text", METARTIST);
			sg_title.setXMLParam("text", METATITLE);
		}
		else{
			sg_artist.setXMLParam("text", "Unknown Artist");
			sg_title.setXMLParam("text", METATITLE);
		}
	}
}
System.onStop()
{
	sg_title.setXMLParam("text", "Nothing is Currently Playing.");
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
		sg_artist.setXMLParam("visible", "1");
		//messagebox("NowPlaying -> Enabled", "Information", 0, "");
	}
	else {
		sg_title.setXMLParam("visible", "0");
		sg_artist.setXMLParam("visible", "0");
		//messagebox("NowPlaying -> Disabled", "Information", 0, "");
	}
}