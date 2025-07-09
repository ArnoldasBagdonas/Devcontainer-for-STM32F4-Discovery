# Devcontainer for STM32F4 Discovery

This project sets up a complete development environment for building and flashing applications onto an STM32F4 Discovery board.
It includes everything from compiler toolchains and debugging utilities to documentation generators and font packages — all inside a
Docker-based development container customized for use with Visual Studio Code's Devcontainer support and WSL2.

## USB Setup Workflow for WSL2 + Devcontainer

> **Important**: The USB device must be connected and attached to WSL **before launching the devcontainer or Docker image**.

WSL (Windows Subsystem for Linux) enables running a Linux environment on a Windows host. However, [connecting USB devices](https://learn.microsoft.com/en-us/windows/wsl/connect-usb) to
WSL requires specific setup. The following steps describe how to make a USB device, such as the STM32F4 Discovery board,
accessible within WSL and the devcontainer environment.

### Step 1. Install or Update `usbipd-win`

Download and install the latest version of usbipd-win from:

- [https://github.com/dorssel/usbipd-win/releases](https://github.com/dorssel/usbipd-win/releases)

### Step 2. Verify WSL Kernel Version

In PowerShell:

```powershell
wsl uname -a
```

Look for a kernel version ≥ **5.10.60.1**. If an update is needed, run:

```powershell
wsl --shutdown
wsl --update
```

### Step 3: Connect the USB Device

Plug the ST-LINK USB interface of the STM32F4 Discovery board into the host machine.

### Step 4: Identify the USB Device

In administrator PowerShell, list available USB devices:

```powershell
usbipd list
```

Locate the relevant bus ID (e.g., **4-4**).

### Step 5: Bind the USB Device

In the same administrator PowerShell session:

```powershell
usbipd bind --busid 4-4
```

### Step 6. Start WSL to Keep It Active

In a new PowerShell terminal (non-admin), start WSL:

```powershell
wsl
```

Inside the Linux shell, run:

```bash
lsusb  # note: should NOT yet show your device
```

### Step 7. Attach the USB Device to WSL

Back in non-admin PowerShell:

```powershell
usbipd attach --wsl --busid 4-4
```

### Step 8: Confirm Device Availability in WSL

Inside the Linux shell, run:
```bash
lsusb
```

The USB device should now appear and be accessible to Linux tools such as openocd.

## Building the Example

To perform an out-of-source build:

1. Create a directory for the build artifacts:
   ```bash
   mkdir build
   ```
2. Generate build files using cmake, providing the path to the toolchain file:
   ```bash
   cmake -B build/ -S . -DCMAKE_TOOLCHAIN_FILE=cmake/gcc_stm32f4.cmake
   ```
3. CMake will generate the build files in the `build/` directory based on the CMakeLists.txt file in the source code directory.

5. Build the project:
   ```bash
   cmake --build build/
   ```

6. The output binaries and artifacts will be placed in the `build/` directory, separate from the source files.

7. To flash the device (from the build directory), use the following target:
   ```bash
   cmake --build build/ --target flash
   ```

## Features Integrated in VSCode

The development environment integrates a set of preconfigured tasks and debugging configurations within Visual Studio Code to streamline building, flashing, and debugging firmware for the STM32F4 Discovery board.

### Tasks

Several tasks are defined to automate common operations. These can be accessed through `Ctrl+Shift+P` → `Run Task`:

-  flashWithOpenOCD

   Flashes the firmware binary to the STM32F4 Discovery board using OpenOCD:
   ```bash
   openocd -f interface/stlink-v2-1.cfg -f target/stm32f4x.cfg \
   -c "program ${command:cmake.launchTargetPath} verify reset" -c exit
   ```

-  startOpenOCD

   Launches the OpenOCD server in the background, using the stm32f429disc1.cfg board configuration. This step is required before initiating a debug session.

-  stopOpenOCD
   
   Terminates all active tasks, including OpenOCD. This task is automatically executed after a debug session concludes.

### Debug Configurations
Two debug configurations are included in `.vscode/launch.json`, accessible via the **Run and Debug panel**:
-  Debug

   Launches a debugging session using GDB (gdb-multiarch) by:

   -  Starting OpenOCD in the background.
   -  Loading the compiled ELF binary.
   -  Setting a breakpoint at main.
   -  Initiating the debugging session.
   -  Terminating OpenOCD upon exit.

-  Attach to running target
   
   Connects GDB to a target device already running under OpenOCD. This configuration does not reload the firmware and is useful for runtime inspection or debugging previously flashed applications.

## Getting Started

To get started with the examples, follow these steps:

1. Clone this repository: `git clone https://github.com/ArnoldasBagdonas/Devcontainer-for-STM32F4-Discovery.git`
2. Follow the instructions provided in README to build and run the example.

Make sure you have Docker installed and properly configured on your system.

## Contributing

Contributions to this repository are welcome! If you have additional examples, improvements, or bug fixes, feel free to submit a pull request. Please refer to the CONTRIBUTING.md file for guidelines on contributing.

## License

This repository is licensed under the MIT License. See the LICENSE.md file for more information.
