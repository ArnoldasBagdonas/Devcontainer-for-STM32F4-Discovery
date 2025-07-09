cmake_minimum_required(VERSION 3.15)
project(STM32CubeMX C ASM)

set(PROJECT_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX)

# Use BIN_NAME from variant if defined, else fallback to project name
if(NOT DEFINED BIN_NAME OR BIN_NAME STREQUAL "")
  set(BIN_NAME ${PROJECT_NAME})
endif()

# Build output directory
set(BUILD_DIR ${CMAKE_BINARY_DIR}/${BIN_NAME})
file(MAKE_DIRECTORY ${BUILD_DIR})

# Preprocessor definitions
add_compile_definitions(
    USE_HAL_DRIVER
    STM32F429xx
)

# Include directories
include_directories(
    ${PROJECT_ROOT}/Core/Inc
    ${PROJECT_ROOT}/USB_HOST/App
    ${PROJECT_ROOT}/USB_HOST/Target
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Inc
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/include
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Core/Inc
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc
    ${PROJECT_ROOT}/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${PROJECT_ROOT}/Drivers/CMSIS/Include
)

# Source files
set(C_SOURCES
    ${PROJECT_ROOT}/Core/Src/main.c
    ${PROJECT_ROOT}/Core/Src/freertos.c
    ${PROJECT_ROOT}/Core/Src/stm32f4xx_it.c
    ${PROJECT_ROOT}/Core/Src/stm32f4xx_hal_msp.c
    ${PROJECT_ROOT}/Core/Src/stm32f4xx_hal_timebase_tim.c
    ${PROJECT_ROOT}/USB_HOST/App/usb_host.c
    ${PROJECT_ROOT}/USB_HOST/Target/usbh_conf.c
    ${PROJECT_ROOT}/USB_HOST/Target/usbh_platform.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fmc.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dsi.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
    ${PROJECT_ROOT}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
    ${PROJECT_ROOT}/Core/Src/system_stm32f4xx.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/croutine.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/list.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/queue.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/tasks.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/timers.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c
    ${PROJECT_ROOT}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c
    ${PROJECT_ROOT}/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c
)

set(ASM_SOURCES
    ${PROJECT_ROOT}/startup_stm32f429xx.s
)

# Add executable target
add_executable(${PROJECT_NAME}.elf
    ${C_SOURCES}
    ${ASM_SOURCES}
)

# Linker script path (adjust if needed)
set(LINKER_SCRIPT ${PROJECT_ROOT}/STM32F429ZITx_FLASH.ld)

# Linker options - MCU flags and linker script should come from toolchain
target_link_options(${PROJECT_NAME}.elf PRIVATE
    #-specs=nano.specs
    -T${LINKER_SCRIPT}
    -Wl,-Map=${BUILD_DIR}/${PROJECT_NAME}.map,--cref
    -Wl,--gc-sections
)

# Post build: generate hex, bin and display size
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${PROJECT_NAME}.elf> ${BUILD_DIR}/${PROJECT_NAME}hex
    COMMAND ${CMAKE_OBJCOPY} -O binary -S $<TARGET_FILE:${PROJECT_NAME}.elf> ${BUILD_DIR}/${PROJECT_NAME}.bin
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${PROJECT_NAME}.elf>
)

# Target to flash the device with OpenOCD
option(USE_SUDO "Use sudo when running OpenOCD" ON)

if(USE_SUDO)
    set(SUDO_COMMAND "sudo")
else()
    set(SUDO_COMMAND "")
endif()

add_custom_target(flash
    COMMAND ${CMAKE_COMMAND} -E echo "Flashing STM32 with OpenOCD..."
    COMMAND ${SUDO_COMMAND} openocd -f board/stm32f429disc1.cfg -c "program ${BUILD_DIR}/${PROJECT_NAME}.elf verify reset exit"
    DEPENDS ${PROJECT_NAME}.elf
)
# https://www.justinmklam.com/posts/2017/10/vscode-debugger-setup/
# openocd -f board/stm32f429disc1.cfg -c "program build/STM32CubeMX/STM32CubeMX.elf verify reset exit"

# Output directory for binaries
set_target_properties(${PROJECT_NAME}.elf PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${BUILD_DIR}
)

enable_language(ASM)
