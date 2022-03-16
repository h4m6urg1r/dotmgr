RC.libs.awful.mouse.append_global_mousebindings({
    RC.libs.awful.button({ }, 3, function () mymainmenu:toggle() end),
    RC.libs.awful.button({ }, 4, RC.libs.awful.tag.viewprev),
    RC.libs.awful.button({ }, 5, RC.libs.awful.tag.viewnext),
})
