#ifndef included
#error This script can only be compiled as a #include
#endif

#include "gen_pageguids.m"

#define CUSTOM_PAGE_MODPLACE "{3D73786F-9FCA-45E4-BFE3-D46CF82E7C5A}"
Global ConfigItem modplace_attribs;
Function initAttribs_ModPlace();
Global ConfigAttribute attr_brw_enable_disable;
Global ConfigAttribute attr_coverplaying_enable_disable;
Global ConfigAttribute attr_file_labels_enable_disable;
Global ConfigAttribute attr_permanent_branding_enable_disable;
Global ConfigAttribute attr_antialias_mcv;
Global ConfigAttribute attr_art_to_video;

initAttribs_ModPlace(){
    initPages();

    ConfigItem custom_page_modplace = addConfigSubMenu(optionsmenu_page, "ModPlace", CUSTOM_PAGE_MODPLACE);
    // 1 = 'enabled' - 0 = 'disabled'
    attr_brw_enable_disable = custom_page_modplace.newAttribute("Enable/Disable Browser", "1");
    attr_coverplaying_enable_disable = custom_page_modplace.newAttribute("Enable/Disable CoverPlaying", "0");
    attr_file_labels_enable_disable = custom_page_modplace.newAttribute("Enable/Disable File Labels", "1");
    attr_permanent_branding_enable_disable = custom_page_modplace.newAttribute("Enable Permanent Branding", "0");
    attr_antialias_mcv = custom_page_modplace.newAttribute("Antialias fileinfo/mcv", "0");
    attr_art_to_video = custom_page_modplace.newAttribute("Video playback to cover", "0");
}
/*
#ifdef MAIN_ATTRIBS_MGR

attr_brw_enable_disable.onDataChanged(){
    if (attribs_mychange) return;
    NOOFF
    attribs_mychange = 1;

}
#endif
*/