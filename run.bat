@echo off
chcp 65001 >nul

REM 1. 切换到当前脚本所在目录
cd /d "%~dp0"

REM 2. 如果还没有虚拟环境，就创建一个
if not exist "venv\Scripts\python.exe" (
    echo 正在創建虛擬環境，首次運行會稍微久一點...
    py -3 -m venv venv
)

REM 3. 啟動虛擬環境
call "venv\Scripts\activate.bat"

REM 4. 安裝依賴（已安裝的會自動跳過）
echo 正在安裝依賴...
pip install -r requirements.txt

REM 5. 啟動 Flask 應用
echo 正在啟動服務...
start "" "http://127.0.0.1:5000"
python app.py

REM 6. 關閉時提示
echo.
echo 服務已停止，請按任意鍵關閉窗口...
pause >nul