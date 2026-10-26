* 面板数据①：xtset 与固定效应
use munnell.dta, clear
* 48个州 × 17年 州级生产函数
* lny=州生产总值对数 lnk1=公共资本
* lnk2=私人资本 lnlabor=就业对数

* (1) 声明面板结构(必做第一步)
xtset state year
* strongly balanced = 每个州都有17年

* (2) 面板描述统计：三个标准差
xtsum lny lnk1 lnlabor

* (3) 混合OLS：把面板当普通截面用
reg lny lnk1 lnk2 lnlabor
* lnk1 = +0.151 公共资本显著为正

* (4) 固定效应：吸收不随时间变化的州特征
xtreg lny lnk1 lnk2 lnlabor, fe
* lnk1 = -0.088 系数由正转负
