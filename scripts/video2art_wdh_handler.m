// Video2Art wdh handler

#include <lib/std.mi>
#include "attribs/init_modplace.m"


Global String skinName_current;
Global Group video2art_sg;
Global Group wdh;

Function RefreshSkin();
Function InitProc_Video2Art();

System.onScriptLoaded(){
    initAttribs_ModPlace();
    video2art_sg = getScriptGroup();
    wdh = video2art_sg.findObject("wdh.video.resizable");
    if (attr_art_to_video.getData() == "1"){
        wdh.setXMLParam("visible", "0");
    }
    else {
        wdh.setXMLParam("visible", "1");
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
        wdh.setXMLParam("visible", "1");
        RefreshSkin();
        wdh.setXMLParam("visible", "0");
    }
    else {
        wdh.setXMLParam("visible", "0");
        RefreshSkin();
        wdh.setXMLParam("visible", "1");
    }

}
attr_art_to_video.onDataChanged(){
        InitProc_Video2Art();
}