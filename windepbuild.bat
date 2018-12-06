set    WORK_DIR=%~dp0
set INSTALL_DIR=%~dp0\install_dir
set ZLIB_PATH=%~dp0\zlib\build

cd %WORK_DIR%

Rem git clone https://github.com/madler/zlib.git
cd zlib
mkdir build
cd    build
echo %~dp0
cmake .. -DCMAKE_INSTALL_PREFIX:STRING="%INSTALL_DIR%/zlib" -DCMAKE_GENERATOR_PLATFORM=x64

cmake --build . --config Release  --target install

cd %WORK_DIR%

Rem git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter
mkdir build
cd    build
echo %~dp0
cmake .. -DCMAKE_INSTALL_PREFIX:STRING="%INSTALL_DIR%/libxlsxwriter" -DZLIB_ROOT:STRING="%INSTALL_DIR%/zlib" -DCMAKE_GENERATOR_PLATFORM=x64

cmake --build . --config Release --target install

cd %WORK_DIR%
