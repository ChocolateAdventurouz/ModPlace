/*
Modified files:

- infoline.m
- suicore.m
- tabcontrol.m 
- fileinfo.m
- loadattribs.m
- video2art.m
- attribs/init_modplace.m
- ../xml/player-normal-sui.xml
- ../xml/player-normal.mcv.xml
- ../xml/modplace.xml
- ../xml/modplace-normal.xml
- ../skin.xml
*/

#include <lib/std.mi>
#include <lib/debug.m>
#include "attribs/init_modplace.m"
Global Button brw_enable_disable, coverplaying_enable_disable, file_labels_enable_disable, antialias_mcv, permanent_branding_enable_disable, video_to_art, search_enable_disable, use_oldtimer;
Global Group modplace_g;

System.onScriptLoaded(){
    initAttribs_ModPlace();
    modplace_g = getScriptGroup();
    brw_enable_disable = modplace_g.findObject("brw_enable_disable");
    coverplaying_enable_disable = modplace_g.findObject("coverplaying_enable_disable");
    file_labels_enable_disable = modplace_g.findObject("file_labels_enable_disable");
    antialias_mcv = modplace_g.findObject("antialias_mcv");
    permanent_branding_enable_disable = modplace_g.findObject("permanent_branding_enable_disable");
    video_to_art = modplace_g.findObject("video_to_art");
    search_enable_disable = modplace_g.findObject("search_enable_disable");
    use_oldtimer = modplace_g.findObject("use_oldtimer");
}


brw_enable_disable.onLeftClick(){
    
    if (attr_brw_enable_disable.getData() == "1"){
        attr_brw_enable_disable.setData("0");
    }
    else {
        attr_brw_enable_disable.setData("1");
    }
}

coverplaying_enable_disable.onLeftClick(){
    if (attr_coverplaying_enable_disable.getData() == "1"){
        attr_coverplaying_enable_disable.setData("0");
    }
    else {
        attr_coverplaying_enable_disable.setData("1");
    }
}

file_labels_enable_disable.onLeftClick(){
    if (attr_file_labels_enable_disable.getData() == "1"){
        attr_file_labels_enable_disable.setData("0");
    }
    else {
        attr_file_labels_enable_disable.setData("1");
    }
}

permanent_branding_enable_disable.onLeftClick(){
    if (attr_permanent_branding_enable_disable.getData() == "1"){
        attr_permanent_branding_enable_disable.setData("0");
    }
    else {
        attr_permanent_branding_enable_disable.setData("1");
    }
}

antialias_mcv.onLeftClick(){
    if (attr_antialias_mcv.getData() == "1"){
        attr_antialias_mcv.setData("0");
    }
    else {
        attr_antialias_mcv.setData("1");
    }
}

search_enable_disable.onLeftClick(){
    if (attr_search_enable_disable.getData() == "1"){
        attr_search_enable_disable.setData("0");
    }
    else {
        attr_search_enable_disable.setData("1");
    }
}
video_to_art.onLeftClick(){
    if (attr_art_to_video.getData() == "1"){
        attr_art_to_video.setData("0");
    }
    else {
        attr_art_to_video.setData("1");
    }
}
use_oldtimer.onLeftClick(){
    if (attr_oldtimer.getData() == "1"){
        attr_oldtimer.setData("0");
    }
    else {
        attr_oldtimer.setData("1");
    }
}
