#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

flag=100
a=2
#If, a==1
a::
    MsgBox, , , 1,
Return
#If