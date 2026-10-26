* 时间序列③：协整检验与误差修正ECM
use consumption.dta, clear
* 人均GDP(y)与人均消费(c) 1978-2013
tsset year
gen lny = ln(y)
gen lnc = ln(c)

* (1) 两个I(1)序列直接回归(前车之鉴)
reg lnc lny
* 系数0.914 t=140 R²=0.998 拟合度极高

* (2) EG两步法：残差还平稳吗
predict ehat, resid
dfuller ehat
* Z(t)=-2.65 大于临界值 → 残差非平稳
* (3) Johansen协整检验(系统法)
varsoc lnc lny, maxlag(3)
vecrank lnc lny, lags(2)
* trace=12.02 < 15.41 → 5%下无协整
* (4) 误差修正模型
gen dlc = D.lnc
gen dly = D.lny
gen e_1 = L.ehat
reg dlc dly e_1
* e_1=-0.19 t=-2.77 显著为负
