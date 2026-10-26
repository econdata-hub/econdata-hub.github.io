* 二值选择①：LPM、logit 与 probit
use titanic.dta, clear
* 泰坦尼克2201人 survive=生还(0/1)
* female=女性 child=儿童 class2/3/4=舱位
* 数据按特征汇总过，freq=每组人数

* (1) 线性概率模型 LPM：直接reg
reg survive child female class2 ///
    class3 class4 [fw=freq]
* female=+0.491 生还概率高49个百分点

* (2) logit，or 选项报告几率比
logit survive child female class2 ///
    class3 class4 [fw=freq], or
* female几率比=11.25

* (3) probit：换一种分布假设
probit survive child female class2 ///
    class3 class4 [fw=freq]
