# 基于应用的 autohotkey 学习记录

## 一、鼠标菜单

### 预期功能

- 长按右键或者通过快捷键唤出菜单
- 点击按键快速启动软件 / 执行脚本

### 1. 菜单界面

#### 1.1 添加标签页

`Gui, Add, Tab3,X0 Y0 H%boxHeight% W%boxWidth% ,启动|工具|脚本|文件`

- Tab3 为标签页控件
- 定义标签页在界面中的位置、高度和宽度
- 一共四个分类，用 `|`隔开，默认界面可以在后面加 `||`

#### 1.2 添加按钮

`Gui, Add, Button, -Default X Y H W g{func}, name`

- -Default 表示不作为默认按钮
- 定义位置、高度其中
  - XN 表示控件相对窗口的绝对位置
  - X+N 表示控件相对于前一个控件右边缘的相对位置，负数也要加上 + 不然会被识别成绝对位置
  - Xp+N 表示相对于左边缘的相对位置，一般用于 box 中

详见 [官方手册](https://wyagd001.github.io/zh-cn/docs/commands/Gui.htm#PosSize)

#### 1.3 添加 ico

### 2. 函数功能
