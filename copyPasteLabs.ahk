^m::Winset, Alwaysontop, , A

#IfWinActive, Module 
{ 
	^c::
	sleep, 100
	Send,^c
	Clipboard := StrReplace(Clipboard, "–", "-")
	MouseMove 500,500

	KeyWait, LButton, D
	sleep, 100

	SendRaw, %Clipboard%
	return
}