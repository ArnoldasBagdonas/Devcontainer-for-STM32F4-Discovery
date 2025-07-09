# gcc_stm32f4_toolchain.cmake
# Toolchain file for STM32F4 Cortex-M4 cross-compilation with arm-none-eabi-gcc

# Set the system name and processor architecture
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

# Specify the cross compiler prefix
set(TOOLCHAIN_PREFIX arm-none-eabi-)

# Specify the compilers
set(CMAKE_C_COMPILER   ${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}gcc)

# Specify objcopy and size tools
set(CMAKE_OBJCOPY      ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE         ${TOOLCHAIN_PREFIX}size)

# Compiler flags common for all languages
set(MCU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")
# set(MCU_FLAGS
#     -mcpu=cortex-m4
#     -mthumb
#     -mfpu=fpv4-sp-d16
#     -mfloat-abi=hard
# )

# C flags
set(CMAKE_C_FLAGS "${MCU_FLAGS} -Wall -fdata-sections -ffunction-sections")

# ASM flags
set(CMAKE_ASM_FLAGS "${MCU_FLAGS} -Wall -fdata-sections -ffunction-sections")

# Linker flags placeholder (usually set in CMakeLists.txt)
set(CMAKE_EXE_LINKER_FLAGS "${MCU_FLAGS} -specs=nano.specs -Wl,--gc-sections")

# Optionally disable standard libraries (you can override this in your project)
set(CMAKE_C_STANDARD_LIBRARIES "-lc -lm -lnosys")

# Set environment path if needed (uncomment and adjust if gcc is not in PATH)
# set(ENV{PATH} "/path/to/your/gcc/bin:$ENV{PATH}")

# Prevent CMake from using the host system's compiler
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
