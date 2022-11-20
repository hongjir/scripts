; 允许用户最大化窗口或拖动来改变窗口的大小.
Gui +Resize

; 创建一些按钮:
Gui, Add, Button, Default gButtonLoadFolder, Load a folder
Gui, Add, Button, x+20 gButtonClear, Clear List
Gui, Add, Button, x+20, Switch View

; 通过 Gui Add 创建 ListView 及其列:
Gui, Add, ListView, xm r20 w700 vMyListView gMyListView, Name|In Folder|Size (KB)|Type
LV_ModifyCol(3, "Integer") ; 为了排序, 表示 Size 列中的内容是整数.

; 创建图像列表, 这样 ListView 才可以显示图标:
ImageListID1 := IL_Create(10)
ImageListID2 := IL_Create(10, 10, true) ; 大图标列表和小图标列表.

; 关联图像列表到 ListView, 然而它就可以显示图标了:
LV_SetImageList(ImageListID1)
LV_SetImageList(ImageListID2)

; 创建作为上下文菜单的弹出菜单:
Menu, MyContextMenu, Add, Open, ContextOpenFile
Menu, MyContextMenu, Add, Properties, ContextProperties
Menu, MyContextMenu, Add, Clear from ListView, ContextClearRows
Menu, MyContextMenu, Default, Open ; 让 "Open" 粗体显示表示双击时会执行相同的操作.

; 显示窗口并返回. 当用户执行预期的动作时
; 操作系统会通知脚本:
Gui, Show
return

