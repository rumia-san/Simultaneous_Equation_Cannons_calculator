setlocal enabledelayedexpansion
@echo off

:: 打印帮助信息
echo **************************************************
echo *
echo *        連 慄 砲 固 定 式 计 算 方 法
echo *
echo * 设双方手卡和场上的卡的总数量为 A，那么：
echo * 从自己的额外卡组除外2只相同等级的XYZ怪兽和1只融合怪兽，
echo * 且这些怪兽的等级的合计要等于 A。
echo * 设每只XYZ怪兽的等级为 X，融合怪兽的等级为 Y，那么公式为：
echo *
echo *     2X + Y = A
echo *
echo * 适用效果：
echo * 选择对方场上1只表侧表示怪兽，
echo * 使除外的1只XYZ怪兽和1只融合怪兽的等级合计等于该怪兽的等级 B。即：
echo *
echo *     X + Y = B
echo *
echo * 联立求解
echo *
echo *     XYZ怪兽的等级 X 应为 A - B
echo *     融合怪兽的等级 Y 应为 2B - A
echo *
echo **************************************************

:input
set /p B="请输入对方场上表侧表示怪兽的等级 (B) （或输入 'exit' 退出）："

if /i "%B%"=="exit" goto end

set /a B=%B%

if %B% LEQ 0 (
    echo 等级必须大于0。请重新输入。
    goto input
)

:: 计算可能的组合
echo.
echo 可能的组合:
for /L %%X in (1,1,%B%) do (
    set /a Y=%B% - %%X
    if !Y! GEQ 1 (
        set /a A=2 * %%X + !Y!
        echo 若双方手牌和场上的卡的总数量: !A!，则有XYZ怪兽等级: %%X，融合怪兽等级: !Y!。
    )
)

goto input

:end
