# Monthly Performance Reports Generation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Generate one `YYYY-MM-performance.md` report per month for January through April 2026, by reading daily logs in this repo and querying the Notion task database.

**Architecture:** For each month, read all daily log files → query Notion database filtered by that month → synthesize into the 6-section report format → save to the same month folder → commit. Each month is fully independent and can be generated in parallel.

**Tech Stack:** Claude Code (Read, Glob, Write), Notion MCP (`mcp__claude_ai_Notion__notion-search`), git

---

## Report Format (apply to every task)

Output file: `2026/MM/2026-MM-performance.md`

```markdown
# 2026 年 MM 月 工作績效報告

## 一、執行摘要

（2-3 句話，本月整體成效高階概述）

## 二、主要完成事項

（依主題分類：風管會、中華徵信所、鄧白氏、金腦、行政、其他，
 列出本月已完成任務，說明做了什麼、達到什麼結果）

## 三、專案進度追蹤

（任務類型＝專案進度的任務，說明當前狀態、本月推進了什麼、有無阻礙）

## 四、例行業務執行狀況

（任務類型＝例行公事的任務，說明完成情形與品質）

## 五、遇到的挑戰與解決方式

（從每日記錄擷取重要障礙及克服方式，省略瑣碎日常）

## 六、下月工作計畫

（月底每日記錄的明日待辦 + Notion 尚未完成任務）
```

---

## Notion 查詢方法

Notion 資料庫 ID：`collection://2fc0cd17-d218-8011-b93d-000b2d424809`

使用 `mcp__claude_ai_Notion__notion-search` 搜尋當月任務，搜尋條件：
- `data_source_url`: `collection://2fc0cd17-d218-8011-b93d-000b2d424809`
- `filters.created_date_range.start_date`: 月份第一天（如 `2026-01-01`）
- `filters.created_date_range.end_date`: 月份最後一天（如 `2026-01-31`）

**重要**：Notion 的 `狀態` 欄位用「上週已完成」區分，但跨月查詢時應以 `實際完成日期` 落在當月為準。搜尋後需從結果頁面讀取 `實際完成日期` 欄位確認。

若搜尋結果不足，可補用 `mcp__claude_ai_Notion__notion-fetch` 直接讀取具體頁面。

---

## Task 1：2026 年 1 月績效報告

**Files:**
- Read: `2026/01/2026-01-*.md`（21 個每日記錄）
- Read reference: `2026/01/2026-01-summary.md`（個人月摘要，作為參考）
- Create: `2026/01/2026-01-performance.md`

- [ ] **Step 1：讀取 1 月所有每日記錄**

  讀取以下所有檔案（逐一 Read 或批次）：
  `2026/01/2026-01-02.md`, `2026-01-05.md`, `2026-01-06.md`, `2026-01-07.md`,
  `2026-01-08.md`, `2026-01-09.md`, `2026-01-12.md`, `2026-01-13.md`,
  `2026-01-14.md`, `2026-01-15.md`, `2026-01-16.md`, `2026-01-19.md`,
  `2026-01-20.md`, `2026-01-21.md`, `2026-01-22.md`, `2026-01-23.md`,
  `2026-01-26.md`, `2026-01-27.md`, `2026-01-28.md`, `2026-01-29.md`,
  `2026-01-30.md`

  同時讀取 `2026/01/2026-01-summary.md` 作為補充參考。

- [ ] **Step 2：查詢 Notion 1 月任務**

  執行 notion-search，條件：
  - query: `"2026 一月"` 或 `"1月"`
  - data_source_url: `collection://2fc0cd17-d218-8011-b93d-000b2d424809`
  - filters.created_date_range: `2026-01-01` ~ `2026-01-31`
  - page_size: 25

  記錄各任務的：名稱、任務類型、主題分類、狀態、實際完成日期。

- [ ] **Step 3：彙整並寫出報告**

  依「Report Format」章節的結構，將每日記錄內容與 Notion 任務資料合併撰寫。
  寫出 `2026/01/2026-01-performance.md`。

- [ ] **Step 4：commit**

  ```
  git add 2026/01/2026-01-performance.md
  git commit -m "Add 2026-01 performance report"
  ```

---

## Task 2：2026 年 2 月績效報告

**Files:**
- Read: `2026/02/2026-02-*.md`（20 個每日記錄）
- Read reference: `2026/02/2026-2-summary.md`
- Create: `2026/02/2026-02-performance.md`

