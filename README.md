✅ 第一步：建立新檔案（Markdown）

打開 Git Bash 或終端機，進入你的 work-log 資料夾：

cd ~/work-log


建立一個新的 .md 檔案：

mkdir -p 2025/09
nano 2025/09/2025-09-16.md


nano 是簡單的文字編輯器，用來寫內容。如果你是用 VS Code 或其他工具編輯也沒問題。

📄 範例內容（可複製）：
# 2025-09-16 工作日誌

## 今日完成
- 修正 GitHub push 問題
- 學會 git pull / push 流程

## 📝 明日待辦
- 開始記錄 API 規格文件

## 💡 備註
- 今天有掌握 Git 的節奏了 👍


按下 Ctrl + O 儲存，然後 Ctrl + X 離開 nano。

✅ 第二步：將檔案加入 Git 追蹤 & Commit
git add .
git commit -m "log: add work log for 2025-09-16"

✅ 第三步：Push 上 GitHub
git push origin main

✅ 完成啦 🎉
