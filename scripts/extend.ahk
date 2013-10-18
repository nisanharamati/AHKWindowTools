; window extension functions (shift+winkey + arrow): to the left, to the right, up, down

+#Right::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    /* get left coord and total width, then subtract to get right coordinate */
    SysGet, VirtualLeft, 76
    SysGet, VirtualRight, 78
    VirtualRight += %VirtualLeft%
    oWidth *= 2
    right = %oX%
    right += %oWidth%
    /* if the right edge is past the end of the virtual desktop, affix it to virtual right */
    if right > %VirtualRight%
        right = %VirtualRight%
    oWidth = %right%
    oWidth -= %oX%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

+#Left::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oX -= oWidth
    oWidth *= 2
    if (oX < 0)
    {
        oWidth += %oX%
        oX = 0
    }
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

+#Up::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oY -= oHeight
    oHeight *= 2
    if (oY < 0 )
        oY = 0
    SysGet, Height, 79
    if (oHeight >= %Height%)
        oHeight = %Height%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

+#Down::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oHeight *= 2
    SysGet, Height, 79
    if (oHeight >= %Height%)
        oHeight = %Height%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return