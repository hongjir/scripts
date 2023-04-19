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
#Include, lib/imgRec.ahk
return
wc(program, launch, direction=1, max=0, gap=0, tb=0, ta=0){
    waitAppear(program, launch, x, y, %direction%, max, gap, tb, ta)
    cc(x, y, program)
}
GuiClose:
ButtonOK:
    Gui,Submit
    If (Count_1){
        While, Count_1 > 0{
            program:="dnplayer.exe"
            needle:="D:/2scripts/AHK/img/挂机/13-4.png"
            wc(program, needle, 1, 0, 10, 0, 0)
            Count_1--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else IF (Count_2){
        While, Count_2 > 0{
            program:="dnplayer.exe"
            needle:="D:/2scripts/AHK/img/挂机/13-4.png"
            wc(program, needle, 1, 0, 10, 0, 0)
            Count_2--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else If (Count_3){
        While, Count_3 > 0{
            program:="dnplayer.exe"
            needle:="D:/2scripts/AHK/img/挂机/13-4.png"
            wc(program, needle, 1, 0, 10, 0, 0)
            Count_3--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else If (Count_4){
        While, Count_4 > 0{
            program:="dnplayer.exe"
            needle:="D:/2scripts/AHK/img/挂机/13-4.png"
            wc(program, needle, 1, 0, 10, 0, 0)
            Count_4--
        }
        MsgBox Fnish!
        ExitApp
    }
    Else{
        MsgBox, 你怎么不输入啊？
        ExitApp
    }