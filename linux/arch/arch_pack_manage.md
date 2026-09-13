Arch Linux 的包管理主要依赖 `pacman`（官方仓库）和 AUR 助手（如 `yay`/`paru`），以下是常用命令汇总：

### 一、pacman 核心命令（官方仓库）
#### 1. 系统更新
```bash
sudo pacman -Syu  # 同步仓库并更新系统（推荐）
sudo pacman -Sy   # 仅同步仓库索引
sudo pacman -Su   # 仅更新已安装包
```

#### 2. 安装包
```bash
sudo pacman -S <包名>          # 安装单个包
sudo pacman -S <包组名>        # 安装包组（如 sudo pacman -S gnome）
sudo pacman -U <本地包路径>    # 安装本地 .pkg.tar.zst 包
```

#### 3. 卸载包
```bash
sudo pacman -R <包名>          # 仅卸载包（保留配置）
sudo pacman -Rn <包名>         # 卸载包并删除配置文件
sudo pacman -Rs <包名>         # 卸载包及无用依赖
sudo pacman -Rns <包名>        # 彻底卸载（包+配置+依赖）
```

#### 4. 查询包信息
```bash
pacman -Q                      # 列出已安装所有包
pacman -Q <包名>               # 检查包是否安装
pacman -Qi <包名>              # 查看已安装包详细信息
pacman -Qs <关键词>            # 搜索已安装包
pacman -Si <包名>              # 查看仓库中包的信息
pacman -Ss <关键词>            # 搜索仓库中的包
pacman -Ql <包名>              # 列出包的所有文件
pacman -Qo <文件路径>          # 查看文件属于哪个包
pacman -Qtdq                   # 列出孤立依赖（无其他包依赖）
```

#### 5. 清理缓存
```bash
sudo pacman -Sc                # 清理旧版本缓存（保留当前版本）
sudo pacman -Scc               # 清理所有缓存
```

#### 6. 其他常用
```bash
sudo pacman -Fy                # 更新文件数据库
pacman -F <文件名>             # 搜索文件属于哪个包（需先更新数据库）
sudo pacman -D --asdeps <包名> # 将包标记为依赖
sudo pacman -D --asexplicit <包名> # 将包标记为显式安装
```

### 二、yay/paru 命令（AUR + 官方仓库）
yay/paru 兼容 pacman 命令，并扩展了 AUR 支持：

#### 1. 安装/更新
```bash
yay -S <包名>                  # 安装官方/AUR包
yay -Syua                      # 同步并更新系统+AUR包
yay -U <本地包>                # 安装本地包
```

#### 2. 搜索/查询
```bash
yay -Ss <关键词>               # 搜索官方+AUR包
yay -Qs <关键词>               # 搜索已安装包
yay -Si <AUR包名>              # 查看AUR包信息
```

#### 3. 卸载/清理
```bash
yay -Rns <包名>                # 卸载包（同pacman）
yay -Sc                        # 清理缓存
yay -Scc                       # 彻底清理缓存
yay -Yc                        # 清理孤立依赖（同 pacman -Rns $(pacman -Qtdq)）
```

#### 4. 其他AUR操作
```bash
yay -G <AUR包名>               # 克隆AUR包的PKGBUILD
yay -P -g                      # 查看yay配置
```

### 三、实用技巧
1. **修复损坏的包数据库**：
   ```bash
   sudo pacman -Syyu --overwrite '*'
   sudo pacman -Fs <文件名>      # 查找文件所属包
   ```

2. **导出/导入已安装包列表**：
   ```bash
   pacman -Qqe > pkglist.txt     # 导出显式安装包
   sudo pacman -S --needed - < pkglist.txt  # 导入安装
   ```

3. **AUR包编译失败处理**：
   ```bash
   yay -S --rebuild <包名>       # 强制重新编译
   ```

掌握这些命令足以应对日常包管理需求，`pacman` 负责官方仓库，`yay/paru` 兼顾 AUR，搭配使用更高效。
