#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Extend edge by 100%: win + shift + num2468 (snap to edges when distance-to-edge <= extension)

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