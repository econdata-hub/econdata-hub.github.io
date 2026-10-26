* 面板数据②：随机效应与Hausman检验
use munnell.dta, clear
xtset state year

* (1) 随机效应 RE：个体效应视为随机扰动
xtreg lny lnk1 lnk2 lnlabor, re
* lnk1=-0.046 介于OLS(+0.151)和FE(-0.088)之间

* (2) Hausman检验：FE 还是 RE？
quietly xtreg lny lnk1 lnk2 lnlabor, fe
estimates store FE
quietly xtreg lny lnk1 lnk2 lnlabor, re
estimates store RE
hausman FE RE
* chi2(3)=33.92 p=0.0000 → 用FE

* (3) 补充：LM检验，混合OLS行不行
xttest0
* chibar2=3921 p=0.0000 → 有个体效应
