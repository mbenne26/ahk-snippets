#CS MouseMove 0,0
MouseMove 1000,1000
MouseMove 683,384
DetectHiddenWindows, On
Run cmd "/c taskkill /f /im licensingUI.exe"
loop {
if WinExist("ahk_exe LicensingUI.exe") {
    WinActivate
    Send {RIGHT}{ENTER}
    WinClose
    MsgBox Got1!
}
 ImageSearch, FoundX, FoundY, 100,100, 1000, 1000, licensingUIclose.png
   if (ErrorLevel = 2)
     sleep 1
   else if (ErrorLevel = 1)
     sleep 1
   else {
     MouseMove FoundX+50,FoundY+20
     Click
     MsgBox Got2!
   }
}
return



!^e::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
MsgBox The color at the current cursor position is %color%.

MsgBox % RGB2HSL( 255, 255, 255 )
return
translated from http://www.easyrgb.com/index.php?X=MATH&H=18#text18

RGB2HSL(R, G, B)
{
var_R := ( R / 255 )                    //RGB from 0 to 255
var_G := ( G / 255 )
var_B := ( B / 255 )

var_Min := min( var_R, var_G, var_B )   //Min. value of RGB
var_Max := max( var_R, var_G, var_B )   //Max. value of RGB
del_Max := var_Max - var_Min            //Delta RGB value

L := ( var_Max + var_Min ) / 2

if ( del_Max = 0 )                    //This is a gray, no chroma...
{
   H = 0                               //HSL results from 0 to 1
   S = 0
}
else                                   //Chromatic data...
{
   if ( L < 0.5 )
   		S := del_Max / ( var_Max + var_Min )
   else           
   		S := del_Max / ( 2 - var_Max - var_Min )

   del_R := ( ( ( var_Max - var_R ) / 6 ) + ( del_Max / 2 ) ) / del_Max
   del_G := ( ( ( var_Max - var_G ) / 6 ) + ( del_Max / 2 ) ) / del_Max
   del_B := ( ( ( var_Max - var_B ) / 6 ) + ( del_Max / 2 ) ) / del_Max

   if      ( var_R = var_Max ) 
   		H := del_B - del_G
   else
   {
	    if ( var_G = var_Max ) 
	    	H := ( 1 / 3 ) + del_R - del_B
   		else 
   		{
   			if ( var_B = var_Max ) 
   				H := ( 2 / 3 ) + del_G - del_R
		}
	}

   if ( H < 0 ) 
   		H += 1
   if ( H > 1 ) 
   		H -= 1
}
HSL := H . "|" . S . "|" . L
return HSL
}

min(A, B, C)
{
	if (A <= B) && (A <= C)
		return A
	if (B <= A) && (B <= C)
		return B
	if (C <= A) && (C <= B)
		return C
}

max(A, B, C)
{
	if (A >= B) && (A >= C)
		return A
	if (B >= A) && (B >= C)
		return B
	if (C >= A) && (C >= B)
		return C
}

SplitRGBColor(color, Red, Green, Blue)
SplitRGBColor(RGBColor, ByRef Red, ByRef Green, ByRef Blue)
{
    Red := RGBColor >> 16 & 0xFF
    Green := RGBColor >> 8 & 0xFF
    Blue := RGBColor & 0xFF
}

MsgBox, % "RGB " Color " split is:`n"
    . "Red: " Red . "`n"
    . "Green: " Green . "`n"
    . "Blue: " Blue . "`n"

return
	}
}

DetectHiddenWindows, On
SetTitleMatchMode 2
WinActivate ahk_exe Notepad.exe
WinGet, OutputVar, List
MsgBox %OutputVar%
 if WinExist("Your Windows license will expire soon") {
   WinActivate 
   MsgBox "HIT!"
   Send {RIGHT}{ENTER}
 }
 if WinExist("ahk_class Shell_SystemDialog") {
   WinActivate
   MsgBox "HIT2!"
   Send {RIGHT}{ENTER}
 }
 if WinExist("ahk_exe LicensingUI.exe") {
   WinActivate
   MsgBox "HIT3!"
   Send {RIGHT}{ENTER}
 }
}
return

