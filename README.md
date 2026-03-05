## 北京編譯中心稿件統計工具

一個基於 `Flask + SQLite` 的內部工具網站，用於北京編譯中心成員日常稿件、收片以及同傳 / 解說任務的填報、公示、統計與下載。

### 主要功能

- 無密碼登錄：從姓名列表中選擇即可進入系統。
- 日常稿件任務：多行粘貼稿件標題，自動識別 SOT / LVO / 干稿 / SB+LVO / 收片 等類別並統計。
- 同傳 / 解說任務：顏笑、趙德民可單獨填寫任務類別、時間段與內容。
- 數據公示：全員可按成員、日期範圍查看所有已填報數據。
- 統計與下載：自動生成個人及部門統計，支持導出 TXT、Word（docx）、Excel（xlsx）。

### 環境準備

1. 進入專案目錄：

```bash
cd "D:\\Ideas\\新建文件夹\\bj-editor-stats"
```

2. （建議）建立虛擬環境並安裝依賴：

```bash
py -3 -m venv venv
venv\\Scripts\\activate
pip install -r requirements.txt
```

如不使用虛擬環境，也可以在當前 Python 環境中直接安裝：

```bash
pip install -r requirements.txt
```

### 啟動方式

在 `bj-editor-stats` 目錄下執行：

```bash
set FLASK_APP=app.py
flask run
```

或直接：

```bash
python app.py
```

預設服務地址為 `http://127.0.0.1:5000/`，打開瀏覽器即可使用。

### 在 PythonAnywhere 部署與使用指南

如果你要把程序部署到 PythonAnywhere，以下是快速、可執行的流程。你可以把這些步驟直接放入密碼保護的腳本裡，或手動在網頁介面執行。

- 前置假設
  - 已有 PythonAnywhere 帳號並建立了一個 Web 應用（Python 3.x）。
- 代碼取得與更新
  - 設定好遠端倉庫，或手動上傳最新代碼。
  - 在 PythonAnywhere 的 Console/Cashbox 執行以下指令（請將 USERNAME 與 REPO_URL 替換成實際值）：

```
# 登入家目錄並取得專案
cd ~
git clone REPO_URL bj-editor-stats
cd bj-editor-stats

# 建立虛擬環境與安裝需求
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

- WSGI 與網頁伺服器設定
  - 建立/編輯 WSGI 配置（通常在 /var/www/yourusername_pythonanywhere_com_wsgi.py 中）。範例內容如下，請符合你專案的路徑：

```
import sys
import os

# 將專案路徑加入 Python 路徑
project_home = "/home/yourusername/bj-editor-stats"
if project_home not in sys.path:
    sys.path.insert(0, project_home)

from app import app as application  # Flask 入口
```

- 啟動與重載
  - 在 PythonAnywhere Web 設定頁，指向剛建立的 WSGI 檔案，並點擊 Reload。

- 第一次啟動後的初始化
  - 由於程式使用 SQLite，第一次執行時會自動建立 bj_editor_stats.db，且在 app context 中呼叫 db.create_all()，你只要完成一次就好。

- 驗證與操作
  - 透過日常頁 /daily/<你的名字> 輸入 普通收片數、複雜收片數，以及複雜收片詳情；
  - 確認「已保存收片記錄」會列出新增的紀錄；
  - 檢視 /stats 或 /export 下載的統計與報表，確保包含新紀錄。

- 變更回滙
  - 任何新功能或修正完成後，請到 PythonAnywhere Web 的新版本，點擊 Reload，使修改立即生效。

### 權限說明

- 普通成員：可填報本人日常稿件任務，查看公示與下載統計。
- 顏笑、趙德民：除上述外，另有同傳 / 解說任務專區。
- 汪峰：可使用統計與下載功能查看全員數據，並匯出報表。

