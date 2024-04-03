// Video2Art

#include <lib/std.mi>
#include "attribs/init_modplace.m"
#include "attribs/init_playlist.m"

Global String skinName_current;
Global Group video2art_sg;
Global AlbumArtLayer wacover;
Global Group wdh;

Function RefreshSkin();
Function InitProc_Video2Art();

System.onScriptLoaded(){
    initAttribs_ModPlace();
    initAttribs_playlist();
    video2art_sg = getScriptGroup();
    wdh = video2art_sg.findObject("wdh.video.resizable");
    wacover = video2art_sg.findObject("winamp.albumart");
    if (attr_art_to_video.getData() == "1"){
        wacover.setXmlParam("visible", "0");
        wdh.setXMLParam("visible", "1");
    }
    else {
        wacover.setXmlParam("visible", "1");
        wdh.setXMLParam("visible", "0");
    }
    skinName_current = System.getSkinName();
}

RefreshSkin(){
    System.lockUI();
    System.switchSkin(skinName_current);
    System.unlockUI();
}

InitProc_Video2Art(){
    if (attr_art_to_video.getData() == "1"){
        playlist_cover_attrib.setData("1");
        wacover.setXmlParam("visible", "0");
        wdh.setXMLParam("visible", "1");
        RefreshSkin();
        wacover.setXmlParam("visible", "0");
        wdh.setXMLParam("visible", "1");
    }
    else {
        wacover.setXmlParam("visible", "1");
        wdh.setXMLParam("visible", "0");
        RefreshSkin();
        wacover.setXmlParam("visible", "1");
        wdh.setXMLParam("visible", "0");
    }

}
attr_art_to_video.onDataChanged(){
        InitProc_Video2Art();
}