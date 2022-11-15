; ------------------------------默认变量------------------------------
f_1 := "D:/2Scripts/AHK/shortcut/F1/"
f_2 := "D:/2Scripts/AHK/shortcut/F2/"
f_3 := "D:/2Scripts/AHK/shortcut/F3/"
f_4 := "D:/2Scripts/AHK/shortcut/F4/"
; ------------------------------一些全局快捷键------------------------------
; 切换模式------------------------------
^!1::
    Run D:/2scripts/AHK/default.ahk
ExitApp
Return
^!0::Run D:/2scripts/AHK/game.ahk
; 重新加载脚本------------------------------
^!R::Reload
; 快捷打开------------------------------
; 热字串------------------------------
; 当前时间
::nnow::
    FormatTime, CurrentDateTime,, yyy-MM-dd HH:mm:ss
    Send %CurrentDateTime%
return
; 一些信息
::/p2::17820488502
::/ahj::honji5022@hotmail.com
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
; F1--------------------------------------------------
F1::F1
F1 & b:: ; 回收站
Run ::{645ff040-5081-101b-9f08-00aa002f954e}
Return
F1 & c::Run %f_1%ClashForWindows
F1 & f::Run %f_1%FastGitHub
F1 & g::Run %f_1%gaoman
F1 & h:: ; 刷新host
Run, cmd.exe
Sleep, 5000
ControlSendRaw, ,ipconfig /flushdns , ahk_exe cmd.exe
Sleep, 500
ControlSend, , {Enter} , ahk_exe cmd.exe
Sleep, 500
Process, Close, cmd.exe
Return
F1 & s::Run %f_1%steamcommunity
; F2--------------------------------------------------
F2::F2
F2 & a::Run %f_2%AI
F2 & b::Run %f_2%Billfish
F2 & e::Run %f_2%edge
F2 & f::Run %f_2%firefox
F2 & g::Run %f_2%google
F2 & j::Run %f_2%Joplin
F2 & o::Run %f_2%oulu
F2 & p::Run %f_2%ps
F2 & q::Run %f_2%QQ
F2 & v::Run %f_2%vscode
F2 & w::Run %f_2%wechat
; F3--------------------------------------------------
F3::F3
F3 & a::Run %f_3%apex
F3 & l::Run %f_3%leidian
F3 & s::Run %f_3%steam
F3 & w::Run %f_3%wangyi
; F4--------------------------------------------------
F4::F4
F4 & a::Run %f_4%ali
F4 & b::Run %f_4%baiduyun
F4 & e::Run %f_4%Everything
F4 & g::Run %f_4%geshigongchang
F4 & m::Run %f_4%Motrix
F4 & p::Run %f_4%pr
F4 & x::Run %f_4%xunlei
; F5--------------------------------------------------
F5::F5
F5 & b::Run https://bilibili.com
F5 & g::Run https://github.com
F5 & z::Run https://zhihu.com