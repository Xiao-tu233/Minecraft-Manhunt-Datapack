# Minecraft-Manhunt-Datapack
A Manhunt Datapack supports multiple runners and hunters, compasses target switching and more!
一个支持多名 Hunter 和 Runner、
并允许指南针目标切换等功能的数据包！


> This project is documented in Chinese only and supports Minecraft 1.21.10 - 1.21.11 only
> This project does not accept pull requests or external contributions.
> 本项目不接受 PR 或外部贡献。
> 本项目 README 仅提供中文版本 且仅兼容 Minecraft 1.21.10 - 1.21.11

## License | 协议

© 2026 Xiao_tu233. All rights reserved.

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

按照一般的[数据包安装办法](https://zh.minecraft.wiki/w/Tutorial:%E5%AE%89%E8%A3%85%E6%95%B0%E6%8D%AE%E5%8C%85)即可

### 比赛前

比赛前所有玩家会禁止pvp 同时游戏模式会是和平模式 
如果玩家血量或者饱食度不满 可以`/reload`重载数据包来回满

#### Hunter 禁止活动时间调整
游戏开始之后 Hunter 会有默认有30秒的禁止活动时间供 Runner 提前开始发育
如果需要更改禁止活动的时间 需要更改变量 `#start_countdown` 单位是游戏刻(服务器不掉刻情况下的20分之1秒)
例如我希望更改禁止活动的时间到1分钟(1200 ticks):
```mcfunction
/scoreboard players set #random_team_runners var 1200
```

#### 关于分队

作为 Hunter 游戏:
```mcfunction
/trigger join_hunter
```

作为 Runner 游戏:
```mcfunction
/trigger join_runner
```

你事实上可以在游戏中的任何时候更换你的队伍 但是除非和所有人商量好 否则你不应该这么做

---

随机分队的函数: `manhunt:random_team`
随机分队会将**尚未加入任何队伍**的玩家
按默认 Runner : Hunter ≈ 1 : 1 的比例随机分配，^[1]
当参与随机分队的玩家总数为奇数时，
Runner 人数取总人数的一半并向下取整。
通过`#random_team_runners`变量来更改Runner的期望人数(不包括已选队玩家)

为了理解这些分队管理 这里是一些例子:
- 3名玩家参加游戏 玩家A作为 Runner 游戏, 玩家B、C 作为 Hunter 游戏:
    玩家A运行指令:
    ```mcfunction
    /trigger join_runner
    ```
    玩家B、C运行指令:
    ```mcfunction
    /trigger join_hunter
    ```

- 7名玩家参加游戏 随机3个玩家作为 Runner 游戏:
    由于 3 就是 7 的一半并向下取整 所以直接:
    ```mcfunction
    /function manhunt:random_team
    ```

- 6名玩家参加游戏 2个玩家作为 Runner 游戏:
    先:
    ```mcfunction
    /scoreboard players set #random_team_runners var 2
    ```
    回车后:
    ```mcfunction
    /function manhunt:random_team
    ```


- 6名玩家参加游戏 有一名玩家他由于一些原因 他希望自己作为Hunter 游戏 剩下玩家随机3个 Runner 和2个 Hunter
    先让这名有原因的玩家:
    ```mcfunction
    /trigger join_hunter
    ```
    由于我们的期望 直接随机分队并不能满足我们的要求(那会是2个Runner而不是3个) 手动调整 Runner 数量为3个:
    ```mcfunction
    /scoreboard players set #random_team_runners var 3
    ```
    然后运行:
    ```mcfunction
    /function manhunt:random_team
    ```

可能有些复杂 所以麻烦多看下这些例子

---

开始游戏: 作为 Runners 运行下述命令（不需要OP）
```mcfunction
/trigger start
```
开始游戏会清空玩家的背包和成就
当玩家作为 Hunter 或者游戏已经开始了的情况下 这个命令会被阻断

---

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
  如果任何 Runner **跳入[终末之池](https://zh.minecraft.wiki/w/%E8%BF%94%E5%9B%9E%E4%BC%A0%E9%80%81%E9%97%A8)**（也称末地池或返回传送门）即看到终末之诗, Runner 胜利
  
  任何一方胜利即游戏结束 所有玩家会切换为**创造模式**

### 比赛后
  
  如果希望再来一局:
  - 用`/stop`关闭服务器
  - 删除服务器根目录下的存档文件夹（默认 world，
    由 server.properties 中的 level-name 决定）中，
    除 datapacks 文件夹以外的所有文件和文件夹。
  - 重新开服
  
  单人档开放到局域网联机方式的办法也差不多 这里不提及

[^1]: 随机分队基于 @r 目标选择器实现，
结果受 Minecraft 原生随机机制影响。