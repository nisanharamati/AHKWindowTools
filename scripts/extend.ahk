#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; Extend edge by 100%: win + shift + num2468 (snap to edges when distance-to-edge <= extension)





; Extend to the left
#NumpadLeft::
#Numpad4::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualLeft, 76
    SysGet, VirtualWidth, 78
    VirtualRight = %VirtualWidth%
    VirtualRight += %VirtualLeft%
    ; get extension size: always extend by half a monitor width
    dWidth = %A_ScreenWidth% ; always extend by half a monitor width
    dWidth /= 2
    ; new X and width parameters
    nWidth = %oWidth%
    nX = %oX%
    ; increase nWidth and shift nX
    nWidth += %dWidth%
    nX -= %dWidth%
    ; if nX is left of the virtual left coordinate, adjust it. Also reduce width by that much.
    if (nX < VirtualLeft)
    {
        dWidth = %nX%
        dWidth -= %VirtualLeft%
        nX = %VirtualLeft%
        nWidth += %dWidth%
    }
    ; test the right edge doesn't go past the virtual right
    nRight = %nX%
    nRight += %nWidth%
    if (nRight > VirtualRight) ; if it does, trim it,too.
    {
        nWidth = %VirtualWidth%
    }
    WinMove, %Title%,, nX, oY, nWidth, oHeight
return


; Extend to the Right
#NumpadRight::
#Numpad6::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualLeft, 76
    SysGet, VirtualWidth, 78
    VirtualRight = %VirtualWidth%
    VirtualRight += %VirtualLeft%
    ; get extension size: always extend by half a monitor width
    dWidth = %A_ScreenWidth% ; always extend by half a monitor width
    dWidth /= 2
    ; new X and width parameters
    nWidth = %oWidth%
    nX = %oX%
    ; increase nWidth and shift nX
    nWidth += %dWidth%
    ; if nX is left of the virtual left coordinate, adjust it. Also reduce width by that much.
    if (nX < VirtualLeft)
    {
        dWidth = %nX%
        dWidth -= %VirtualLeft%
        nX = %VirtualLeft%
        nWidth += %dWidth%
    }
    ; test the right edge doesn't go past the virtual right
    nRight = %nX%
    nRight += %nWidth%
    
    if (nRight > VirtualRight) ; if it does, trim it,too.
    {
        nWidth = %VirtualRight%
        nWidth -= %nX%
    }
    WinMove, %Title%,, nX, oY, nWidth, oHeight
return



#NumpadUp::
#Numpad8::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualTop, 77
    SysGet, VirtualHeight, 79
    VirtualBottom = %VirtualTop%
    VirtualBottom += %VirtualHeight%
    ; get extension size: always extend by a quater monitor Height
    dHeight = %A_ScreenHeight% ; always extend by a quater monitor Height
    dHeight /= 4
    ; new Y and Height parameters
    nHeight = %oHeight%
    nY = %oY%
    ; increase nHeight and shift nY
    nHeight += %dHeight%
    nY -= %dHeight%
    ; if nY is above of the virtual top coordinate, adjust it. Also reduce height by that much.
    if (nY < VirtualTop)
    {
        dHeight = %nY%
        dHeight -= %VirtualTop%
        nY = %VirtualTop%
        nHeight += %dHeight%
    }
    ; test the bottom edge doesn't go past the virtual bottom
    nBottom = %nY%
    nBottom += %nHeight%
    if (nBottom > VirtualBottom) ; if it does, trim it,too.
    {
        nHeight = %VirtualHeight%
    }
    WinMove, %Title%,, oX, nY, oWidth, nHeight
return

#NumpadDown::
#Numpad2::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualTop, 77
    SysGet, VirtualHeight, 79
    VirtualBottom = %VirtualTop%
    VirtualBottom += %VirtualHeight%
    ; get extension size: always extend by a quater monitor Height
    dHeight = %A_ScreenHeight% ; always extend by a quater monitor Height
    dHeight /= 4
    ; new Y and Height parameters
    nHeight = %oHeight%
    nY = %oY%
    ; increase nHeight and shift nY
    nHeight += %dHeight%
    ; if nY is above of the virtual top coordinate, adjust it. Also reduce height by that much.
    if (nY < VirtualTop)
    {
        dHeight = %nY%
        dHeight -= %VirtualTop%
        nY = %VirtualTop%
        nHeight += %dHeight%
    }
    ; test the bottom edge doesn't go past the virtual bottom
    nBottom = %nY%
    nBottom += %nHeight%
    if (nBottom > VirtualBottom) ; if it does, trim it,too.
    {
        nHeight = %VirtualHeight%
        nHeight -= %nY%
    }
    WinMove, %Title%,, oX, nY, oWidth, nHeight
return