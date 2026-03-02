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

### 權限說明

- 普通成員：可填報本人日常稿件任務，查看公示與下載統計。
- 顏笑、趙德民：除上述外，另有同傳 / 解說任務專區。
- 汪峰：可使用統計與下載功能查看全員數據，並匯出報表。

