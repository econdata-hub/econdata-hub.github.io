* 时间序列②：单位根检验 dfuller
use gdp_china.dta, clear
* 1978-2013 中国实际GDP lny=对数 dlny=对数差分
tsset year

* (1) 水平值：带常数检验
dfuller lny
* Z(t)=0.19 > -2.97(5%临界值) → 不拒绝单位根

* (2) 怀疑有趋势：加trend再检验
dfuller lny, trend
* Z(t)=-2.34 > -3.56 仍不拒绝

* (3) 检验一阶差分
dfuller dlny
* Z(t)=-3.07 < -2.97 → 拒绝 → 平稳

* (4) PP检验做稳健性
pperron lny
* Z(t)=0.11 结论相同
* 判定：lny~I(1) dlny~I(0) 即增长率平稳
