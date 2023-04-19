#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1

#Include, .\lib\GDIP.ahk
#Include, .\lib\Gdip_ImageSearch.ahk

waitAppear(screenExe, imgPath, ByRef x, ByRef y, SearchDirection, max=0, gap=0, tb=0, ta=0){
    Sleep, % tb*1000
    gdipToken := Gdip_Startup()
    WinGet, pwnd, ID, ahk_exe %screenExe%, , ,
    needle:=Gdip_CreateBitmapFromFile(imgPath)
    If (max!=0)
        l=1
    Loop,
    {
        hscreen:=Gdip_BitmapFromHWND(pwnd)
        pick:=Gdip_ImageSearch(hscreen, needle, x, y,SearchDirection=%SearchDirection%)
        If (max!=0){
            l+=1
            If (l>max){
                x=0
                y=0
                Break
            }
        }
        Gdip_DisposeImage(hscreen)
        Sleep, % gap*1000
    }
    Until pick==1
    Gdip_DisposeImage(hscreen)
    Gdip_DisposeImage(needle)
    Gdip_Shutdown(gdipToken)
    Sleep, % ta*1000
}

cc(x, y, program){
    ControlClick, RenderWindow1, ahk_exe %program%, , L, ,X%x% Y%y%
}
bt(program, key="{Esc}", gap=0, times=1){
    Loop, times{
        Sleep, % gap*1000
        ControlSend, RenderWindow1, %key%, ahk_exe %program%
    }
}