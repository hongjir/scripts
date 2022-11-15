Time_13 = 580000
Time_D = 420000
Time_gd = 5000
w = dnplayer.exe

Gui, Add, Tab3,, 13-4|活动D|共斗|待测
Gui, Add, Edit, vCount_1
Gui, Tab, 2
Gui, Add, Edit, vCount_2
Gui, Tab, 3
Gui, Add, Edit, vCount_3
Gui, Tab, 4
Gui, Add, Edit, vCount_4
Gui, Tab
Gui, Add, Button, Default, Ok
Gui, show
return
GuiClose:
ButtonOK:
    Gui,Submit
    If (Count_1){
        While, Count_1 > 0{
            ControlSend, RenderWindow1, j,ahk_exe %w%
            Sleep, %Time_13%
            Count_1--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else IF (Count_2){
        While, Count_2 > 0{
            ControlSend, RenderWindow1, j,ahk_exe %w%
            Sleep, %Time_D%
            Count_2--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else If (Count_3){
        While, Count_3 > 0{
            ControlSend, RenderWindow1, j,ahk_exe %w%
            Sleep, %Time_gd%
            Count_3--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else If (Count_4){
        While, Count_4 > 0{
            ControlSend, RenderWindow1, j,ahk_exe %w%
            Sleep, %Time_13%
            Count_4--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else{
        MsgBox, 你怎么不输入啊？
        ExitApp
    }