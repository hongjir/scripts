#SingleInstance Force
#NoEnv

displayNum := 0
visibleState := true

F3::
	pasteToScreen(){
		if DllCall("IsClipboardFormatAvailable", "UInt", 1)
			displayText(Clipboard)
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
	}

displayText(text){
	global
	Gui, New, +hwndpasteText%displayNum% -Caption +AlwaysOnTop +ToolWindow -DPIScale
	local textHnd := pasteText%displayNum%
	Gui, Margin, 10, 10
	Gui, Font, s16
	Gui, Add, Text,, % text
	OnMessage(0x201, "move_Win")
	OnMessage(0x203, "close_Win")
	Gui, Show,, pasteToScreen_text
	transparency%textHnd% := 100
	displayNum++
}

displayImg(hBitmap){
	global
	Gui, New, +hwndpasteImg%displayNum% -Caption +AlwaysOnTop +ToolWindow -DPIScale
	local imgHnd := pasteImg%displayNum%
	Gui, Margin, 0, 0
	Gui, Add, Picture, Hwndimg%imgHnd%, % "HBITMAP:*" hBitmap
	OnMessage(0x201, "move_Win")
	OnMessage(0x203, "close_Win")
	Gui, Show,, pasteToScreen_img
	local img := img%imgHnd%
	ControlGetPos,,, width%imgHnd%, height%imgHnd%,, ahk_id %img%
	scale%imgHnd% := 100
	transparency%imgHnd% := 100
	displayNum++
}

move_Win(){
	PostMessage, 0xA1, 2
}

close_Win(){
	id := WinExist("A")
	transparency%id% := ""
	scale%id% := ""
	width%id% := ""
	height%id% := ""
	Gui, Destroy
}

#IfWinActive pasteToScreen

^WheelDown::
	decreaseTransparency(){
		id := WinExist("A")
		transparency%id% -= 5
		If (transparency%id% < 10)
			transparency%id% = 10
		transparency := transparency%id% * 255 // 100
		WinSet, Transparent, %transparency%, A
		tooltip, % "Opacity:" transparency%id% "%"
		SetTimer, RemoveToolTip, -500
	}

^WheelUp::
	increaseTransparency(){
		id := WinExist("A")
		transparency%id% += 5
		If (transparency%id% > 100)
			transparency%id% = 100
		transparency := transparency%id% * 255 // 100
		WinSet, Transparent, %transparency%, A
		tooltip, % "Opacity:" transparency%id% "%"
		SetTimer, RemoveToolTip, -500
	}

^MButton::
	resetTransparency(){
		id := WinExist("A")
		transparency%id% = 100
		WinSet, Transparent, 255, A
		tooltip, % "Opacity:" transparency%id% "%"
		SetTimer, RemoveToolTip, -500
	}

#IfWinActive pasteToScreen_img

~WheelDown::
	decreaseSize(){
		id := WinExist("A")
		img := img%id%
		scale%id% -= 10
		If (scale%id% < 10)
			scale%id% = 10
		WinGetPos,,, width, height
		width := width%id% * scale%id% // 100
		height := height%id% * scale%id% // 100
		GuiControl, MoveDraw, %img%, w%width% h%height%
		WinMove,,,,, width, height
		tooltip, % "Size:" scale%id% "%"
		SetTimer, RemoveToolTip, -500
	}

~WheelUp::
	increaseSize(){
		id := WinExist("A")
		img := img%id%
		scale%id% += 10
		WinGetPos,,, width, height
		width := width%id% * scale%id% // 100
		height := height%id% * scale%id% // 100
		GuiControl, MoveDraw, %img%, w%width% h%height%
		WinMove,,,,, width, height
		tooltip, % "Size:" scale%id% "%"
		SetTimer, RemoveToolTip, -500
	}

~MButton::
	resetSize(){
		id := WinExist("A")
		img := img%id%
		scale%id% = 100
		width := width%id%
		height := height%id%
		GuiControl, MoveDraw, %img%, w%width% h%height%
		WinMove,,,,, width, height
		tooltip, % "Size:" scale%id% "%"
		SetTimer, RemoveToolTip, -500
	}

#IfWinActive

^!3::
	toggleClickThroughState(){
		WinGet, id, List, pasteToScreen
		Loop, %id%
		{
			this_id := id%A_Index%
			WinSet, ExStyle, ^0x20, ahk_id %this_id%
		}
	}

+F3::
	toggleVisibleState(){
		global visibleState
		if(visibleState){
			WinGet, id, List, pasteToScreen
			Loop, %id%
			{
				this_id := id%A_Index%
				WinHide, ahk_id %this_id%
			}
			visibleState := false
		} else {
			DetectHiddenWindows, On
			WinGet, id, List, pasteToScreen
			Loop, %id%
			{
				this_id := id%A_Index%
				WinShow, ahk_id %this_id%
			}
			DetectHiddenWindows, Off
			visibleState := true
		}
	}

^F3::
	destroyAllPaste(){
		WinGet, id, List, pasteToScreen
		Loop, %id%
		{
			this_id := id%A_Index%
			SendMessage, 0x203,,,, ahk_id %this_id%
		}
	}

^+F3::ExitApp

RemoveToolTip:
	ToolTip
return