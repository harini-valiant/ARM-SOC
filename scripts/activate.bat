@echo off
echo === Activating FPGA/SoC toolchain environment ===

:: Icarus Verilog
set IVERILOG="C:\iverilog\bin\iverilog.exe"
set VVP="C:\iverilog\bin\vvp.exe"

:: GTKWave
set GTKWAVE="C:\iverilog\gtkwave\bin\gtkwave.exe"

:: ARM GNU Toolchain (AArch64)
set ARMCC="C:\Program Files (x86)\Arm\GNU Toolchain mingw-w64-i686-aarch64-none-elf\bin\aarch64-none-elf-gcc.exe"

echo Tools registered:
echo   Icarus Verilog = %IVERILOG%
echo   VVP runtime    = %VVP%
echo   GTKWave        = %GTKWAVE%
echo   ARM GCC        = %ARMCC%

echo === Environment ready ===
REM %IVERILOG% -o hello.exe hello.v
REM %VVP% hello.exe
REM %GTKWAVE% hello.vcd
REM %ARMCC% -mcpu=cortex-a53 -O2 -o gpio_driver.elf gpio_driver.c