ButtonLoadFolder:
    Gui +OwnDialogs ; 强制用户解除此对话框后才可以操作主窗口.
    FileSelectFolder, Folder,, 3, Select a folder to read:
    if not Folder ; 用户取消了对话框.
        return

    ; 检查文件夹名称的最后一个字符是否为反斜杠, 对于根目录则会如此,
    ; 例如 C:\. 如果是, 则移除这个反斜杠以避免之后出现两个反斜杠.
    LastChar := SubStr(Folder, 0)
    if (LastChar = "\")
        Folder := SubStr(Folder, 1, -1) ; 移除尾随的反斜杠.

    ; 计算 SHFILEINFO 结构需要的缓存大小.
    sfi_size := A_PtrSize + 8 + (A_IsUnicode ? 680 : 340)
    VarSetCapacity(sfi, sfi_size)

    ; 获取所选择文件夹中的文件名列表并添加到 ListView:
    GuiControl, -Redraw, MyListView ; 在加载时禁用重绘来提升性能.
    Loop %Folder%\*.*
    {
        FileName := A_LoopFileFullPath ; 必须保存到可写的变量中供后面使用.

        ; 建立唯一的扩展 ID 以避免变量名中的非法字符,
        ; 例如破折号. 这种使用唯一 ID 的方法也会执行地更好,
        ; 因为在数组中查找项目不需要进行搜索循环.
        SplitPath, FileName,,, FileExt ; 获取文件扩展名.
        if FileExt in EXE,ICO,ANI,CUR
        {
            ExtID := FileExt ; 特殊 ID 作为占位符.
            IconNumber := 0 ; 标记为未找到, 以便这些类型可以各自拥有一个唯一的图标.
        }
        else ; 其他的扩展名/文件类型, 所以要计算它们的唯一 ID.
        {
            ExtID := 0 ; 进行初始化来处理为更短的扩展名.
            Loop 7 ; 限制扩展名为 7 个字符, 这样之后计算的结果才能存放到 64 位值.
            {
                ExtChar := SubStr(FileExt, A_Index, 1)
                if not ExtChar ; 没有更多字符了.
                    break
                ; 通过给每个字符分配一个不同的比特位置, 来得到唯一 ID:
                ExtID := ExtID | (Asc(ExtChar) << (8 * (A_Index - 1)))
            }
            ; 检查此文件扩展名的图标是否已经在图像列表中. 如果是,
            ; 可以避免多次调用并极大提高性能,
            ; 尤其对于包含数以百计文件的文件夹而言:
            IconNumber := IconArray%ExtID%
        }
        if not IconNumber ; 此扩展名还没有相应的图标, 所以进行加载.
        {
            ; 获取与此文件扩展名关联的高质量小图标:
            if not DllCall("Shell32\SHGetFileInfo" . (A_IsUnicode ? "W":"A"), "Str", FileName
                , "UInt", 0, "Ptr", &sfi, "UInt", sfi_size, "UInt", 0x101) ; 0x101 为 SHGFI_ICON+SHGFI_SMALLICON
            IconNumber := 9999999 ; 把它设置到范围外来显示空图标.
            else ; 成功加载图标.
            {
                ; 从结构中提取 hIcon 成员:
                hIcon := NumGet(sfi, 0)
                ; 直接添加 HICON 到小图标和大图标列表.
                ; 下面加上 1 来把返回的索引从基于零转换到基于一:
                IconNumber := DllCall("ImageList_ReplaceIcon", "Ptr", ImageListID1, "Int", -1, "Ptr", hIcon) + 1
                DllCall("ImageList_ReplaceIcon", "Ptr", ImageListID2, "Int", -1, "Ptr", hIcon)
                ; 现在已经把它复制到图像列表, 所以应销毁原来的:
                DllCall("DestroyIcon", "Ptr", hIcon)
                ; 缓存图标来节省内存并提升加载性能:
                IconArray%ExtID% := IconNumber
            }
        }

        ; 在 ListView 中创建新行并把它和上面的图标编号进行关联:
        LV_Add("Icon" . IconNumber, A_LoopFileName, A_LoopFileDir, A_LoopFileSizeKB, FileExt)
    }
    GuiControl, +Redraw, MyListView ; 重新启用重绘(上面把它禁用了).
    LV_ModifyCol() ; 根据内容自动调整每列的大小.
    LV_ModifyCol(3, 60) ; 把 Size 列加宽一些以便显示出它的标题.
return

ButtonClear:
    LV_Delete() ; 清理 ListView, 但为了简化保留了图标缓存.
return

ButtonSwitchView:
    if not IconView
        GuiControl, +Icon, MyListView ; 切换到图标视图.
    else
        GuiControl, +Report, MyListView ; 切换回详细信息视图.
    IconView := not IconView ; 进行反转以为下次做准备.
return

MyListView:
    if (A_GuiEvent = "DoubleClick") ; 脚本还可以检查许多其他的可能值.
    {
        LV_GetText(FileName, A_EventInfo, 1) ; 从首个字段中获取文本.
        LV_GetText(FileDir, A_EventInfo, 2) ; 从第二个字段中获取文本.
        Run %FileDir%\%FileName%,, UseErrorLevel
        if ErrorLevel
            MsgBox Could not open "%FileDir%\%FileName%".
    }
return

GuiContextMenu: ; 运行此标签来响应右键点击或按下 Apps 键.
    if (A_GuiControl != "MyListView") ; 仅在 ListView 中点击时才显示菜单.
        return
    ; 在提供的坐标处显示菜单, A_GuiX 和 A_GuiY. 应该使用这些
    ; 因为即使用户按下 Apps 键, 它们也会提供正确的坐标:
    Menu, MyContextMenu, Show, %A_GuiX%, %A_GuiY%
return

ContextOpenFile: ; 用户在上下文菜单中选择了 "Open".
ContextProperties: ; 用户在上下文菜单中选择了 "Properties".
    ; 为了简化, 仅对焦点行进行操作而不是所有选择的行:
    FocusedRowNumber := LV_GetNext(0, "F") ; 查找焦点行.
    if not FocusedRowNumber ; 没有焦点行.
        return
    LV_GetText(FileName, FocusedRowNumber, 1) ; 获取首个字段的文本.
    LV_GetText(FileDir, FocusedRowNumber, 2) ; 获取第二个字段的文本.
    if InStr(A_ThisMenuItem, "Open") ; 用户在上下文菜单中选择了 "Open".
        Run %FileDir%\%FileName%,, UseErrorLevel
    else ; 用户在上下文菜单中选择了 "Properties".
        Run Properties "%FileDir%\%FileName%",, UseErrorLevel
    if ErrorLevel
        MsgBox Could not perform requested action on "%FileDir%\%FileName%".
return

ContextClearRows: ; 用户在上下文菜单中选择了 "Clear".
    RowNumber := 0 ; 这会使得首次循环从顶部开始搜索.
    Loop
    {
        ; 由于删除了一行使得此行下面的所有行的行号都减小了,
        ; 所以把行号减 1, 这样搜索里包含的行号才会与之前找到的行号相一致
        ; (以防选择了相邻行):
        RowNumber := LV_GetNext(RowNumber - 1)
        if not RowNumber ; 上面返回零, 所以没有更多选择的行了.
            break
        LV_Delete(RowNumber) ; 从 ListView 中删除行.
    }
return

GuiSize: ; 扩大或缩小 ListView 来响应用户对窗口大小的改变.
    if (A_EventInfo = 1) ; 窗口被最小化了. 无需进行操作.
        return
    ; 否则, 窗口的大小被调整过或被最大化了. 调整 ListView 的大小来适应.
    GuiControl, Move, MyListView, % "W" . (A_GuiWidth - 20) . " H" . (A_GuiHeight - 40)
return

GuiClose: ; 当窗口关闭时, 自动退出脚本:
ExitApp