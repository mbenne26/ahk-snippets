;search for ok box from my HITsprinter script
^!o::
Loop {
  Loop {
    ImageSearch, FoundX, FoundY, 350,50, 500, 300, ok.png
      if (ErrorLevel = 2)
        sleep 1
      else if (ErrorLevel = 1)
        sleep 1
      else {
				FoundXMove := 
        MouseMove %FoundX%, %FoundY%
				MouseMove %FoundX%+300, %FoundY%+300
				MouseClick
        break
      }		
   }
}
return

;copy and throw into notepad
^!a::
{
  Send ^a^c
  if WinExist("Untitled - Notepad")
    WinActivate ; use the window found above
  Send ^v{ENTER 3}
  WinActivate ahk_exe chrome.exe
  MouseClick
  return
}

;copy mturk ID
^!m::
{
  Send A3VE0HT1J20HNX
  return
}

;Move to HitFinder
^!RIGHT::
{
  MouseMove, 1300, 200
  return
}

;+Enter:: Suspend

;download mp3 from voxpopme
^!b::
{
  SetTitleMatchMode, 2
  WinActivate, Transcribe
  Send ^+J
  Sleep 1000
  ImageSearch, FoundX, FoundY, 0,0, 700, 700, top.png
  
    Click %FoundX%,%FoundY%
    Sleep 100
    Send d{ENTER}
    ImageSearch, FoundX, FoundY, 0,0, 700, 700, arrow.png
      Click %FoundX%,%FoundY%
      sleep 100
      oldClipboard := clipboard
      clipboard := "window.location.assign((document.querySelectorAll(""audio""))[0].src);"
      Send ^v
      clipboard := oldClipboard
      Send {ENTER}
      Send ^w
      sleep 2250

  SetTitleMatchMode, 2
  WinActivate, Transcribe
  ImageSearch, FoundX, FoundY, 0,0, 700, 700, download.png
      Click %FoundX%,%FoundY%
      sleep 750
      Click %FoundX%,%FoundY%
      Send !{LEFT}
    
  SetTitleMatchMode, 2
  WinActivate, Otter
  sleep 100
  
  Send ^l
  sleep 100
  Send javascript:document.querySelector("button.mat-button").click();
  Send {ENTER}
  sleep 100
  Send ^l
  sleep 100
  SendRaw javascript:document.querySelector("button.ng-tns-c21-0").click();;
  sleep 100
  Send {BACKSPACE}{ENTER}
  sleep 500
  
  Send +{TAB 2}{DOWN}
  sleep 500
  Send +{F10}a
  Send {ENTER}
  sleep 100
  Send ^{TAB}
  sleep 500
  Send {F5}

  SetTitleMatchMode, 2
  WinActivate, Transcribe
  Send ^f
  sleep 100
  Send Please transcribe below{ENTER}{ESC}{TAB 2}

  ImageSearch, FoundX, FoundY, 500,500, 800, 700, uploading.png
      Click %FoundX%,%FoundY%

  SetTitleMatchMode, 2
  WinActivate, Transcribe

  sleep 5000
  
  Run cmd "/c del %clipboard%"

  

  return
}

^!e::
{
  ;Send +{F10}a
  Run cmd "/k del %clipboard%"
  return
}

;remove 1st HIT Catcher element
^!w::
{
  SetTitleMatchMode, 2
  WinActivate, HIT Catcher
  If !WinExist("DevTools - chrome-extension://iglbakfobmoijpbigmlfklckogbefnlf/hit_catcher/hit_catcher.html")
  {
    Send ^+J
    sleep 1000
  }
  

  SetTitleMatchMode, 2
  WinActivate, DevTools - chrome-extension://iglbakfobmoijpbigmlfklckogbefnlf/hit_catcher/hit_catcher.html
  ImageSearch, FoundX, FoundY, 0,0, 500, 700, arrow.png
      Click %FoundX%,%FoundY%

  oldClipboard := clipboard
  clipboard := "javascript:document.querySelectorAll("".glyphicon-remove"")[0].click();(document.querySelector("".modal-footer"")).querySelector("".btn-success"").click();"
  sleep 100
  Send ^v
  Send {ENTER}
  clipboard := oldClipboard
  return
}

; radio-boxes
^!r::
{
  CtrlC := Chr(3) ;Store the character for Ctrl-C in the CtrlC var.
  Loop {
    ;Wait for user input (Length 1), also send keys that do NOT produce characters
    Input, answer, L1 M, {Space}{Tab}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}
    
    ;quit on CtrlC
    If (answer = CtrlC)
      break
      
    ;if 0-9, do right arrow operation on radio boxes
    Else If (answer >= 0 and answer <= 9)
    {  
      ;decrement answer (zero-based)
      answer -= 1
      
      ;if the answer was 0, you actually want position 9 (not -1)
      ;If (answer = 0)
        ;answer := 9
        
      ;Press right arrow X times, space if needed to lock in bubble, and TAB to goto next question
      Send {Right %answer%},{Space},{Tab}
      ;  answer := null
    }
    ;any other keys (that do produce characters), send it
    ;Else
      ;Send %answer%
      
    ;allow alt-tabbing
    ;If InStr(ErrorLevel, "EndKey:LAlt")
    ;{
      ;KeyWait, Tab, D
      ;can pull up alttab menu from this link
      ;Run, "C:\Users\Default\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\Window Switcher.lnk"
      ;when alt is released, press enter to go to that window
      ;KeyWait, Alt
      ;Send {ENTER}
    ;}
    If InStr(ErrorLevel, "EndKey:LShift")
      KeyWait, Tab, D
    
    ;catches keys that do NOT produce characters
    If InStr(ErrorLevel, "EndKey:")
      ;save the endkey used
      myErrorLevel := ErrorLevel
      ;convert to a command (ErrorLevel produces "Endkey:X", removing "EndKey:" leaves us with X, the key pressed)
      myErrorLevel := StrReplace(myErrorLevel, "EndKey:", "")
      ;send the key (we removed "EndKey:"), enclosing the result in brackets produces the key format {X}, we can send it now
      Send {%myErrorLevel%}
      ;reset the temporary EndKey (so we don't skip input)
      myErrorLevel := null
  }
  return
}

; check-boxes
^!t::
{
  CtrlC := Chr(3) ; Store the character for Ctrl-C in the CtrlC var.
  Input, length, L1
  Loop {
    Input, answer, L1 M
    If (answer = CtrlC)
      break
      answer -= 1
      Send {Tab %answer%}
      Send {Space}
      RemainingTab := length-answer
      Send {Tab %RemainingTab%}
  }
  return
}