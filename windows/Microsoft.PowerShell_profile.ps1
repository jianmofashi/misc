# ========= Icons =========
# 让 ls / Get-ChildItem 显示文件和文件夹图标
Import-Module -Name Terminal-Icons

# ========= PSReadLine =========
# 改善 PowerShell 输入、补全、历史预测体验
Import-Module PSReadLine

Import-Module CompletionPredictor

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -Colors @{
   InlinePrediction = $PSStyle.Foreground.White + $PSStyle.Background.BrightBlack
}
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None

# 撤销
Set-PSReadLineKeyHandler -Key Ctrl+z -Function Undo

# 重做
Set-PSReadLineKeyHandler -Key Ctrl+y -Function Redo

# 删除光标前整行
Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine

# 删除光标后内容
Set-PSReadLineKeyHandler -Key Ctrl+k -Function ForwardDeleteLine



# ========= z.lua =========
# 智能目录跳转
$zLuaPath = "$HOME/z.lua/z.lua"

if ((Get-Command lua -ErrorAction SilentlyContinue) -and (Test-Path $zLuaPath)) {
    Invoke-Expression (& { (lua $zLuaPath --init powershell enhanced) -join "`n" })
}

# ========= Starship =========
# Prompt 主题；不要和 oh-my-posh 同时启用
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# ========= Oh My Posh =========
# 如果改用 Starship，下面这行不要启用
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression