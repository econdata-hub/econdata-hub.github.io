* 二值选择②：margins 与预测评价
use titanic.dta, clear
quietly logit survive child female class2 ///
    class3 class4 [fw=freq]

* (1) 平均边际效应 AME
margins, dydx(female child)
* female=+0.395 生还概率高40个百分点

* (2) 指定人群的预测概率
margins, at(female=(0 1) child=1)
* 男童生还率41.7% 女童87.4%

* (3) 样本内预测表现
estat clas
* 正确分类率 77.8%
