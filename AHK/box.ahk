shortcut:="D:\2scripts\AHK\shortcut\"
script:="D:\2scripts\script\"
workspace:="D:\1workspace\"
boxHeight=400
boxWidth=400
Gui, New,, BOX!
Gui, -SysMenu Caption AlwaysOnTop
IfWinActive, ahk_exe coodesker-x64.exe
    Gui, Add, Tab3, X0 Y0 H%boxHeight% W%boxWidth%, 启动|工具|文件|脚本|
IfWinActive, ahk_exe Code.exe
    Gui, Add, Tab3, X0 Y0 H%boxHeight% W%boxWidth%, 启动|工具||文件|脚本|
; 启动项目--------------------------------------------------------------------
; Gui, Add, Text, border center BackgroundTrans X35 Y35 H40 W60 gopen, 下载

Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png
Gui, add, GroupBox,x0 y0 w%boxWidth% h%boxHeight%, test
Gui, Add, Button, -Default X35 Y35 H50 W60 gopen , 下载
Gui, Add, Button, -Default X+10 H50 W60 gopen, 阿里云
Gui, Add, Button, -Default X+10 H50 W60 gopen, 百度云
Gui, Add, Button, -Default X+10 H50 W60 gopen,迅雷
Gui, Add, Button, -Default X+10 H50 W60 gopen, Motrix

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, Billfish
Gui, Add, Button, -Default X+10 H50 W60 gopen, Ps
Gui, Add, Button, -Default X+10 H50 W60 gopen, Pr
Gui, Add, Button, -Default X+10 H50 W60 gopen, Blender
Gui, Add, Button, -Default X+10 H50 W60 gopen, clash

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, edge
Gui, Add, Button, -Default X+10 H50 W60 gopen, code
Gui, Add, Button, -Default X+10 H50 W60 gopen, terminal
Gui, Add, Button, -Default X+10 H50 W60 gopen, 雷电模拟器
Gui, Add, Button, -Default X+10 H50 W60 gopen, Zotero

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, scripts
Gui, Add, Button, -Default X+10 H50 W60 gopen, course
Gui, Add, Button, -Default X+10 H50 W60 gopen, doing
Gui, Add, Button, -Default X+10 H50 W60 gopen, archiever
Gui, Add, Button, -Default X+10 H50 W60 gopen, 图片库

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, Joplin
Gui, Add, Button, -Default X+10 H50 W60 gopen, everything
Gui, Add, Button, -Default X+10 H50 W60 gopen, fastgithub
Gui, Add, Button, -Default X+10 H50 W60 gopen, mongo
Gui, Add, Button, -Default X+10 H50 W60 gopen, pgAdmin

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, xtrans
Gui, Add, Button, -Default X+10 H50 W60 gopen, XMind
Gui, Add, Button, -Default X+10 H50 W60 gopen, edge
Gui, Add, Button, -Default X+10 H50 W60 gadminOpen, 注册表编辑器
Gui, Add, Button, -Default X+10 H50 W60 gadminOpen, 任务管理器

; 一些工具------------------------------------------------------------------------------------------------
Gui, tab, 2
Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png

; 桌面
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; vscode
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; edge
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; ps
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; pr
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; excel
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; word
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; ppt
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; terminal
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; 资源管理器
#IfWinActive, ahk_class CabinetWClass

#IfWinActive

; 微信
#IfWinActive, ahk_exe Code.exe

#IfWinActive

; 文件夹！------------------------------------------------------------------------------------------------
Gui, tab, 3
folders := GetSubFolder("D:")
Gui, Add, Button, gpre_folder w30, 返回
Gui, Add, ComboBox, vfolder grenewList x+10 w270, D:|%folders%
; Gui, Add, edit, vfolder gnewFolder w300, D:\2scripts\AHK
Gui, Add, ComboBox, vpattern grenewList x+10 w60, *||*.*|
; Gui, Add, edit, vpatten gnewFolder x+10 w60, *
GuiControlGet, folder, , folder
GuiControlGet, pattern, , pattern
Gui, Add, ListView, vMyListView gMyListView x15 y+10 r20 w380 xm, 文件|大小
Loop Files, %folder%\%pattern%, D F
{
    If (A_LoopFileSizeKB<1024)
        size:=A_LoopFileSizeKB "K"
    Else If (A_LoopFileSizeMB<1024)
        size:=Round(A_LoopFileSizeKB/1024, 2) "M"
    Else If (A_LoopFileSizeMB>1024)
        size:=Round(A_LoopFileSizeMB/1024, 2) "G"
    LV_Add("" ,A_LoopFileName, size)
}
LV_ModifyCol()
LV_ModifyCol(2, 100)
Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png

; 各种脚本------------------------------------------------------------------------------
Gui, tab, 4
Gui, Add, Button, -Default X+35 Y+10 H50 W60 gdns, flushdns
Gui, Add, Button, -Default X+10 H50 W60, terminal
Gui, Add, Button, -Default X+10 H50 W60, 测试
Gui, Add, Button, -Default X+10 H50 W60, game
Gui, Add, Button, -Default X+10 H50 W60, 注册表编辑器
Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png