- [ ] **Step 1：讀取 2 月所有每日記錄**

  讀取以下所有檔案：
  `2026/02/2026-02-02.md`, `2026-02-03.md`, `2026-02-04.md`, `2026-02-05.md`,
  `2026-02-06.md`, `2026-02-09.md`, `2026-02-10.md`, `2026-02-11.md`,
  `2026-02-12.md`, `2026-02-13.md`, `2026-02-16.md`, `2026-02-17.md`,
  `2026-02-18.md`, `2026-02-19.md`, `2026-02-20.md`, `2026-02-23.md`,
  `2026-02-24.md`, `2026-02-25.md`, `2026-02-26.md`, `2026-02-27.md`

  同時讀取 `2026/02/2026-2-summary.md` 作為補充參考。

- [ ] **Step 2：查詢 Notion 2 月任務**

  執行 notion-search，條件：
  - data_source_url: `collection://2fc0cd17-d218-8011-b93d-000b2d424809`
  - filters.created_date_range: `2026-02-01` ~ `2026-02-28`
  - page_size: 25

- [ ] **Step 3：彙整並寫出報告**

  依「Report Format」章節的結構寫出 `2026/02/2026-02-performance.md`。

- [ ] **Step 4：commit**

  ```
  git add 2026/02/2026-02-performance.md
  git commit -m "Add 2026-02 performance report"
  ```

---

## Task 3：2026 年 3 月績效報告

**Files:**
- Read: `2026/03/2026-03-*.md`（22 個每日記錄）
- Read reference: `2026/03/2026-03-summary.md`
- Create: `2026/03/2026-03-performance.md`

- [ ] **Step 1：讀取 3 月所有每日記錄**

  讀取以下所有檔案：
  `2026/03/2026-03-02.md`, `2026-03-03.md`, `2026-03-04.md`, `2026-03-05.md`,
  `2026-03-06.md`, `2026-03-09.md`, `2026-03-10.md`, `2026-03-11.md`,
  `2026-03-12.md`, `2026-03-13.md`, `2026-03-16.md`, `2026-03-17.md`,
  `2026-03-18.md`, `2026-03-19.md`, `2026-03-20.md`, `2026-03-23.md`,
  `2026-03-24.md`, `2026-03-25.md`, `2026-03-26.md`, `2026-03-27.md`,
  `2026-03-30.md`, `2026-03-31.md`

  同時讀取 `2026/03/2026-03-summary.md` 作為補充參考。

- [ ] **Step 2：查詢 Notion 3 月任務**

  執行 notion-search，條件：
  - data_source_url: `collection://2fc0cd17-d218-8011-b93d-000b2d424809`
  - filters.created_date_range: `2026-03-01` ~ `2026-03-31`
  - page_size: 25

- [ ] **Step 3：彙整並寫出報告**

  依「Report Format」章節的結構寫出 `2026/03/2026-03-performance.md`。

- [ ] **Step 4：commit**

  ```
  git add 2026/03/2026-03-performance.md
  git commit -m "Add 2026-03 performance report"
  ```

---

## Task 4：2026 年 4 月績效報告

**Files:**
- Read: `2026/04/2026-04-*.md`（22 個每日記錄）
- Read reference: `2026/04/2026-04-summary.md`
- Create: `2026/04/2026-04-performance.md`

- [ ] **Step 1：讀取 4 月所有每日記錄**

  讀取以下所有檔案：
  `2026/04/2026-04-01.md`, `2026-04-02.md`, `2026-04-03.md`, `2026-04-06.md`,
  `2026-04-07.md`, `2026-04-08.md`, `2026-04-09.md`, `2026-04-10.md`,
  `2026-04-13.md`, `2026-04-14.md`, `2026-04-15.md`, `2026-04-16.md`,
  `2026-04-17.md`, `2026-04-20.md`, `2026-04-21.md`, `2026-04-22.md`,
  `2026-04-23.md`, `2026-04-24.md`, `2026-04-27.md`, `2026-04-28.md`,
  `2026-04-29.md`, `2026-04-30.md`

  同時讀取 `2026/04/2026-04-summary.md` 作為補充參考。

- [ ] **Step 2：查詢 Notion 4 月任務**

  執行 notion-search，條件：
  - data_source_url: `collection://2fc0cd17-d218-8011-b93d-000b2d424809`
  - filters.created_date_range: `2026-04-01` ~ `2026-04-30`
  - page_size: 25

- [ ] **Step 3：彙整並寫出報告**

  依「Report Format」章節的結構寫出 `2026/04/2026-04-performance.md`。

- [ ] **Step 4：commit**

  ```
  git add 2026/04/2026-04-performance.md
  git commit -m "Add 2026-04 performance report"
  ```

---

## 注意事項

- May 2026 尚在進行中，本計畫不涵蓋。
- Task 1–4 互相獨立，可平行執行（使用 dispatching-parallel-agents）。
- Notion 查詢若回傳空白，改用 `mcp__claude_ai_Notion__notion-fetch` 直接讀取資料庫首頁後再 fetch 個別任務頁面。
