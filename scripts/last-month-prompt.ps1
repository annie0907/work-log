#Requires -Version 5.1
<#
產生「上個月」的工作摘要 Prompt，並複製到剪貼簿。
輸出內容會：
- 掃描 {{YYYY}}/{{MM}} 目錄（依電腦時間自動計算上個月）
- 產生摘要標題與目標輸出檔：{{YYYY}}/{{MM}}/{{YYYY}}-{{MM}}-summary.md
#>

$now = Get-Date
$lastMonthDate = $now.AddMonths(-1)
$yyyy = $lastMonthDate.ToString('yyyy')
$mm = $lastMonthDate.ToString('MM')

# 目標相對路徑（以專案根目錄為基準）
$targetDir = "$yyyy/$mm"
$targetFile = "$yyyy-$mm-summary.md"
$targetPath = "$targetDir/$targetFile"

# 確保資料夾存在（避免之後寫檔失敗）
New-Item -ItemType Directory -Path $targetDir -Force | Out-Null

$prompt = @"
請分析 $yyyy/$mm/ 資料夾中所有的 .md 檔案，生成一份 $yyyy 年 $mm 月的詳細工作摘要。

要求：
1. 仔細閱讀所有 markdown 檔案的內容
2. 按照以下結構生成繁體中文摘要：

# $yyyy 年 $mm 月 工作摘要

## 📊 本月概況
（用 2-3 段話總結本月的整體工作情況、主要焦點和工作節奏）

## ✅ 主要完成事項
（列出 5-10 項最重要的完成任務，用 bullet points，每項要簡短清晰，並每個 bullet point 中間需間隔一行）

## 🎯 重要進展與成果
（突出本月的關鍵成就、里程碑或突破，說明其重要性）

## 🤔 遇到的挑戰
（整理本月遇到的主要問題、障礙或困難，以及如何應對）

## 📚 學習與成長
（總結本月學到的新技能、新知識、經驗教訓）

## 🔮 下月重點目標
（根據「明日待辦」中的內容，提取出下個月應該優先處理的事項，並每個 bullet point 中間需間隔一行）

## 💡 其他觀察與建議
（其他值得記錄的觀察、趨勢或改進建議）

3. 請將生成的摘要直接寫入新檔案：$targetPath
4. 內容要詳細、有洞察力，不只是簡單列點
5. 在文件最後加上：

---
*🤖 由 AI 自動生成 *
"@

# 複製到剪貼簿，並在終端機顯示提示
try { Set-Clipboard -Value $prompt } catch {}
Write-Host "已將上月($yyyy-$mm)摘要 Prompt 複製到剪貼簿（若失敗，下方同時輸出文字可手動複製）。" -ForegroundColor Green
Write-Host "目標輸出檔：$targetPath"
Write-Host "請在 Cursor Chat 貼上即可。"
Write-Output $prompt


