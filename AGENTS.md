# Codex 專案說明

## 回覆規則

- 每次回答都使用繁體中文。
- 每次回答結束都要說「cool」。

## 專案介紹

這是演算法設計課程的專案，使用 C# 開發 Grasshopper Script Component。

## 必讀規則

- 新增、修改或刪除程式碼前，先讀取 `.AGENTS/CODE.md`。
- 執行任何 Git 動作前，先讀取 `.AGENTS/GIT.md`。
- 調整目錄或新增檔案前，先讀取 `.AGENTS/FOLDER_STRUCTURE.md`。

所有專案規劃原則統一存放在 `.AGENTS/`。

## 核心目錄

- `src/`：存放所有可重用的 C# 程式碼檔案（`.cs`）。
- `gh_scripts/`：存放 Grasshopper C# Script Component 的入口腳本。
- `docs/`：存放課程討論、設計決策與演算法說明等 Markdown 文件。

Grasshopper 入口腳本使用 `#load` 載入 `src/` 下的程式碼。共用邏輯只維護在 `src/`，不要複製到 `gh_scripts/`。
