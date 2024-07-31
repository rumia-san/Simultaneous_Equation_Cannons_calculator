# 设置PowerShell的输出编码为UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function CalculatePossibleCombinations {
    param (
        [int]$B
    )

    # 输出分析步骤
    Write-Output "`n可能的组合:"

    # 列出所有可能的X和Y组合以及对应的A值
    for ($X = 1; $X -le $B; $X++) { # 确保X不为0
        $Y = $B - $X
        if ($Y -ge 1) { # 确保Y不为0
            $A = 2 * $X + $Y
            Write-Output "若双方手牌和场上的卡的总数量: $A，则有XYZ怪兽等级: $X，融合怪兽等级: $Y。"
        }
    }
}

$help_message = @"
**************************************************
*
*        連 慄 砲 固 定 式 计 算 方 法
*
* 设双方手卡和场上的卡的总数量为 A，那么：
* 从自己的额外卡组除外2只相同等级的XYZ怪兽和1只融合怪兽，
* 且这些怪兽的等级的合计要等于 A。
* 设每只XYZ怪兽的等级为 X，融合怪兽的等级为 Y，那么公式为：
*
*     2X + Y = A
*
* 适用效果：
* 选择对方场上1只表侧表示怪兽，
* 使除外的1只XYZ怪兽和1只融合怪兽的等级合计等于该怪兽的等级 B。即：
*
*     X + Y = B
*
* 联立求解
*
*     XYZ怪兽的等级 X 应为 A - B
*     融合怪兽的等级 Y 应为 2B - A
*
* BY：露米娅 <rumia-san@outlook.com>
**************************************************
"@

Write-Host $help_message

while ($true) {
    # 用户输入
    $B = Read-Host "请输入对方场上表侧表示怪兽的等级 (B) （或输入 'exit' 退出）"
    if ($B -eq 'exit') {
        break
    }

    # 转换输入为整数并检查有效性
    try {
        $B = [int]$B
        if ($B -le 0) {
            Write-Output "等级必须大于0。请重新输入。"
            continue
        }
    } catch {
        Write-Output "输入无效。请输入有效的数字。"
        continue
    }

    CalculatePossibleCombinations -B $B
}
