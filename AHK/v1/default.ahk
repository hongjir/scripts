; ------------------------------Ĭ�ϱ���------------------------------
flag:=1
; ------------------------------include------------------------------
#Include, ./func/small_tools.ahk
#Include, ./func/quickComplete.ahk
#Include, ./func/capslock+.ahk
#Include, ./func/apps_quick_func.ahk
; ------------------------------һЩȫ�ֿ�ݼ�------------------------------
; �л�ģʽ------------------------------
^!1::
    flag:=!flag
Return
#IF flag==1
    Esc::`
#IF
    #IfWinActive ahk_exe blender.exe
    RButton::RButton
#IfWinActive
; ���¼��ؽű�------------------------------

^!R::Reload
; ��������------------------------------
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