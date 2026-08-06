# Minecraft-Manhunt-Datapack
A Manhunt Datapack supports multiple runners and hunters, compasses target switching and more!

一个支持多名 Hunter 和 Runner
并允许指南针目标切换等功能的数据包！！


> This project is documented in Chinese only and supports Minecraft 1.21.11 only
> This project does not accept pull requests or external contributions.
> 本项目不接受 PR 或外部贡献。
> 本项目 README 仅提供中文版本 且仅兼容 Minecraft 1.21.11

## License | 协议

© 2026 PictureIsHere, Pressnre. All rights reserved.

---

Permission is granted to download and use the official release versions of this project.

Modification, redistribution, or creation of derivative works from the source code is not permitted without explicit permission

This project is not open-source.

---

允许下载并使用本项目的官方发布版本（Release）。

未经明确许可，不得对源代码进行修改、再分发，或基于其创建衍生作品。

本项目不是开源项目。

---

## Usage | 使用

### 开启服务器

强烈推荐使用服务端而不是局域网来进行使用

如果希望游戏结束之后所有玩家退出就自动重启服务器 可以在server.properties里面 将function-permission-level调到4 所以数据包可以使用stop命令

使用下面的脚本来快速启动和重启服务器：

Windows:
```cmd
@echo OFF
@set a=0
:start
set /a a+=1
@title Manhunt Restart Times: %a%
if exist "world\data\command_storage_game_ends.dat" (
    rd /S /Q world
    rd /S /Q world_nether
    rd /S /Q world_the_end
    xcopy datapacks world\datapacks /S /I /Q
)
java -jar server.jar nogui
@echo [INFO] Manhunt Server will be restarting in 5 seconds!
@goto start
pause
```

Linux:
```
#!/usr/bin/env bash
a=0
cd "$(dirname "$0")" || exit 1
while true; do
    a=$((a + 1))
    printf '\033]0;Manhunt Restart Times: %s\007' "$a"
    if [ -f "world/data/command_storage_game_ends.dat" ]; then
        rm -rf world world_nether world_the_end
        mkdir -p world
        if [ -d "datapacks" ]; then
            cp -a datapacks world/datapacks
        fi
    fi
    java -jar server.jar nogui
    echo "[INFO] Manhunt Server will be restarting in 5 seconds!"
    sleep 5
done
```

如果使用了上述脚本 需要把数据包放在**服务器文件夹**下的datapacks文件夹中 而不是world下的 这样每次重置存档时会自动再把数据包添加到存档

### 比赛前

比赛开始前，所有玩家都会被禁止 PVP，同时游戏难度会被设置为**和平模式**。

如果玩家血量或饱食度未满，可以执行 `/reload` 重载数据包，将其恢复至满状态。

所有设置项都可以通过默认按键 **G** 打开的快捷操作对话框进行调整。

点击**随机分队**后，会根据当前设置的 **Runner 数量**，对所有在线玩家进行随机分队。^[1]
随机分队完成后，玩家仍然可以自行切换至其他队伍。

当 Runner 点击开始游戏后，所有 Hunter 都会被固定在原地，并开始倒计时。

**禁止活动时间**（Hunter 无法行动的时间）默认为：

> **30 秒 + 10 秒 × (Hunter 数量 − Runner 数量)**

例如：

* 1 名 Runner、3 名 Hunter：30 + 10 × (3 − 1) = **50 秒**
* 2 名 Runner、1 名 Hunter：30 + 10 × (1 − 2) = **20 秒**

---

通常情况下，当 Runner 离开当前维度时，正在追踪该 Runner 的 Hunter 的追踪指南针会指向 Runner 在该维度最后出现的位置。

如果关闭**跨维度追踪最后位置**选项，则 Hunter 只能知道 Runner 已离开当前维度，而无法获悉其最后所在位置，因此无法借此统一追踪路线。

---

当 Runner 离开或重新进入某位 Hunter 所在的维度时，正在追踪该 Runner 的 Hunter 会收到动作栏提示：

* **已失去追踪**
* **已重新获悉**

如果不希望显示这些提示，可以关闭**追踪状态变化通知**选项。

关闭后，Hunter 将不会收到任何动作栏通知，需要通过指南针状态、进度（成就）等其他方式判断 Runner 当前是否位于同一维度。

---

其余设置项都比较直观，可根据需要自行调整。

### 比赛中

所有 Hunter 会拥有一个指南针指向一名 Runner
Hunter 可以通过丢出指南针来切换追踪的 Runner

如果 Runner 之一在游戏中死亡 可以使用函数`manhunt:revive`重生:
- 需要OP权限:
  ```mcfunction
  /function manhunt:revive
  ```
- 或者让管理员复活比如玩家id为`Xiao_tu233`的 Runner:
  ```mcfunction
  /execute as Xiao_tu233 run function manhunt:revive
  ```

  如果所有 Runner 死亡, Hunter 胜利
  如果任何 Runner 达成胜利条件 Runner 胜利
  
Runner 的胜利条件可以通过设置项进行配置，共有以下三种选项：
* **跳入终末之池**：击杀末影龙后，跳入**终末之池**并进入终末之诗界面，即视为获胜。
* **击杀末影龙**：由玩家直接击杀末影龙即可获胜。如果末影龙并非由玩家直接击杀（例如床爆、自身伤害等），则仍可通过跳入终末之池达成胜利。
* **进入末地**：首次进入末地维度后立即获胜。

  任何一方胜利即游戏结束 所有玩家会切换为**创造模式**

### 比赛后

  如果你有将server.properties里面 将function-permission-level调到4 并且使用了推荐的启动脚本的话
  只需要让所有玩家退出服务器 服务器便会自动重置并重启服务器
  等重启结束进入游戏便可以开启一局新的游戏

  
  单人档开放到局域网联机方式的办法也差不多 这里不提及

[^1]: 随机分队基于 @r 目标选择器实现，
结果受 Minecraft 原生随机机制影响。
