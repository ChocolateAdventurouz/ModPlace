/*---------------------------------------------------
-----------------------------------------------------
Filename:	tabcontrol.m
Version:	1.0

Type:		maki
Date:		30. Okt. 2007 - 17:40  
Author:		Martin Poehlmann aka Deimos
E-Mail:		martin@skinconsortium.com
Internet:	www.skinconsortium.com
		www.martin.deimos.de.vu
-----------------------------------------------------
---------------------------------------------------*/

#include <lib/std.mi>
#include "attribs/init_modplace.m"
#include "attribs/init_appearance.m"
Function updateTabPos();
Function setAutoWidth(guiobject tab);

Class Text WatchText;

Global Boolean HAVE_ML, HAVE_VIDEO = TRUE;

Global GuiObject tabMl, tabVideo, tabVis, tabBrowser, tabPl, tabArt;
Global WatchText txtMl, txtVideo, txtVis, txtBrowser, txtPL, txtArt;
Global int startX, curX;
Global Button btnMl, btnPl, btnArt;
Global String tabArt_x_pos, tabBrowser_x_pos, tabVideo_x_pos, tabVis_x_pos;
System.onScriptLoaded ()
{
	initAttribs_Appearance();
	initAttribs_ModPlace();
	HAVE_ML = stringToInteger(getParam());
	HAVE_VIDEO = System.hasVideoSupport();

	group sg = getScriptGroup();

	tabML = sg.findObject("switch.ml");
	btnMl = sg.findObject("switch.ml");
	txtMl = tabMl.findObject("bento.tabbutton.normal.text");

	tabPL = sg.findObject("switch.pl");
	btnPl = sg.findObject("switch.pl");
	txtPl = tabPl.findObject("bento.tabbutton.normal.text");

	tabVis = sg.findObject("switch.vis");
	txtVis = tabMl.findObject("bento.tabbutton.normal.text");

	tabVideo = sg.findObject("switch.video");
	txtVideo = tabMl.findObject("bento.tabbutton.normal.text");

	tabBrowser = sg.findObject("switch.browser");
	txtBrowser = tabMl.findObject("bento.tabbutton.normal.text");

	tabArt = sg.findobject("switch.art");
	txtArt = tabArt.findObject("bento.tabbutton.normal.text");
	
	startX = tabMl.getGuiX();

	updateTabPos();
}

updateTabPos ()
{	
	curX = startX;
	if (!HAVE_ML)
	{
		tabMl.hide();
	}
	else
	{
		curX += setAutoWidth(tabMl) + 1;
	}

	if (pl_tab_attrib.getData() == "1")
	{
		tabPL.setXmlParam("x", integerToString(curX));
		curX += setAutoWidth(tabPL) + 1;
		tabPL.show();
	}
	else
	{
		tabPL.hide();
	}

	if (HAVE_VIDEO)
	{
		tabVideo.setXmlParam("x", integerToString(curX));
		curX += setAutoWidth(tabVideo) + 1;
	}
	else
	{
		tabVideo.hide();
	}
	tabVis.setXmlParam("x", integerToString(curX));
	curX += setAutoWidth(tabVis) + 1;

	tabBrowser.setXmlParam("x", integerToString(curX));
	curX += setAutoWidth(tabBrowser) + 1;
	
	tabArt.setXmlParam("x", integerToString(curX));
	curX += setAutoWidth(tabArt) + 1;


	// Initial Check
	if (attr_brw_enable_disable.getData() == "1"){

		tabBrowser.show();

	}
    
    else {
		// Temporary workaround for updating the pos of the CoverPlaying tab
		tabArt_x_pos = tabArt.getXmlParam("x");
		tabBrowser_x_pos = tabBrowser.getXmlParam("x");
		tabBrowser.hide();
		tabBrowser.setXmlParam("x", "0");
		curX += setAutoWidth(tabBrowser);
		tabArt.setXmlParam("x", tabBrowser_x_pos);
		curX += setAutoWidth(tabArt) + 1;
		tabArt.show();
    }
	if (attr_coverplaying_enable_disable.getData() == "1"){
		tabArt.show();
	}
	else {
		tabArt.hide();
	}
	
}

int setAutoWidth (guiObject tab)
{
	text source = tab.findObject("bento.tabbutton.normal.text");
	int x = stringToInteger(source.getXmlparam("x"));
	int w = source.getAutoWidth();

	tab.setXmlParam("w", integerToString(2*x+w));

	return 2*x + w;
}

pl_tab_attrib.onDataChanged ()
{
	if (pl_tab_attrib.getData() == "0")
	{
		setPrivateString(getSkinName(), "Pledit_pos", "top");
		if (btnPl.getActivated())
		{	
			btnMl.leftClick();
			btnMl.getParentLayout().sendAction("load_comp", "pledit", 0,0,0,0);	
		}
	}
	
	updateTabPos();
}

attr_brw_enable_disable.onDataChanged(){
	updateTabPos(); // Direct tab update - helps for avoiding a glitch when attrib's data are changed
}
attr_coverplaying_enable_disable.onDataChanged(){
	updateTabPos(); // Direct tab update
}