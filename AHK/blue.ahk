w = dnplayer.exe
; Run D:/0programs/leidian/LDPlayer9/dnplayer.exe
; Sleep, 25000
; WinActivate, ahk_exe %w%
SetControlDelay, -1
; GameClick(820, 300, 2000)
; GameClick(820, 300, 30000)
; GameClick(1800, 130, 5000)
; GameClick(30, 280, 2000)
; ; 每日物资
; GameClick(180, 150, 500)
; GameClick(480, 150, 500)
; GameClick(700, 150, 500)
; ; 委托
; Loop, 10
;     GameClick(700, 450, 2500)

ControlClick, RenderWindow1, ahk_exe dnplayer.exe,, WD, 100, X200 Y200

GameClick(X, Y, T){
    ControlClick, RenderWindow1, ahk_exe dnplayer.exe,,,, X%X% Y%Y%
    Sleep, %T%
}