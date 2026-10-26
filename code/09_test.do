* 受约束回归：test 与 cnsreg
use nerlove.dta, clear
reg lntc lnq lnpl lnpk lnpf

* (1) 联合检验：三个要素价格同时=0？
test lnpl lnpk lnpf
* F(3,140)=9.81  p=0.0000 联合高度显著
* 注意：lnpl、lnpk 单个t检验均不显著

* (2) 线性约束：一次齐次性
test lnpl+lnpk+lnpf=1
* p=0.488 不能拒绝 → 与规模报酬不变一致

* (3) 把约束直接加进估计
constraint 1 lnpl+lnpk+lnpf=1
cnsreg lntc lnq lnpl lnpk lnpf, constraints(1)
* lnpl 标准误从 0.300 降到 0.207
