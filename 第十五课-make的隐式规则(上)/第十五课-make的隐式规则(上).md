### make的隐式规则(上)

****

#### 问题

* 如果**同一目标的命令拆分的写到不同地方**，会发生什么？

#### 下面的程序怎么执行？为什么？

```makefile
.PHONY : all

all :
	@ehco "command-1"
VAR := test

all :
	@echo "all : $(VAR)"
```

**实验截图**

![image-20210429204840747](第十五课-make的隐式规则(上).assets/image-20210429204840747.png)

#### makefile中出现同名目标时

* 依赖：
  * 所有的依赖将合并在一起，成为目标的最终依赖

* 命令：
  * 当多处出现同一目标的命令时，make发出警告
  * 所有之前定义的命令被最终的命令取代

#### 注意事项

* 当使用`include`关键字包含其他文件时，**需要确保被包含的文件中的同名目标只有依赖，没有命令**；否则，同名目标的命令将被覆盖

**编程实验：命令的拆分**

```makefile
# 1.makefile
.PHONY : all

all :
	@echo "command-1"

all : 
	@echo "command-2"

VAR := test

all :
	@echo "all : $(VAR)"

include 1.mk
```

```makefile
# 1.mk

all :
	@echo "this is command from 1.mk"
```

**实验截图**

![image-20210429210000819](第十五课-make的隐式规则(上).assets/image-20210429210000819.png)

**工程经验：**

* makefile这样写会造成输出完全不符合预期，导致bug。建议不要这样写

#### 什么时隐式规则(built-in rules)?

* make提供了一些常用的，例行的规则实现
* **当相应的规则未提供时**，make尝试使用隐式规则

#### 下面的makefile能编译成功吗？为什么？

```makefile
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)


app.out : $(OBJS)
	$(CC) -o $@ $^
	$(RM) $^
	@echo "Target ==> $@"
```

**分析**

​	makefile里面根本就没有提供任何关于目标的规则，应该会出错

**实验截图**

![image-20210429210823753](第十五课-make的隐式规则(上).assets/image-20210429210823753.png)

**为什么和我们分析的不一样？**

​	make是怎么知道编译成.o文件的？

​	cc变量哪里来的，rm变量哪里来的？我们没有定义。

​	因为我们没有定义这些变量，makeJ会跑到它的标准库里面找有没有相关的隐式规则。

​	因为找到了这些规则，所以说能够编译出正确的结果。

​	CC c语言编译器，在linux实际上是gcc的软链接，RM rm-f命令

#### 初探隐式规则

* **make提供了生成目标文件的隐式规则**
* 隐式规则会**使用预定义变量**完成编译工作
* 改变预定义变量将部分改变隐式规则的行为
* **当存在自定义规则时**，不再使用隐式规则

#### 编程实验：初探隐式规则

```makefile
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

CC := gcc

#all :
#	@echo "$(.VARIABLES)"

app.out : $(OBJS)
	$(CC) -o $@ $^
	$(RM) $^
	@echo "Target ==> $@"

#%.o : %.c
#	@echo "my rule"
#	$(cc) -c -o $@ $^
```

#### 实验截图

![image-20210429230641521](第十五课-make的隐式规则(上).assets/image-20210429230641521.png)

#### 小结

* 当多处出现同一目标的命令时，**只有最后定义的命令有效**
* make提供了一系统的隐式规则可使用
* **当makefile中未定义相关规则时，尝试使用隐式规则**
* 隐式规则中**可能使用**make中的预定义变量
* **改变预定义变量**可部分改变预定于规则的行为