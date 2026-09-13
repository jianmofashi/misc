# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space
setopt hist_ignore_all_dups

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cjw/.zshrc'

autoload -Uz compinit
compinit
setopt correct

# 补全时忽略大小写（输入 YAY 能补全 yay）
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# 补全菜单彩色显示（和 ls --color 一致）
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 补全时显示文件类型图标（需系统支持，可选）
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'


# 格式：[用户名 当前路径] %
# PROMPT='[%n %~] %' 


alias ls='ls --color=auto'    # ls 彩色显示
alias ll='ls -l'              # 详细列表
alias la='ls -la'             # 显示所有文件（包括隐藏）
alias pacman='sudo pacman'    # 无需重复输 sudo
alias update='sudo pacman -Syu'  # 一键更新系统
alias clean='sudo pacman -Sc'    # 清理缓存


# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
