# FinSql
本專案為資料庫期末報告，實作一個模擬的線上影集租借平台，重點在於 **資料庫設計、SQL 語法、交易機制、進階查詢與觸發器應用**，以 MariaDB 為主要開發環境。
---

## 📌 系統簡介

使用者可進行影集瀏覽、租借與歸還，系統會自動記錄罰金，並支援熱門影集統計、使用者罰金查詢等功能。

---

## 🗂️ 資料庫表格設計

- `Users`：使用者資料
- `Series`：影集主檔
- `Genres`：分類清單
- `SeriesGenres`：影集與分類多對多對應
- `Rentals`：租借紀錄
- `Penalties`：罰金紀錄

---

## 💡 核心功能實作

- 🔹 **資料表正規化設計（3NF）**
- 🔹 **複雜 SQL 查詢（JOIN、GROUP BY、子查詢）**
- 🔹 **建立 VIEW（熱門影集榜）**
- 🔹 **Stored Procedure**：計算使用者總罰金
- 🔹 **Trigger**：歸還逾期自動新增罰金紀錄
- 🔹 **Transaction 測試**：模擬 COMMIT / ROLLBACK 機制

---

## 🛠️ 技術環境

- 資料庫：MariaDB
- 操作工具：DBeaver
- 語法格式：SQL（標準）
- ER 圖工具：DB Designer / Draw.io（視情況）

---

## 📷 Demo 與測試

專案包含以下測試：
- 📈 熱門影集查詢
- 📬 使用者罰金累計
- ⚠️ 錯誤資料交易測試與回滾（ROLLBACK）
- ⚙️ 自動罰金新增（Trigger）
