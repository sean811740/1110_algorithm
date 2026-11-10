# 演算法設計課程專案

本專案用於演算法設計課程，並以 C# 實作可供 Grasshopper Script Component 使用的演算法元件。

## 開發流程

1. 將演算法與共用類別寫在 `src/` 的 `.cs` 檔案中。
2. 執行 `tools/Update-GhLoads.ps1`，更新 `gh_scripts/SourceFiles.csx`。
3. 將 Grasshopper 腳本儲存或匯出至 `gh_scripts/Main.csx`，並以此檔案作為 C# Script Component 的入口。
4. 將演算法推導、複雜度分析和討論紀錄在 `docs/`。

PowerShell 更新指令：

```powershell
./tools/Update-GhLoads.ps1
```

## 目錄

- `.AGENTS/`：Codex 與專案規則。
- `src/`：正式 C# 程式碼。
- `gh_scripts/`：Grasshopper 腳本入口。
- `docs/`：討論與說明文件。
- `tools/`：專案維護工具。

## `#load` 注意事項

`#load` 每次載入一個 C# 檔案，且相對路徑以目前腳本檔案所在位置為基準。`SourceFiles.csx` 會列出 `src/` 下所有 `.cs` 檔案，避免手動同步清單。

請保留 `Main.csx` 的實際檔案位置。若只把內容貼入未儲存的內嵌腳本，腳本可能沒有可供相對路徑解析的檔案位置。

目前架構假設使用支援現代 C# Script 與 `#load` 的 Rhino／Grasshopper 版本。
