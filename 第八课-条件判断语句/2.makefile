.PHONY : test

var1 := 
var2 := $(var1)

var3 :=		# 定义了一个没有值的变量
var4 = $(var3)  # 递归赋值，无法在预处理时判断是否被定义所以var4打印出已经被定义

test:
    ifdef var1
	@echo "var1 is defined"
    else
	@echo "var1 is not defined"
    endif
  
    ifdef var2
	@echo "var2 is defined"
    else
	@echo "var2 is not defined"
    endif

    ifdef var3
	@echo "var3 is defined"
    else
	@echo "var is not defined"
    endif

    ifdef var4
	@echo "var 4 is defined"
    else
	@echo "var4 is not defined"
    endif
