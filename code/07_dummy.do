* 虚拟变量 Dummy：0/1 编码的分类信息
use grilic.dta, clear
* 758名美国劳动者 lnw=ln(工资)
* rns:南方=1  mrt:已婚=1  smsa:大城市=1

* (1) 0/1变量直接进 reg，写法同连续变量
reg lnw s expr tenure rns mrt smsa

* (2) 因子变量写法 i.rns，结果完全等价
reg lnw s expr tenure i.rns i.mrt i.smsa

* (3) 交互项：教育回报在大城市是否更高
reg lnw expr tenure i.smsa##c.s
* smsa#c.s 行：p=0.572 不显著

* (4) 多分类(省份/行业/职位)：禁止1/2/3编码
*     正确写法 i.province，自动留基准组