!^e::
SetKeyDelay 12
SetMouseDelay 12
ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, *100 companyName.png
{
	if (ErrorLevel = 2)
		MsgBox, "Not Found"
	else if (ErrorLevel = 1)
   MsgBox, "Not Found"
	else
		MouseMove,FoundX+62,FoundY-5
}
Send {ALT}irt
FoundXstart := FoundX+62
FoundYstart := FoundY-5
Yshift := 24
FoundX := FoundX+742
FoundY := FoundY+Yshift
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irt
FoundY := FoundY+Yshift
FoundYstart := FoundYstart+Yshift
MouseMove,FoundXstart,FoundYstart
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irt
FoundX := FoundX-495
FoundY := FoundY+Yshift+4
FoundYstart := FoundYstart+Yshift+4
MouseMove,FoundXstart,FoundYstart
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irt
FoundX := FoundX+500
FoundXstart := FoundXstart+345
FoundY := FoundY+Yshift+4
FoundYstart := FoundYstart+Yshift+4
MouseMove,FoundXstart,FoundYstart
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irt
FoundX := FoundX-500
FoundXstart := FoundXstart-345
FoundY := FoundY+Yshift+4
FoundYstart := FoundYstart+Yshift+4
MouseMove,FoundXstart,FoundYstart
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irt
FoundX := FoundX+500
FoundXstart := FoundXstart+345
FoundY := FoundY+Yshift+4
FoundYstart := FoundYstart+Yshift+4
MouseMove,FoundXstart,FoundYstart
MouseClickDrag,L,,,FoundX,FoundY

Send {ESC}{ALT}irc
ImageSearch, FoundCX, FoundCY, 0,0, 500, 500, *100 checkboxF.png
	MouseMove,FoundCX,FoundCY
MouseClickDrag,L,,,FoundCX+10,FoundCY+15
Send {ESC}{ALT}irc
MouseClickDrag,L,,,FoundCX,FoundCY+25

Send {ESC}{ALT}irc
ImageSearch, FoundCX, FoundCY, 0,0, 1000, 500, *100 checkboxC.png
	MouseMove,FoundCX,FoundCY
MouseClickDrag,L,,,FoundCX+10,FoundCY+10

Send {ESC}{ALT}irt
ImageSearch, FoundCX, FoundCY, 0,0, 500, 750, *150 checkboxA.png
	MouseMove,FoundCX-5,FoundCY+15
MouseClickDrag,L,,,FoundCX+680,FoundCY+50
Click right
Send t
sleep 100
Send +{TAB 6}{DOWN}
Send +{TAB 5}{ENTER}
sleep 100
Send {TAB 2}6{ENTER}
sleep 100
Send {ESC}

return


!^w::
ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, printUniversal.png
 Click %FoundX%,%FoundY%
sleep 300
Send ^l^c
Send ^w
sleep 100
Send ^t
sleep 100
Send ^v{ENTER}
Send ^2
MouseMove,FoundX-100,FoundY
Click
sleep 500
Send ^f
sleep 100
Send Lesson Exams{ENTER}{ESC}{TAB}{ENTER}
sleep 200
ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, examLessonUniversal.png
 MouseMove,FoundX+50,FoundY+10
 Click
sleep 300
Send ^f
sleep 100
Send Cancel{ESC}{TAB}{ENTER}
ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, beginExamUniversal.png
 Click %FoundX%,%FoundY%
sleep 100
Send {PGDN}{UP 2}{TAB}
return

!^o::
Send {PGDN}{up 2}
sleep 100
ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, questionDotUniversal.png
 MouseMove,FoundX+62,FoundY+10
 MouseClickDrag,L,,,FoundX+700,FoundY+100
 Send ^c
if WinExist("Untitled - Notepad")
 WinActivate use the window found above
Send ^v{ENTER}
WinActivate ahk_exe chrome.exe

CtrlC := Chr(3) ;Store the character for Ctrl-C in the CtrlC var.
 Loop {
   Input, answer, L1 M, {Space}{Tab}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}
   
   If (answer = CtrlC)
     break
     
   Else If (answer = 1)
     ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, answerAUniversal.png
   Else If (answer = 2)
     ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, answerBUniversal.png
   Else If (answer = 3)
     ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, answerCUniversal.png
   Else If (answer = 4)
     ImageSearch, FoundX, FoundY, 0,0, 1000, 1000, answerAUniversal.png

   MouseMove,FoundX,FoundY
   MouseClickDrag,L,,,FoundX+300,FoundY+25
   Send ^c
   sleep 100
   Click,FoundX-300,FoundY-25
   if WinExist("Untitled - Notepad")
     WinActivate use the window found above
   Send ^v{ENTER 2}
   WinActivate ahk_exe chrome.exe
   Send {PGDN}{up 2}
 }
return

+Enter:: Suspend

blah
^!r::
{
key  := "Ctrl" Any key can be used here.

name := GetKeyName(key)
vk   := GetKeyVK(key)
sc   := GetKeySC(key)

MsgBox, % Format("Name:`t{}`nVK:`t{:X}`nSC:`t{:X}", name, vk, sc)
}

PixelSearch, Px, Py, 200, 200, 300, 300, 0x9d6346, 3, Fast
if ErrorLevel
    MsgBox, That color was not found in the specified region.
else
    MsgBox, A color within 3 shades of variation was found at X%Px% Y%Py%. #CE