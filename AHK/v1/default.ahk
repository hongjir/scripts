; ------------------------------默认变量------------------------------
flag:=1
; ------------------------------include------------------------------
#Include, ./func/small_tools.ahk
#Include, ./func/quickComplete.ahk
#Include, ./func/capslock+.ahk
#Include, ./func/apps_quick_func.ahk
; ------------------------------一些全局快捷键------------------------------
; 切换模式------------------------------
^!1::
    flag:=!flag
Return
#IF flag==1
    Esc::`
#IF
    #IfWinActive ahk_exe blender.exe
    RButton::RButton
#IfWinActive
; 重新加载脚本------------------------------

^!R::Reload
; 唤出窗口------------------------------
#IfWinNotActive, ahk_exe blender.exe
RButton::
    KeyWait, RButton, T0.2
    If (ErrorLevel==1){
        Run *RunAs box.ahk
    }
    Else
        Send, {RButton}
Return
#If
    ; ------------------------------CAPSlock plus------------------------------
^CapsLock::CapsLock
CapsLock::Esc