showGui(boxWidth, boxHeight)
Return
; 函数区------------------------------------------------------------------------------------------------
; 获得子文件夹名称
GetSubFolder(path, t=0)
{
    If (t==3)
        return ""
    list:="|"
    t += 1
    SplitPath, path, filename
    If (!filename)
        t=3
    Loop Files, %path%\*, D
    {
        If (InStr(A_LoopFileName, ".git"))
            Continue
        list.=A_LoopFileFullPath "|" . GetSubFolder(A_LoopFileFullPath, t:=t)
    }
    return StrReplace(list, "||", "|")
}
; 获得鼠标位置以显示窗口
getGuiPos(boxWidth, boxHeight, ByRef mouseX, ByRef mouseY){
    CoordMode, Mouse, Screen
    MouseGetPos, mouseX, mouseY

    SysGet, monitorNum, MonitorPrimary
    If (monitorNum == 2){
        If (mouseX-boxWidth+800 > 2560)
            mouseX := 2560 - 800
        Else
            mouseX:=mouseX-boxWidth>-2560 ? mouseX-boxWidth : -2560
        If (mouseY-boxHeight+1000 > 1560)
            mouseY := 1560 - 1000
        Else
            mouseY:=mouseY-boxHeight>0 ? mouseY-boxHeight : 0
    }
    If (monitorNum == 1){
        If (mouseX-boxWidth+800 > 2560)
            mouseX := 2560 - 800
        Else
            mouseX:=mouseX-boxWidth>0 ? mouseX-boxWidth : 0
        If (mouseY-boxHeight+1000 > 1600)
            mouseY := 1600 - 1000
        Else
            mouseY:=mouseY-boxHeight>0 ? mouseY-boxHeight : 0
    }
}
; 根据标签打开应用、脚本
open(){
    global shortcut
    Run, %shortcut%%A_GuiControl%
    Return
}
; 管理员打开
adminOpen(){
    global shortcut
    Run *RunAs %shortcut%%A_GuiControl%
    Return
}
; 显示界面
showGui(boxWidth, boxHeight){
    getGuiPos(boxWidth, boxHeight, x, y)
    Gui, Show, X%x% Y%y%
    Return
}
; 标签-------------------------------------------------------------------------------------------------
MyListView:
    if (A_GuiEvent = "DoubleClick")
    {
        LV_GetText(File, A_EventInfo, 1)
        LastChar := SubStr(File, 0)
        if (LastChar = "\")
            File := SubStr(File, 1, -1) ; 移除尾随的反斜杠.
        If InStr(File, ".", , 2)
        {
            Run %folder%\%File%,,, UseErrorLevel
            if ErrorLevel
                MsgBox Could not open "%folder%".
        }
        Else{
            GuiControl, ChooseString, folder, %folder%\%File%
            Gosub, renewList
        }
    }
return
; 返回上一级目录，紧接着更新
pre_folder:
    GuiControlGet, folder, , folder
    SplitPath, folder, , pre_f
    folders := GetSubFolder(pre_f)
    GuiControl, , folder,|%pre_f%|%folders%
    ; 更新列表
renewList:
    GuiControlGet, folder, , folder
    If (!FileExist(folder))
        Return
    GuiControlGet, pattern, , pattern
    LV_Delete()
    LastChar := SubStr(folder, 0)
    if (LastChar = "\")
        folder := SubStr(folder, 1, -1) ;
    GuiControl, -Redraw, MyListView
    Loop Files, %folder%\%pattern%, D F
    {
        If (A_LoopFileSizeKB<1024)
            size:=A_LoopFileSizeKB "K"
        Else If (A_LoopFileSizeMB<1024)
            size:=Round(A_LoopFileSizeKB/1024, 2) "M"
        Else If (A_LoopFileSizeMB>1024)
            size:=Round(A_LoopFileSizeMB/1024, 2) "G"
        LV_Add("" ,A_LoopFileName, size)
    }
    GuiControl, +Redraw, MyListView
    LV_ModifyCol()
    LV_ModifyCol(2, 60)
    folders := GetSubFolder(folder)
    GuiControl, , folder,|%folder%|%folders%
Return

2script:
    Run, D:\2scripts
Return
course:
    Run, D:\4archiever\Univer
Return
work:
    Run %workspace%\doing
Return

; 脚本
dns:
    Run, %script%dns
Return

#IfWinActive, ahk_class AutoHotkeyGUI
    MButton::
        MouseGetPos, mouseX, mouseY
        MouseClick, L, XmouseX, YmouseY
        Sleep, 0.3
    ExitApp
    Escape::
    ExitApp
    CapsLock::
    ExitApp
    GuiClose:
    ExitApp
#IfWinActive