#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

;#Include Extend.ahk


; Extend to the left
#NumpadLeft::
#Numpad4::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    SysGet, VirtualLeft, 76
    SysGet, VirtualWidth, 78
    VirtualRight = %VirtualWidth%
    VirtualRight += %VirtualLeft%
    oX -= oWidth
    dWidth = %A_ScreenWidth% ; always extend by half a monitor width
    dWidth /= 2
    oWidth += %dWidth%
    MsgBox %oX%, %VirtualLeft%, %oWidth%
    if (oX < VirtualLeft)
    {
        MsgBox oX < VirtualLeft | %oX% < %VirtualLeft%
        dX -= %VirtualLeft%
        oWidth -= %dX%
        oX = %VirtualLeft%
    }
    MsgBox %oX%, %VirtualLeft%, %oWidth%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return