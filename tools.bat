@echo off
echo === Checking Installed Tools ===

:: Icarus Verilog
"C:\iverilog\bin\iverilog.exe" -v
"C:\iverilog\bin\vvp.exe" -V

:: GTKWave
"C:\iverilog\gtkwave\bin\gtkwave.exe" --version

:: ARM GNU Toolchain (AArch64)
"C:\Program Files (x86)\Arm\GNU Toolchain mingw-w64-i686-aarch64-none-elf\bin\aarch64-none-elf-gcc.exe" --version

echo === All tools checked ===
pause
