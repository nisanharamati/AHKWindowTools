; window compression functions (shift+winkey + arrow): to the left, to the right, up, down

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