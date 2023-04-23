#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
; ------------------------------特定窗口快捷键-----------------------------
; edge------------------------------
#IfWinActive, ahk_exe msedge.exe
    ::/f::/favicon.ico
#IfWinActive

; vscode------------------------------
#IfWinActive, ahk_exe code.exe
    CapsLock::
        KeyWait, CapsLock, T0.5
        If (ErrorLevel==1)
            KeyWait, CapsLock
        Else{
            Send, {Esc}
            ; Send, {ShiftDown}
            ; Send, {ShiftUp}
        }
    Return

#IfWinActive
; ps------------------------------
#IfWinActive, ahk_exe Photoshop.exe
    F1::Delete

#IfWinActive
; 雷电模拟器------------------------------
#IfWinActive, ahk_exe dnplayer.exe
    ^!g::Run game.ahk

#IfWinActive
; 迅雷/Motrix-Motrix.exe------------------------------
#IfWinActive, ahk_exe Motrix.exe
    ::zz::magnet:?xt=urn:btih:

#IfWinActive

; honeyview------------------------------
#IfWinActive, ahk_exe Honeyview.exe
    MButton::x

#IfWinActive
; 任务管理器------------------------------
#IfWinActive, ahk_class CabinetWClass
    ^+c:: ; 复制文件路径
        send ^c
        sleep,300
        clipboard = %clipboard%
        clipboard := RegExReplace(clipboard, "\\","/")
        tooltip,%clipboard%
        sleep,1000
        tooltip,
    return

#IfWinActive