#IfWinActive ahk_class Notepad
F5::
FormatTime, DateTimeString,, M/d,HH:mm:ss
Send, %DateTimeString%{Enter}
return

#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class Progman")
{
^+t::
Sleep, 200
Click, Right, 1
Sleep, 50
Send, wt
return
}
return