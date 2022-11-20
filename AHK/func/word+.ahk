#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

#IfWinActive ahk_class OpusApp
    Up::
        KeyWait, Up, T0.5
        If (ErrorLevel==1){
            Send, ^+{+}
            KeyWait, Up
            Send, ^+{+}
        }
        Else
            Send, Up
    Return
    Down::
        KeyWait, Down, T0.5
        If (ErrorLevel==1){
            Send, ^{+}
            KeyWait, Down
            Send, ^{+}
        }
        Else
            Send, Down
    Return
#IfWinActive