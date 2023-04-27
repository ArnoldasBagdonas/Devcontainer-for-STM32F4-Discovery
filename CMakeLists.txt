cmake_minimum_required(VERSION 3.10)

# Set the toolchain file
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/gcc_stm32f4.cmake)

# Define project name, languages, version, and description
project(STM32F429ZITx_HelloWorld
        VERSION 1.0
        DESCRIPTION "A simple 'Hello World' program for the STM32F429ZITx microcontroller."
        LANGUAGES C ASM)

######################################
# source
######################################
# C sources
set(C_SOURCES
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/main.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/freertos.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/stm32f4xx_it.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/stm32f4xx_hal_msp.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/stm32f4xx_hal_timebase_tim.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/USB_HOST/App/usb_host.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/USB_HOST/Target/usbh_conf.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/USB_HOST/Target/usbh_platform.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dsi.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Src/system_stm32f4xx.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/croutine.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/list.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/queue.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/tasks.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/timers.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c
)

# ASM sources
set(ASM_SOURCES
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/startup_stm32f429xx.s
)

# Specify the source files
add_executable(${PROJECT_NAME} 
    ${C_SOURCES}
    ${ASM_SOURCES}
)


# AS includes
set(AS_INCLUDES
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Inc
)

# C includes
set(C_INCLUDES
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Core/Inc
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/USB_HOST/App
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/USB_HOST/Target
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/include
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Inc
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include
${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/Drivers/CMSIS/Include
)

# Add an include directory to the include path for both C and assembler code
target_include_directories(${PROJECT_NAME} PRIVATE
    ${C_INCLUDES}
    ${AS_INCLUDES}
)

# Set the suffix of the output file to .elf and specify the linker script file
set_target_properties(${PROJECT_NAME} PROPERTIES
    SUFFIX ".elf"
    LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/STM32F429ZITx_FLASH.ld"
)

# Define a custom command to run the target without a debugger
add_custom_command(TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND openocd -f board/stm32f429disc1.cfg -c "program ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.elf verify reset exit"
        COMMENT "Executing ${PROJECT_NAME} without a debugger...")
# https://www.justinmklam.com/posts/2017/10/vscode-debugger-setup/
