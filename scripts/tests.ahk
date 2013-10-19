#NoEnv

#Include testinc.ahk



#NumpadLeft::
#Numpad4::
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