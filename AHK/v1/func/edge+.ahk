#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
pad=1

#If, pad==1
WheelDown::
    MouseGetPos, x, y, Win, con
    If (con=="Intermediate D3D Window1")
    {
        KeyWait, WheelDown,L
        Sleep, 1000
        Send, ^{Tab}
    }
    Else
        send, {WheelDown}
Return

WheelUp::
    MouseGetPos, x, y, Win, con
    If (con=="Intermediate D3D Window1")
    {
        KeyWait, WheelUp,L
        Sleep, 1000
        Send, ^+{Tab}
    }
    Else
        send, {WheelUp}
Return
#If
^!0::
    pad:=!pad
Return