; ------------------------------Ĭ�ϱ���------------------------------
f_1 := "D:/2Scripts/AHK/shortcut/F1/"
f_2 := "D:/2Scripts/AHK/shortcut/F2/"
f_3 := "D:/2Scripts/AHK/shortcut/F3/"
f_4 := "D:/2Scripts/AHK/shortcut/F4/"
; ------------------------------һЩȫ�ֿ�ݼ�------------------------------
; �л�ģʽ------------------------------
^!1::
    Run D:/2Scripts/AHK/raw.ahk
ExitApp
Return
^!0::Run D:/2scripts/AHK/game.ahk
; ���¼��ؽű�------------------------------
^!R::Reload
; ���ִ�------------------------------
; ��ǰʱ��
::/now::
    FormatTime, CurrentDateTime,, yyy-MM-dd HH:mm:ss
    Send %CurrentDateTime%
return
; һЩ��Ϣ
::/p2::17820488502
::/ahj::honji5022@hotmail.com
::/azc::zc_001@hotmail.com
::/aq1::2840994755@qq.com
::/aq2::1423293579@qq.com

; �ö���ǰ����--------------------------------
#`::
WinGetActiveTitle, title
WinSet, AlwaysOnTop, , %title%
ToolTip, %title%���ö�
Sleep, 1000
ToolTip
Return
; ------------------------------CAPSlock plus------------------------------
Esc::`
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
2::F2
5::F5
#if

; ------------------------------�ض����ڿ�ݼ�-----------------------------
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
; �׵�ģ����------------------------------
#IfWinActive, ahk_exe dnplayer.exe
    ^!g::Run game.ahk

#IfWinActive
; Ѹ��/Motrix-Motrix.exe------------------------------
#IfWinActive, ahk_exe Motrix.exe
    ::zz::magnet:?xt=urn:btih:

#IfWinActive

; honeyview------------------------------
#IfWinActive, ahk_exe Honeyview.exe
    MButton::x

#IfWinActive
; ���������------------------------------
#IfWinActive, ahk_class CabinetWClass
    ^+c:: ; �����ļ�·��
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

; �����������ʱ���ֿ�������------------------------------
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MButton::Send {Volume_Mute}
#If

; �����ĳ������
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
; ------------------------------ȡɫ��------------------------------
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
; ------------------------------��ݴ򿪳���------------------------------
#IfWinActive, ahk_exe SearchApp.exe
    ; F1--------------------------------------------------
    1::1
    1 & b:: ; ����վ
    Run ::{645ff040-5081-101b-9f08-00aa002f954e}
    Return
    1 & c::Run %f_1%ClashForWindows
    1 & f::Run %f_1%FastGitHub
    1 & g::Run %f_1%gaoman
    1 & h:: ; ˢ��host
    Run, cmd.exe
    Sleep, 5000
    ControlSendRaw, ,ipconfig /flushdns , ahk_exe cmd.exe
    Sleep, 500
    ControlSend, , {Enter} , ahk_exe cmd.exe
    Sleep, 500
    Process, Close, cmd.exe
    Return
    1 & s::Run %f_1%steamcommunity
    ; F2--------------------------------------------------
    2::2
    2 & a::Run %f_2%AI
    2 & b::Run %f_2%Billfish
    2 & e::Run %f_2%edge
    2 & f::Run %f_2%firefox
    2 & g::Run %f_2%google
    2 & j::Run %f_2%Joplin
    2 & o::Run %f_2%oulu
    2 & p::Run %f_2%ps
    2 & q::Run %f_2%QQ
    2 & v::Run %f_2%vscode
    2 & w::Run %f_2%wechat
    ; F3--------------------------------------------------
    3::3
    3 & l::Run %f_3%leidian
    3 & s::Run %f_3%steam
    3 & w::Run %f_3%wangyi
    ; F4--------------------------------------------------
    4::4
    4 & a::Run %f_4%ali
    4 & b::Run %f_4%baiduyun
    4 & e::Run %f_4%Everything
    4 & g::Run %f_4%geshigongchang
    4 & m::Run %f_4%Motrix
    4 & p::Run %f_4%pr
    4 & x::Run %f_4%xunlei
    ; F5--------------------------------------------------
    5::5
    5 & b::Run https://bilibili.com
    5 & g::Run https://github.com
    5 & z::Run https://zhihu.com
#IfWinActive