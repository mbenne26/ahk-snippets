  ^!Enter:: Suspend

  ^I::
  {
    Send IRCODE{SPACE}
    return
  }
  !^I::
    CtrlC := Chr(3) ;Store the character for Ctrl-C in the CtrlC var.
    Loop {
      Input, answer, L1 M, {BACKSPACE}
      ;quit on CtrlC
      If (answer = CtrlC)
        break
      If (answer = " ")
        answer = SPACE
      If InStr(ErrorLevel, "EndKey:Backspace")
      {
        answer = BACKSPACE
      }
      Send IRCODE{SPACE}%answer%{ENTER}
    }
    return
  ^DOWN::
  {
    Send IRCODE DOWN{ENTER}
    return
  }
  ^!DOWN::
  {
    Send IRCODE CHANNELDOWN{ENTER}
    return
  }
  ^UP::
  {
    Send IRCODE UP{ENTER}
    return
  }
  ^!UP::
  {
    Send IRCODE CHANNELUP{ENTER}
    return
  }
  ^RIGHT::
  {
    Send IRCODE RIGHT{ENTER}
    return
  }
  ^LEFT::
  {
    Send IRCODE LEFT{ENTER}
    return
  }
  ^ENTER::
  {
    Send IRCODE SELECT{ENTER}
    return
  }
  ^T::
  {
    Send TELEPORT TIVO{ENTER}
    return
  }
  ^BACKSPACE::
  {
    Send IRCODE BACK{ENTER}
    return
  }
  ^DEL::
  {
    Send IRCODE CLEAR{ENTER}
    return
  }
  ^G::
  {
    Send TELEPORT NETFLIX{ENTER}
    return
  }
  ^F::
  {
    Send IRCODE ADVANCE{ENTER}
    Send IRCODE ADVANCE{ENTER}
    Send IRCODE ADVANCE{ENTER}
    Send IRCODE ADVANCE{ENTER}
    Send IRCODE ADVANCE{ENTER}
    Send IRCODE ADVANCE{ENTER}
    return
  }
  !^F::
  {
    Send IRCODE FORWARD{ENTER}
    Send IRCODE FORWARD{ENTER}
    Send IRCODE FORWARD{ENTER}
    return
  }
  ^B::
  {
    Send IRCODE REPLAY{ENTER}
    return
  }
  !^B::
  {
    Send IRCODE REVERSE{ENTER}
    Send IRCODE REVERSE{ENTER}
    Send IRCODE REVERSE{ENTER}
    return
  }
  ^SPACE::
  {
    Send IRCODE PAUSE{ENTER}
    return
  }
  ^!R::
  {
    ;run, %comspec% /k telnet 192.168.0.5 31339, ,
    ;sleep, 500
    Send TELEPORT TIVO{ENTER}
    ;HOMESCREEN
    sleep, 2000
    ;SETTINGS
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE RIGHT{ENTER}
    Send IRCODE SELECT{ENTER}
    sleep, 1700
    ;HELP, GO TO RESTART BOX
    Send IRCODE RIGHT{ENTER}
    Send IRCODE DOWN{ENTER}
    Send IRCODE DOWN{ENTER}
    Send IRCODE DOWN{ENTER}
    Send IRCODE DOWN{ENTER}
    Send IRCODE SELECT{ENTER}
    ;ENTER CODE TO RESTART
    Send IRCODE THUMBSDOWN{ENTER}
    Send IRCODE THUMBSDOWN{ENTER}
    Send IRCODE THUMBSDOWN{ENTER}
    Send IRCODE ENTER{ENTER}
    ;GOODNIGHT TIVO CYA IN 5
    return
  }