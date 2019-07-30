^m::Winset, Alwaysontop, , A

#IfWinActive, Module
{
;^b::
;MouseGetPos, OutputVarXB, OutputVarYB

^c::
MouseGetPos, OutputVarXOld, OutputVarYOld
oldX := %OutputVarXOld%
oldY := %OutputVarYOld%

WinGetPos, winX, winY, winWidth, winHeight, Module
X := winWidth * .93
Y := winHeight * .63
MouseMove, %X%, %Y%

sleep, 100
KeyWait Ctrl, D

sleep, 500
Send,^c
Clipboard := StrReplace(Clipboard, "–", "-")
Clipboard := StrReplace(Clipboard, "‘", "'")
Clipboard := StrReplace(Clipboard, "’", "'")

MouseMove %OutputVarXOld%, %OutputVarYOld%
MouseClick
;MouseMove %OutputVarXOld%, %OutputVarYOld%

;WinGetPos, winX, winY, winWidth, winHeight, Module
;X := winWidth * 0.5
;Y := winHeight * 0.63
;MouseMove %X%, %Y%
;KeyWait, LButton, D
;sleep, 100

SendRaw, %Clipboard%
return

^Up::MouseMove, 0, -400, 0, R
^Down::MouseMove, 0, 400, 0, R
^Left::MouseMove, -650, 0, 0, R
#Right::
MouseGetPos, OutputVarXOld, OutputVarYOld
oldX := %OutputVarXOld%
oldY := %OutputVarYOld%

WinGetPos, winX, winY, winWidth, winHeight, Module
X := winWidth * .93
Y := winHeight * .55
MouseMove, %X%, %Y%

KeyWait, LButton, D
sleep, 300

MouseMove, -150, 0, R
MouseMove, %X%, %Y%
sleep, 100
Send {SPACE}
SendRaw {PgDn}
Send {Down 3}
MouseMove, 150, 0, R
sleep, 100

MouseMove %OutputVarXOld%, %OutputVarYOld%
return

^Right::
MouseClick
WinGetPos, winX, winY, winWidth, winHeight, Module
MouseGetPos, OutputVarX, OutputVarY
X := winWidth * .93
Y := winHeight * .5
MouseMove, %X%, %Y%

Send {PGDN}
Send {SPACE}
Send {DOWN 3}
sleep 100

;WinGetPos, winX, winY, winWidth, winHeight, Module
;X := winWidth * -.5
;MouseMove, %X%, 0, 0, R

MouseMove, %OutputVarX%, %OutputVarY%
return

F5::
WinGetPos, winX, winY, winWidth, winHeight, Module
X := winWidth * 0.5
Y := winHeight * .05
Click %X% %Y%
Send, {F5}{ENTER}
return

F11::
WinGetPos, winX, winY, winWidth, winHeight, Module
X := winWidth * 0.5
Y := winHeight * .05
Click %X% %Y%
Send, {F11}
return
}