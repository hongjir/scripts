shortcut:="D:\2scripts\AHK\shortcut\"
script:="D:\2scripts\script\"
workspace:="D:\1workspace\"
boxHeight=400
boxWidth=400
Gui, New,, TOOLS
Gui, -SysMenu Caption AlwaysOnTop
Gui, Add, Tab3, X0 Y0 H%boxHeight% W%boxWidth%, ����|����|�ļ�|�ű�|
; ������Ŀ--------------------------------------------------------------------
; Gui, Add, Text, border center BackgroundTrans X35 Y35 H40 W60 gopen, ����

Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png
Gui, Add, Button, -Default X35 Y35 H50 W60 gopen , ����
Gui, Add, Button, -Default X+10 H50 W60 gopen, ������
Gui, Add, Button, -Default X+10 H50 W60 gopen, �ٶ���
Gui, Add, Button, -Default X+10 H50 W60 gopen, Ѹ��
Gui, Add, Button, -Default X+10 H50 W60 gopen, Motrix

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, Billfish
Gui, Add, Button, -Default X+10 H50 W60 gopen, Ps
Gui, Add, Button, -Default X+10 H50 W60 gopen, Pr
Gui, Add, Button, -Default X+10 H50 W60 gopen, Blender
Gui, Add, Button, -Default X+10 H50 W60 gopen, clash

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, edge
Gui, Add, Button, -Default X+10 H50 W60 gopen, code
Gui, Add, Button, -Default X+10 H50 W60 gopen, terminal
Gui, Add, Button, -Default X+10 H50 W60 gopen, �׵�ģ����
Gui, Add, Button, -Default X+10 H50 W60 gopen, Zotero

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, scripts
Gui, Add, Button, -Default X+10 H50 W60 gopen, course
Gui, Add, Button, -Default X+10 H50 W60 gopen, doing
Gui, Add, Button, -Default X+10 H50 W60 gopen, archiever
Gui, Add, Button, -Default X+10 H50 W60 gopen, ͼƬ��

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, Joplin
Gui, Add, Button, -Default X+10 H50 W60 gopen, everything
Gui, Add, Button, -Default X+10 H50 W60 gopen, fastgithub
Gui, Add, Button, -Default X+10 H50 W60 gopen, mongo
Gui, Add, Button, -Default X+10 H50 W60 gopen, pgAdmin

Gui, Add, Button, -Default X35 Y+10 H50 W60 gopen, xtrans
Gui, Add, Button, -Default X+10 H50 W60 gopen, XMind
Gui, Add, Button, -Default X+10 H50 W60 gopen, edge
Gui, Add, Button, -Default X+10 H50 W60 gadminOpen, ע���༭��
Gui, Add, Button, -Default X+10 H50 W60 gadminOpen, ���������

; һЩ����------------------------------------------------------------------------------------------------
Gui, tab, 2
Gui, Add, Button, -Default X35 Y35 H50 W60 g��ͼ, ��ͼ
Gui, Add, Button, -Default X+10 H50 W60 gocr, ����ʶ��
Gui, Add, Button, -Default X+10 H50 W60 ,
Gui, Add, Button, -Default X+10 H50 W60 ,
Gui, Add, Button, -Default X+10 H50 W60 ,
; ����ģ����
IfWinActive, ahk_exe dnplayer.exe
{
    Gui, Add, Button, -Default X35 Y+10 H50 W60 ggame, �һ���

}

; ����
IfWinActive, ahk_exe Code.exe
{

}

