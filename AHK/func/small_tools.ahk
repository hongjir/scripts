#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
#Include, <mouse>

; 置顶当前窗口--------------------------------
#`::
WinGetActiveTitle, title
WinSet, AlwaysOnTop, , %title%
ToolTip, %title%已置顶
Sleep, 1000
ToolTip
Return

; 鼠标在任务栏时滚轮控制音量------------------------------
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MButton::Send {Volume_Mute}
#If

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