#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
#Include, <mouse>

; �ö���ǰ����--------------------------------
#`::
    WinGetActiveTitle, title
    WinSet, AlwaysOnTop, , %title%
    ToolTip, %title%���ö�
    Sleep, 1000
    ToolTip
Return

; �����������ʱ���ֿ�������------------------------------
#If MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
    MButton::Send {Volume_Mute}
#If

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