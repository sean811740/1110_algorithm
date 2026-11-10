# 目錄結構原則

```text
.
├─ .AGENTS/                  Codex 與專案規則
├─ docs/                     討論與說明文件
├─ gh_scripts/               Grasshopper 腳本入口
│  ├─ Main.csx               主要入口
│  └─ SourceFiles.csx        自動產生的 #load 清單
├─ src/                      可重用的 C# 程式碼
├─ tools/                    專案維護工具
│  └─ Update-GhLoads.ps1     更新 #load 清單
├─ .gitignore
├─ AGENTS.md                 Codex 專案入口說明
└─ README.md                 給開發者閱讀的專案說明
```

## `.AGENTS/`

- 所有 Codex 規則與專案規劃原則放在這裡。
- 規則依用途拆分，不在多個檔案重複維護相同內容。

## `src/`

- 存放所有正式 C# 程式碼，副檔名使用 `.cs`。
- 每個檔案聚焦一個主要類別或職責。
- 演算法與 Grasshopper 輸入輸出的轉接邏輯分開。
- 不放討論文件、建置輸出或 Grasshopper 定義檔。

## `gh_scripts/`

- `Main.csx` 是 Grasshopper C# Script Component 的主要入口，應保留為有明確路徑的腳本檔案。
- `SourceFiles.csx` 由 `tools/Update-GhLoads.ps1` 產生，不手動編輯。
- 不複製 `src/` 的實作，使用 `#load` 引用來源檔案。
- 若有多個元件，可各自建立具描述性的 `.csx` 入口檔。

## `docs/`

- 使用 Markdown 記錄討論、需求、演算法推導、複雜度分析與設計決策。
- 檔名使用小寫英文與連字號，例如 `shortest-path.md`。

## `tools/`

- 只放維護專案所需的腳本。
- 工具不得包含演算法的正式實作。
