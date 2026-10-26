* 时间序列①：tsset、滞后差分与自相关
use icecream.dta, clear
* 30期(周)冰淇淋消费与气温

* (1) 声明时间序列(必做第一步)
tsset time

* (2) 滞后L. 差分D. 前导F. 直接用
list consumption L.consumption D.consumption in 1/6

* (3) 先跑OLS基准
reg consumption price income temp

* (4) 自相关检验
estat dwatson     // DW：只能查表判一阶
estat bgodfrey    // BG：更通用
* DW=1.02 BG chi2=4.24 p=0.040 → 正自相关

* (5) Newey-West标准误：不治系数治推断
newey consumption price income temp, lag(3)
