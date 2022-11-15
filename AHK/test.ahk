RButton::
    KeyWait, RButton, T1
    If (ErrorLevel==1){
        Gui, Add, Button, Default w80, code
        Gui, Show
    }
    Else
        Send, {RButton}
Return

