# Thesis

Verilog语法

**assign:** 
       (1) 连续赋值语句: 数据流建模的基本语句，
       (2) 所有assign语句是并行执行的
       (3) assign #10 c = a | b;            // a或者b发生变化之后10个delay c变化
       (4) assign {a, b};                   // 将a和b按位并在一起
 

 **always/initial:**
       (1) 每个过程块initial/always语句都代表一个独立的过程。仿真时间0开始执行并且两种语句不能嵌套使用。
       (2) 如果initial块内包含多个行为语句，使用begin end进行组合。
       (3) initial语句和always语句，他们是行为级建模的两种基本语句。所有行为语句只能出现在这两种语句内。
       (4) 所有在always和initial模块中被赋值的信号都必须是reg型。

**glitches:**