#!/bin/bash
#Ref: https://openocd.org/doc/html/Flash-Programming.html
#REf: https://www.baeldung.com/linux/run-script-different-working-dir
CUR_DIR=$(pwd)
cd STM32CubeMX
make all
cd $CUR_DIR
openocd -f board/stm32f429disc1.cfg -c "program STM32CubeMX/build/STM32CubeMX.elf verify reset exit"
