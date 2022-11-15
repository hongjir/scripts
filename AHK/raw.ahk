; ------------------------------默认变量------------------------------
; ------------------------------一些全局快捷键------------------------------
; 切换模式------------------------------
^!1::
    Run *RunAs .\default.ahk
ExitApp
Return
^!0::Run .\game.ahk
; 重新加载脚本------------------------------
^!R::Reload
; 热字串------------------------------
; 当前时间
::/now::
    FormatTime, CurrentDateTime,, yyy-MM-dd HH:mm:ss
    Send %CurrentDateTime%
return
; 一些信息
::/p2::17820488502
::/ahj::honji5022@hotmail.com
::/azc::zc_001@hotmail.com
::/aq1::2840994755@qq.com
::/aq2::1423293579@qq.com

; 置顶当前窗口--------------------------------
#`::
WinGetActiveTitle, title
WinSet, AlwaysOnTop, , %title%
ToolTip, %title%已置顶
Sleep, 1000
ToolTip
Return
; ------------------------------CAPSlock plus------------------------------
^CapsLock::CapsLock
CapsLock::Esc
#if GetKeyState("Capslock", "P")
a:: Send {Blind}{Left DownTemp}
a up:: Send {Blind}{Left up}
w:: SendInput, {Blind}{Up DownTemp}
w up:: SendInput, {Blind}{Up up}
s:: SendInput, {Blind}{down DownTemp}
s up:: SendInput, {Blind}{down up}
d:: SendInput, {Blind}{right DownTemp}
d up:: SendInput, {Blind}{right up}
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

; ------------------------------

; 鼠标在任务栏时滚轮控制音量------------------------------
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MButton::Send {Volume_Mute}
#If

; 鼠标在某窗口上
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
; ------------------------------取色器------------------------------
#c::
    Gui +AlwaysOnTop -Caption +ToolWindow
    Gui, add, Text, vMyText, "what"
    Gui, show, X0 Y0
    Gui, Font, cBlack
    While,GetKeyState("LButton", "P") == 0
    {
        MouseGetPos, mouseX, mouseY
        PixelGetColor, color, %mouseX%, %mouseY%, RGB
        Gui, Color, %color%
        GuiControl,, MyText, %color%
    }
    clipboard = %color%
    Gui, Destroy
return
; ------------------------------快捷打开程序------------------------------
#IfWinActive, ahk_exe SearchApp.exe
    ; F1--------------------------------------------------
    1::1
    1 & b:: ; 回收站
    Run ::{645ff040-5081-101b-9f08-00aa002f954e}
    Return
    1 & h:: ; 刷新host
    Run, cmd.exe
    Sleep, 5000
    ControlSendRaw, ,ipconfig /flushdns , ahk_exe cmd.exe
    Sleep, 500
    ControlSend, , {Enter} , ahk_exe cmd.exe
    Sleep, 500
    Process, Close, cmd.exe
    Return
    ; F2--------------------------------------------------
    2::2
    ; F3--------------------------------------------------
    3::3
    ; F4--------------------------------------------------
    4::4
    ; F5--------------------------------------------------
    5::5
    5 & b::Run https://bilibili.com
    5 & g::Run https://github.com
    5 & z::Run https://zhihu.com
#IfWinActive