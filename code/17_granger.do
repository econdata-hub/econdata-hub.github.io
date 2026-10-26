* 时间序列④：格兰杰因果检验
use phillips.dta, clear
* 1948-2003 美国通胀率inf 失业率unem
tsset year

* (1) 先选VAR滞后阶数
varsoc inf unem, maxlag(4)
* AIC选4阶 HQIC/SBIC选1阶 折中取2

* (2) 估计VAR：两个方程互相包含对方滞后
var inf unem, lags(1/2)

* (3) 格兰杰因果检验
vargranger
* unem→inf : chi2=4.23  p=0.121 不拒绝
* inf→unem: chi2=21.80 p=0.000 拒绝
* 通胀领先失业，反向不显著 → 单向因果
