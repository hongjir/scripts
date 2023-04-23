#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
; 热字串------------------------------
; 当前时间
::/now::
    FormatTime, CurrentDateTime,, yyy-MM-dd HH:mm:ss
    Send %CurrentDateTime%
return
; 一些信息
::/p2::17820488502
::/ahj::honji5022@hotmail.com
::/azc::zc_001@hotmail.com
::/aq1::2840994755@qq.com
::/aq2::1423293579@qq.com
