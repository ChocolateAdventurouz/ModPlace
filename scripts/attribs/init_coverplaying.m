/* 
*======================================*
*CoverPlaying attributes initialization*
*======================================*
*/

#ifndef included
#error This script can only be compiled as a #include
#endif

#include "gen_pageguids.m"

#define CUSTOM_PAGE_COVERPLAYING "{E4610B1C-50FE-4D3E-912C-67A478C6634A}"
Global ConfigItem coverplaying_attribs;
Function initAttribs_CoverPlaying();
Global ConfigAttribute attr_nowplaying_enable_disable;
Global ConfigAttribute attr_buildinfo_enable_disable;


initAttribs_CoverPlaying(){
    initPages();

    ConfigItem custom_page_coverplaying = addConfigSubMenu(optionsmenu_page, "CoverPlaying Settings", CUSTOM_PAGE_COVERPLAYING);
    // 1 = 'enabled' - 0 = 'disabled'
    attr_nowplaying_enable_disable = custom_page_coverplaying.newAttribute("Now Playing", "1");
    attr_buildinfo_enable_disable = custom_page_coverplaying.newAttribute("Build Info", "1");
}