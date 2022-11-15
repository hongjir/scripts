RButton::
    KeyWait, RButton, T1
    If (ErrorLevel==1)
        Run *RunAs .\box.ahk
    Else
        Send, {RButton}
Return

