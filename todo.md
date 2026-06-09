- [x] 分离一些主包的内容(一些非主逻辑功能)到extra pack
- [ ] 对离线玩家进行管理: uid
- [ ] 考虑暂停功能需要在开始时选择对应时间 甚至在控制项里决定允许暂停的次数和时长
- [ ] 编写设置项对话框界面 同时实现里面提到的功能
      {
      [x]   random_team_runners: 1,
      [x]   start_cooldown: 600s, 
      [x]   difficulty: "peaceful", 
      [ ]   compass_leads_last_position_in_current_dimension: true, 
      [ ]   compass_misses_when_dimension_is_not_matching: false, 
      [x]   locator_bar: false, 
      [ ]   summons_piglin_brutes: false,
      [ ]   runner_winning_condition: "Killing the Ender Dragon" | "Hopped into the Fountain" | "Got to The End"
      }
- [ ] Timer should be modifiable to be turned on/off: Action bar should be re-written that 不应该用覆盖的方式来显示 而应该通过目前分数来管理玩家应该显示的内容
- [x] Trace back health when game ends