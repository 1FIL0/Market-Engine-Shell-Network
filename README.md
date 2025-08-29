![](readme_assets/market_engine_shell_network.png)
# Market Engine Shell Network
## Overview
This repo contains various build systems and configurations for Market Engine, all done in BASH. In order to use this system, you must use either linux + bash or windows + MSYS2

## Notice
Compiling this project on Windows is tricky and may suffer from platform-specific bugs. 
Advanced users can attempt compilation from source, but a pre-built installer and archives are available at https://market-engine.xyz for a quick and stable setup.

## Base Setup
Create root market engine directory  
```
mkdir MarketEngine && cd MarketEngine
```  
Clone necessary repositories  
```
git clone https://github.com/1FIL0/Market-Engine-Client market_engine_client && git clone https://github.com/1FIL0/Market-Engine-API market_engine_api && git clone https://github.com/1FIL0/Market-Engine-Share market_engine_share && git clone https://github.com/1FIL0/Market-Engine-Shell-Network market_engine_shell_network && git clone https://github.com/1FIL0/Market-Engine-Assets market_engine_assets
```
Install GPU drivers with included opencl support and the opencl runtime

## Windows setup
Install MSYS2 from https://www.msys2.org/  
Add msys64\mingw64\bin to PATH.  
Open the MSYS2 mingw64 terminal  
```
pacman -Syu && pacman -S mingw-w64-x86_64-toolchain mingw-w64-x86_64-opencl-icd mingw-w64-x86_64-opencl-headers mingw-w64-x86_64-opencl-clhpp mingw-w64-x86_64-rapidjson mingw-w64-x86_64-openssl mingw-w64-x86_64-cmake mingw-w64-x86_64-make vim p7zip`
```  
If terminal closes after update, reopen and rerun the command  

Install Python https://www.python.org/  
Open PowerShell window  
Go to the MarketEngine root directory
```
# Create directories
New-Item -ItemType Directory -Force -Path "venvs\windows_x86_64" 

# Create venvs
python -m venv venvs\windows_x86_64\client_venv
python -m venv venvs\windows_x86_64\api_venv

# Install python client packages
& venvs\windows_x86_64\client_venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install keyring pyqt5 flask pyinstaller pyopencl
deactivate

# install python API packages
& venvs\windows_x86_64\api_venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install requests dotenv
deactivate
```

## Linux setup
Open terminal with bash shell
go to the MarketEngine root directory
```
# Install packages
sudo apt install python3 rapidjson-dev libssl-dev ocl-icd-opencl-dev opencl-headers opencl-clhpp-headers 7zip p7zip cmake make

# Create venvs and install packages
mkdir -p venvs/linux_x86_64/ && python3 -m venv venvs/linux_x86_64/client_venv venvs/linux_x86_64/api_venv && source venvs/linux_x86_64/client_venv/bin/activate && python3 -m pip install keyring pyqt5 flask pyinstaller pyopencl && deactivate && source venvs/linux_x86_64/api_venv/bin/activate && python3 -m pip install requests dotenv && deactivate
```

## After setup
Everything else happens in the shell network
```
cd market_engine_shell_network
```
Create gui windows and icons
```
cd configure && ./configure_qt_docs.sh && cd ..
```

## Make 7Zip Archives
```
cd make
```  
Windows Market Engine Client
```
./mkzip_client.sh PLATFORM=WINDOWS_X86_64 MAKE_BINARIES=TRUE
```
Windows Market Engine API
```
./mkzip_api.sh PLATFORM=WINDOWS_X86_64 MAKE_BINARIES=TRUE
```  
Linux Market Engine Client
```
./mkzip_client.sh PLATFORM=LINUX_X86_64 MAKE_BINARIES=TRUE
```
Linux Market Engine API
```
./mkzip_api.sh PLATFORM=LINUX_X86_64 MAKE_BINARIES=TRUE
```
The archives are stored in the market_engine_shell_network/zip folder

## Make AppImages
download the appimagetool from https://github.com/AppImage/appimagetool  
place the appimage tool in market_engine_shell_network/appimg  
```
cd make
```
Linux Market Engine Client
```
./mk_appimg_client PLATFORM=LINUX_X86_64 MAKE_BINARIES=TRUE
```
Linux Market Engine API
```
./mk_appimg_api PLATFORM=LINUX_X86_64 MAKE_BINARIES=TRUE
```
The appimages are stored in the market_engine_shell_network/appimg folder

## LICENCE
Market Engine is licenced under the GPL-V3.0 licence