; vscode
IfWinActive, ahk_exe Code.exe
{

}
; edge
IfWinActive, ahk_exe msedge.exe
{

}
; ps
IfWinActive, ahk_exe Photoshop.exe
{

}
; pr
IfWinActive, ahk_exe Adobe Premiere Pro.exe
{

}
; excel
IfWinActive, ahk_exe EXCEL.EXE
{

}
; word
IfWinActive, ahk_exe WINWORD.EXE
{

}
; ppt
IfWinActive, ahk_exe POWERPNT.EXE
{

}
; terminal
IfWinActive, ahk_exe Code.exe
{

}
; ��Դ������
IfWinActive, ahk_class CabinetWClass
{

}
; ΢��
IfWinActive, ahk_exe WeChat.exe
{

}
Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png
; �ļ��У�------------------------------------------------------------------------------------------------
Gui, tab, 3
folders := GetSubFolder("D:")
Gui, Add, Button, gpre_folder w30, ����
Gui, Add, ComboBox, vfolder grenewList x+10 w270, D:|%folders%
; Gui, Add, edit, vfolder gnewFolder w300, D:\2scripts\AHK
Gui, Add, ComboBox, vpattern grenewList x+10 w60, *||*.*|
; Gui, Add, edit, vpatten gnewFolder x+10 w60, *
GuiControlGet, folder, , folder
GuiControlGet, pattern, , pattern
Gui, Add, ListView, vMyListView gMyListView x15 y+10 r20 w380 xm, �ļ�|��С
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

; ���ֽű�------------------------------------------------------------------------------
Gui, tab, 4
Gui, Add, Button, -Default X+35 Y+10 H50 W60 gdns, flushdns
Gui, Add, Button, -Default X+10 H50 W60, terminal
Gui, Add, Button, -Default X+10 H50 W60, ����
Gui, Add, Button, -Default X+10 H50 W60, game
Gui, Add, Button, -Default X+10 H50 W60, ע���༭��
Gui, Add, Picture,x0 y0 H%boxHeight% W%boxWidth% +0x4000000, bac.png

showGui(boxWidth, boxHeight)

#Include, ./func/snipaste.ahk
Return
; ������------------------------------------------------------------------------------------------------
; ������ļ�������
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
; ������λ������ʾ����
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
; ���ݱ�ǩ��Ӧ�á��ű�
open(){
    global shortcut
    Run, %shortcut%%A_GuiControl%
    Return
}
; ����Ա��
adminOpen(){
    global shortcut
    Run *RunAs %shortcut%%A_GuiControl%
    Return
}
; ��ʾ����
showGui(boxWidth, boxHeight){
    getGuiPos(boxWidth, boxHeight, x, y)
    Gui, Show, X%x% Y%y%
    Return
}
; ��ǩ-------------------------------------------------------------------------------------------------
MyListView:
    if (A_GuiEvent = "DoubleClick")
    {
        LV_GetText(File, A_EventInfo, 1)
        LastChar := SubStr(File, 0)
        if (LastChar = "\")
            File := SubStr(File, 1, -1) ; �Ƴ�β��ķ�б��.
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
; ������һ��Ŀ¼�������Ÿ���
pre_folder:
    GuiControlGet, folder, , folder
    SplitPath, folder, , pre_f
    folders := GetSubFolder(pre_f)
    GuiControl, , folder,|%pre_f%|%folders%
; �����б�
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

; ����-------------------------------------
; ��ͼ��ͼ
��ͼ:
    Clipboard := ""
    Send, ^{PrintScreen}
    Gui, hide
    ClipWait,,1
    If DllCall("IsClipboardFormatAvailable", "UInt", 2){
        if DllCall("OpenClipboard", "uint", 0) {
            hBitmap := DllCall("GetClipboardData", "uint", 2)
            DllCall("CloseClipboard")
        }
        displayImg(hBitmap)
    }
    if DllCall("IsClipboardFormatAvailable", "UInt", 15){
        imgFile := Clipboard
        if(hBitmap := LoadPicture(imgFile))
            displayImg(hBitmap)
    }
Return
ocr:
    SendInput, {F4}
    Gui, Hide
ExitApp
game:
    Run, D:\2scripts\AHK\blue.ahk
ExitApp
; �ű�
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