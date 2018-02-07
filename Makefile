CFLAGS = -lpthread 
CFLAGS +=
CC=g++
PWD=$$PWD #还可以$(shell pwd)其他的不行
SRC=$(wildcard *.c)
SRC +=$(wildcard *.cpp)
OBJ=$(addprefix , $(addsuffix .o, $(basename $(SRC))))
TARGET= syn

all:$(TARGET)

$(TARGET):$(OBJ) 
	@echo 'Link' $(OBJ)
	$(CC) -o $(TARGET)  $(OBJ) $(CFLAGS)
	
.SUFFIX:.cpp .c .o
#%.o:%.cpp
.cpp.o:#这个顺序还是有用的
	@echo "Compile" $<
	$(CC) -c -o $@  $<

.c.o:#这个顺序还是有用的
	@echo "Compile" $<
	$(CC) -c -o $@  $<
	
.PHONY:clean#可以预防项目中出现名为clean的文件导致的覆盖make clean问题
clean:
	rm  -rf *.o $(TARGET)
	