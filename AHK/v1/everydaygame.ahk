#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

#Include, lib/imgRec.ahk

; 基础
If (not WinExist("ahk_exe dnplayer.exe")){
    Run, "D:\2scripts\AHK\shortcut\雷电模拟器"
    Sleep, 35000
}
program:="dnplayer.exe"
ad:=".\img\blue\广告.png"
launch:=".\img\blue\启动.png"
i13_4:=".\img\blue\再次前往13-4.png"
gold:=".\img\blue\物资.png"
oil:=".\img\blue\石油.png"
exp:=".\img\blue\经验.png"
comp:=".\img\blue\完成.png"
wt1:=".\img\blue\委托1.png"
wt2:=".\img\blue\委托2.png"
wt3:=".\img\blue\委托3.png"
wt4:=".\img\blue\委托4.png"
wt5:=".\img\blue\委托5.png"
hz1:=".\img\blue\后宅1.png"
hz2:=".\img\blue\后宅2.png"
hz3:=".\img\blue\后宅3.png"

cj:=".\img\blue\出击.png"
mr1:=".\img\blue\每日挑战1.png"
mr2:=".\img\blue\每日挑战2.png"
mr3:=".\img\blue\战术研修1.png"
mr4:=".\img\blue\战术研修2.png"
mr5:=".\img\blue\商船护卫1.png"
mr6:=".\img\blue\商船护卫2.png"
mr7:=".\img\blue\商船护卫3.png"
mr8:=".\img\blue\海域突进1.png"
mr9:=".\img\blue\海域突进2.png"
mr10:=".\img\blue\海域突进3.png"
mr11:=".\img\blue\斩首行动1.png"
mr12:=".\img\blue\斩首行动2.png"
mr13:=".\img\blue\斩首行动3.png"
fanhui:=".\img\blue\返回.png"

zhuxian:=".\img\blue\主线.png"
kn1:=".\img\blue\困难.png"
kn2:=".\img\blue\困难12-1.png"
kn3:=".\img\blue\关卡出击.png"
kn4:=".\img\blue\困难编队.png"
kn5:=".\img\blue\再次前往困难.png"

MsgBox, , , 开始,
Sleep, 1000
wc(program, launch,1, 0,0,2,50)
cc(200, 200, program)
Sleep, 5000
bt(program,, 0.5, 3)
cc(40, 280, program)
wc(program, gold, 1, 0, 0.5, 1, 0)
wc(program, oil, 1, 0, 0.5, 1, 0)
wc(program, exp, 1, 0, 0.5, 1, 0)
wc(program, comp, 1, 0, 0.5, 1, 0)
wc(program, wt1, 1, 0, 0.5, 2, 0)
wc(program, wt1, 1, 0, 0.5, 2, 0)
wc(program, wt1, 1, 0, 0.5, 2, 0)
wc(program, wt1, 1, 0, 0.5, 2, 0)
wc(program, wt2, 1, 0, 0.5, 2, 0)
Loop, 4{
    wc(program, wt3,2, 0,0.5,2,0)
    wc(program, wt4,2, 0,0.5,2,0)
    wc(program, wt5,2, 0,0.5,2,0)
    wc(program, wt3,2, 0,0.5,2,0)
}
wc(program, cj, 1, 0, 0.5, 1, 0)
wc(program, mr1, 1, 0, 0.5, 1, 0)
wc(program, mr3, 1, 0, 0.5, 1, 0)
wc(program, mr4, 1, 0, 0.5, 1, 0)
wc(program, mr2, 1, 3, 0.5, 1, 0)
wc(program, wt1, 1, 3, 0.5, 2, 0)

wc(program, fanhui, 1, 0, 0.5, 1, 0)

wc(program, mr5, 1, 3, 0.5, 1, 0)
wc(program, mr6, 1, 3, 0.5, 1, 0)
wc(program, mr7, 1, 3, 0.5, 1, 0)
wc(program, mr2, 1, 3, 0.5, 1, 0)
wc(program, wt1, 1, 3, 0.5, 2, 0)

wc(program, mr8, 1, 3, 0.5, 1, 0)
wc(program, mr9, 1, 3, 0.5, 1, 0)
wc(program, mr10, 1, 3, 0.5, 1, 0)
wc(program, mr2, 1, 3, 0.5, 1, 0)
wc(program, wt1, 1, 3, 0.5, 2, 0)

wc(program, mr11, 1, 3, 0.5, 1, 0)
wc(program, mr12, 1, 3, 0.5, 1, 0)
wc(program, mr13, 1, 3, 0.5, 1, 0)
wc(program, mr2, 1, 3, 0.5, 1, 0)
wc(program, wt1, 1, 3, 0.5, 2, 0)

wc(program, fanhui, 1, 0, 0.5, 1, 0)
wc(program, fanhui, 1, 0, 0.5, 1, 0)
wc(program, zhuxian, 1, 0, 0.5, 1, 0)

wc(program, kn1, 1, 3, 0.5, 1, 0)
wc(program, kn2, 1, 0, 0.5, 1, 0)
wc(program, kn3, 1, 0, 0.5, 1, 0)
wc(program, kn4, 1, 0, 0.5, 1, 0)
wc(program, kn5, 1, 0, 0.5, 150, 0)
wc(program, kn5, 1, 0, 0.5, 150, 0)

wc(program, launch, direction=1, max=0, gap=0, tb=0, ta=0){
    waitAppear(program, launch, x, y, %direction%, max, gap, tb, ta)
    cc(x, y, program)
}