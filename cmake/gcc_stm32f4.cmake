# Define the toolchain
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Define the toolchain path
#SET(TOOLCHAIN_PATH "/usr/bin")

# Define the toolchain prefix
SET(TOOLCHAIN_PREFIX "arm-none-eabi-")

# Define the sysroot
#SET(CMAKE_SYSROOT "/path/to/sysroot")

# Setting compilers
if(DEFINED TOOLCHAIN_PATH)
set(CMAKE_ASM_COMPILER   "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}gcc")        # Set path to assembler tool (using arguments "-x assembler-with-cpp")
set(CMAKE_C_COMPILER     "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}gcc")        # Set path to C compiler
set(CMAKE_CXX_COMPILER   "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}g++")        # Set path to C++ compiler
set(CMAKE_LINKER         "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ld")         # Set path to linker tool
set(CMAKE_OBJCOPY        "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}objcopy")    # Set path to object copy tool
set(CMAKE_RANLIB         "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ranlib")     # Set path to ranlib tool
set(CMAKE_SIZE_UTIL      "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}size")       # Set path to size tool
set(CMAKE_STRIP          "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}strip")      # Set path to strip tool
else()
set(CMAKE_AR             "${TOOLCHAIN_PREFIX}ar")                           # Set path to archive library tool
set(CMAKE_ASM_COMPILER   "${TOOLCHAIN_PREFIX}gcc")                          # Set path to assembler tool (using arguments "-x assembler-with-cpp")
set(CMAKE_C_COMPILER     "${TOOLCHAIN_PREFIX}gcc")                          # Set path to C compiler
set(CMAKE_CXX_COMPILER   "${TOOLCHAIN_PREFIX}g++")                          # Set path to C++ compiler
set(CMAKE_LINKER         "${TOOLCHAIN_PREFIX}ld")                           # Set path to linker tool
set(CMAKE_OBJCOPY        "${TOOLCHAIN_PREFIX}objcopy")                      # Set path to object copy tool
set(CMAKE_RANLIB         "${TOOLCHAIN_PREFIX}ranlib")                       # Set path to ranlib tool
set(CMAKE_SIZE_UTIL      "${TOOLCHAIN_PREFIX}size")                         # Set path to size tool
set(CMAKE_STRIP          "${TOOLCHAIN_PREFIX}strip")                        # Set path to strip tool
endif()

# Define the compiler and linker flags
#######################################
# CFLAGS
#######################################
# cpu
set(CPU "-mcpu=cortex-m4")

# fpu
set(FPU "-mfpu=fpv4-sp-d16")

# float-abi
set(FLOAT-ABI "-mfloat-abi=hard")

# mcu
set(MCU "${CPU} -mthumb ${FPU} ${FLOAT-ABI}")

# macros for gcc
# AS defines
set(AS_DEFS "")

# C defines
set(C_DEFS "-DUSE_HAL_DRIVER -DSTM32F429xx")


# link script
set(LDSCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/STM32CubeMX/STM32F429ZITx_FLASH.ld")

# libraries
set(LIBS "-lc -lm -lnosys")
set(LIBDIR "")

set(CMAKE_C_FLAGS "${MCU} ${C_DEFS}  --specs=nosys.specs -Wall -fdata-sections -ffunction-sections")
set(CMAKE_CXX_FLAGS "${MCU} ${C_DEFS} --specs=nosys.specs -Wall -fdata-sections -ffunction-sections")
set(CMAKE_ASM_FLAGS "-x assembler-with-cpp")
set(CMAKE_EXE_LINKER_FLAGS "${MCU} -specs=nano.specs ${LIBDIR} ${LIBS}")

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)