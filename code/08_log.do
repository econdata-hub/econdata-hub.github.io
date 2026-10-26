* 对数模型：系数从"绝对量"变"百分比"
use nerlove.dta, clear
* 145家美国电力公司 tc=总成本 q=发电量
* 数据已含 lntc=ln(tc) lnq=ln(q)

* (1) 水平值回归：系数是绝对量
reg tc q
* q系数0.0064：多发电1单位，成本多0.0064

* (2) 双对数 log-log：系数=弹性
reg lntc lnq
* lnq系数0.709：产量增1%，成本仅增0.71%
* 弹性<1 → 平均成本随规模下降(规模经济)

* (3) 加入三要素价格，仍是双对数
reg lntc lnq lnpl lnpk lnpf

* (4) 半对数：只有一边取对数
* 上篇工资方程 reg lnw s expr ...
* s系数0.095：教育多1年，工资约+10%
