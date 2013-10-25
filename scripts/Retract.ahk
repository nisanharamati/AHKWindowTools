#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory


; Retract edge by 50%: win + ctrl + num2468 (snap to edges when distance-to-edge <= retraction)

^#Right::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    /* do not minimize below 50 pixels */
    oWidth //= 2
    if oWidth < 50
        oWidth = 50
    oX += %oWidth%
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

^#Left::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oWidth //= 2
    if (oWidth < 10)
        oWidth = 10
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

^#Up::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oHeight //= 2
    if (oHeight <= 10)
        oHeight = 10
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return

^#Down::
    WinGetActiveTitle, Title
    WinGetPos, oX, oY, oWidth, oHeight, %Title%
    oHeight //= 2
    oY += oHeight    
    SysGet, Height, 79
    oYMax = %Height%
    oYMax -= 10
    if (oY > %oYMax%)
        oY = %oYMax%
    if (oY+oHeight > %Height%)
    {
        oHeight = %Height%
        oHeight -= %oY%
    }
    WinMove, %Title%,, oX, oY, oWidth, oHeight
return