#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

#if GetKeyState("Capslock", "P")
; 方向键
a:: Send {Blind}{Left DownTemp}
a up:: Send {Blind}{Left up}
w:: SendInput, {Blind}{Up DownTemp}
w up:: SendInput, {Blind}{Up up}
s:: SendInput, {Blind}{down DownTemp}
s up:: SendInput, {Blind}{down up}
d:: SendInput, {Blind}{right DownTemp}
d up:: SendInput, {Blind}{right up}

; 方向选中
h::SendInput, {ShiftDown}{Left DownTemp}
h up::SendInput, {ShiftUp}{Left up}
j::SendInput, {ShiftDown}{Down DownTemp}
j up::SendInput, {ShiftUp}{Down up}
k::SendInput, {ShiftDown}{Up DownTemp}
k up::SendInput, {ShiftUp}{Up up}
l::SendInput, {ShiftDown}{Right DownTemp}
l up::SendInput, {ShiftUp}{Right up}
!q::Run *RunAs box.ahk
q:: SendInput, {Blind}{BackSpace DownTemp}
q up:: SendInput, {Blind}{BackSpace up}
e::
    Send, ^c
    Sleep, 100
    web=%clipboard%
    KeyWait, CapsLock
    If (InStr(web, "https://") Or InStr(web, "www."))
        Run %web%
    Else
        Run https://cn.bing.com/search?q=%web%
Return
#if

#if GetKeyState("Capslock", "P") and flag==1
2::SendInput, {Blind}{F2}
5::SendInput, {Blind}{F5}
#if