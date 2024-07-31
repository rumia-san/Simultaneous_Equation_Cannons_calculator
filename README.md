# 使用方法
运行脚本，输入对手怪兽的等级或阶级并回车，脚本就会输出所有可能的组合

Enter the Level or Rank of the monster your opponent control, this script will output all possible combinations

# 連 慄 砲 固 定 式 计 算 方 法
设双方手卡和场上的卡的总数量为 A，那么：

从自己的额外卡组除外2只相同等级的XYZ怪兽和1只融合怪兽，

且这些怪兽的等级的合计要等于 A。

设每只XYZ怪兽的等级为 X，融合怪兽的等级为 Y，那么公式为：

    2X + Y = A

适用效果：

选择对方场上1只表侧表示怪兽，

使除外的1只XYZ怪兽和1只融合怪兽的等级合计等于该怪兽的等级 B。即：

    X + Y = B

联立求解

    XYZ怪兽的等级 X 应为 A - B
    融合怪兽的等级 Y 应为 2B - A


BY：露米娅 <rumia-san@outlook.com>
