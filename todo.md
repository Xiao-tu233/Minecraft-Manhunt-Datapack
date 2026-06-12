- [x] 分离一些主包的内容(一些非主逻辑功能)到extra pack
- [x] 对离线玩家进行管理: uid
- [x] 编写设置项对话框界面 同时实现里面提到的功能
      {
      [x]   random_team_runners: 1,
      [x]   start_cooldown: 600s, 
      [x]   difficulty: "peaceful", 
      [x]   track_last_position_across_dimensions: true,  "runner 在不同维度时, 追踪他的hunter所持的指南针 是显示玩家在这个维度最后一次出现的坐标还是直接乱指(丢失)"
      [x]   notify_tracking_status_change: true, "当runner切换维度时 (进入当前维度/退出当前维度时) 是否要通知显示: "已重新获悉" 或者 "已丢失追踪" "
      [x]   locator_bar: false, 
      [x]   summons_piglin_brutes: false,
      [x]   runner_winning_condition: "Killing the Ender Dragon" | "Hopped into the Fountain" | "Got to The End"
      }
- [x] Timer should be modifiable to be turned on/off: Action bar should be re-written that 不应该用覆盖的方式来显示 而应该通过目前分数来管理玩家应该显示的内容
- [x] Trace back health when game ends

- [x] 猎人无法行动的时候动作栏不对
- [ ] 在游戏开始之后就新建一个文件避免game_started这一变量失效

# https://chatgpt.com/share/6a2b06fe-cec4-8321-95e0-a67a24697a15
"""
我希望在这个系统里面加入一个暂停系统 
现在的系统 （出现bug）：
runner 可以发起任意次任意时长暂停 
hunter 可以投票发起任意次任意时长暂停 如果所有hunter同意或者任一runner同意则通过
暂停知道所有玩家到齐之后自动解除
出现的问题是 暂停之后所有玩家都退出去之后 有人不想连接回来了 打算放弃这把比赛 但是不进来游戏游戏就永远无法继续 就卡住了
我的构思：（需要你来提供合理的参数以及哪些参数应该允许玩家自定义）
新建掉线处理 
如果玩家在游戏任何时候掉线 对于runner会有 一个固定的时间 来允许重连 期间游戏继续 
关于追踪：
1. 追踪该runner的hunter会在 到达 一定距离 之后指南针无法正常工作以确保runner不会在被找到准确位置所以上线就被杀掉
2. 直接禁止该runner被追踪 如果它是唯一存活的runner则游戏自动暂停
如果hunter掉线 则游戏不受影响 继续运行 如果最后一个hunter掉线 则游戏自动暂停
如果游戏没有被暂停 掉线超过指定时间则视为放弃比赛

然后构思掉线限制指定时间 分为两部分 在每个周期A里面 允许掉线时长B 如果B时间花完 则开始花累计掉线时长C 如果再期间连接回来则在下一个周期开始的时候重置基础掉线时长B 但是保留累计掉线时长C 如果在同一个周期里面再次掉线则直接继续扣C的时间 如果在下一周期掉线则扣B的时间然后再扣C的时间 如果时间C扣完则视为玩家放弃比赛

有了上述掉线处理系统就可以处理暂停系统了
首先每次暂停应该有时长限制 如果时长达到则游戏自动继续
每场游戏应该允许有大小暂停 分别适应不同情况 比如 小暂停用来战术讨论 大暂停用来处理玩家的急事比如上厕所接电话拿外卖等
然后大暂停比方说允许1次 小组暂停允许一个指定次数
然后暂停使用也分阵容 所以不存在hunter发起投票runner可以一票同意 应该由hunter的大多数决定

如果所有玩家都重连成功或者放弃了比赛 则可以进行提前结束暂停投票 此投票需要所有玩家同意才可以取消否则需要等该暂停时长结束
"""