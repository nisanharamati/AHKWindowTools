^!g::
    MsgBox ctrl+alt+g
return

+#Right::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    ; get left coord and total width, then subtract to get right coordinate
    SysGet, VirtualLeft, 76
    SysGet, VirtualRight, 78
    VirtualRight += %VirtualLeft%
    oWidth *= 2
    right = %oX%
    right += %oWidth%
    ; if the right edge is past the end of the virtual desktop, affix it to virtual right
    if right > %VirtualRight%
        right = %VirtualRight%
    oWidth = %right%
    oWidth -= %oX%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

^#Right::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    ; get left coord and total width, then subtract to get right coordinate
    SysGet, VirtualLeft, 76
    SysGet, VirtualRight, 7
    VirtualRight += %VirtualLeft%
    ; do not minimize below 100 pixels
    if oWidth > 200
        oWidth //= 2
    else
        oWidth = 100
    dX = %oWidth%
    ; move left coordinate toward right
    oX += %dX%
    
    
    
    
    
    MsgBox %oX% %oWidth%
    
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return


!Up::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualHeight, 79
    dY -= %oY%
    oHeight -= %dY%
    oY= 0
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

!Down::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualHeight, 79
    dY = %VirtualHeight%
    dY -= oHeight
    oHeight += %dY%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return
/*
!Left::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualWidth, 78
    oHeight = %VirtualWidth%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

!Right::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualWidth, 78
    oHeight = %VirtualHeight%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return
*/