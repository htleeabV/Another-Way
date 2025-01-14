*christmas
	[showDate event='圣诞突袭']
	[image storage="Washington" visible=true page=fore pos=l layer=0]
	[america pos='r' feeling='normal' layer=1]
	[talk layer=message1 name='华盛顿']
		现时的局面越来越糟糕了，我军的士气也处于低谷的状态。[r]
		大陆军的服役期将要满，这可是个严峻的问题，我想你应该清楚，阿美利加！[l][er]
	[talk name='阿美利加']
		我的朋友，想必你一定会有所盘算。[l][er]
	[talk name='华盛顿']
		哦是的，我想敌人一定会庆祝耶诞节而有失防备。[r]
		我们兵分三路，乘着夜色过河突袭。同时我们可以让在新泽西的民兵牵制分散敌人的一些注意力。[l][er]
	[talk name='阿美利加']
		这的确是个好时机。我们需要一场胜仗来使士兵乐观的度过年末。[r]
		让我们详细讨论下这次作战吧。[l][er]
	[layopt layer=0 visible=false][layopt layer=1 visible=false][layopt layer=2 visible=false]
	[position layer=message1 visible=false]
	[call target=*change_day][call target=*change_day][call target=*change_day]
;24日, 途中
	[showDate event='圣诞突袭']
	[changeBasePlace picture='BG_dancing']
	[bottom layer=message1]途经新泽西乡间，街市相当热闹。[l][er]
	[america pos='r' feeling='normal' layer=1]
	[talk name='阿美利加' feeling='shock' layer=message1]
		不都是相当愉快的人们吗？[l][er]
	[talk name='阿美利加' feeling='laughing']
		啊，谢谢！（接过食物）[l][er]
	[talk name='战友']
		但不管怎么说，我们这边的情况也是不容乐观的，暴风雪延误了许多进程。[l][er]
	[talk name='阿美利加' feeling='serious']
		看着那些欢乐的人们，更加觉得我们应该守护这些根本的东西。[l][er]
	[talk name='阿美利加' feeling='normal']
		稍作休息就出发吧。[l][er]
	[setBasePlace]
	[call target=*change_day]
	[showDate event='圣诞突袭']
	[america pos='r' feeling='normal' layer=0]
	[talk name='战友' layer=message1]
		今天我们的对手是远还要冷酷无情的德意志的雇佣兵。[r]
		请注意你的对手，还有那个看起来很厉害的人也是……[l][er]
	[talk name='阿美利加' feeling='serious']
		我不会大意轻敌的…![l][er]
	[talk name='阿美利加' feeling='shock']
		呃, 真的是那边的那些人吗?[l][er]
	[talk name='战友']
		确实是没错，不过好像寒冷而去避寒了吧。华盛顿先生给的情报不会错。[l][er]
	[talk name='阿美利加' feeling='serious']
		我们是美军!一决胜负吧!黑森雇佣兵![l][er]
	[talk layer=message1 name='黑森']
		不要那么恐怖的脸嘛!一起庆祝圣诞节吧![r]哇-哈哈哈[l][er]
	[talk name='阿美利加' feeling='frustrated']
		......[l][er]
	[bottom layer=message1]
		大获全胜。[l][er]
	[call target=*change_day]
	[layopt layer=0 visible=false][layopt layer=1 visible=false][layopt layer=2 visible=false]
	[showDate event='圣诞突袭']
	[image storage="Washington" visible=true page=fore pos=l layer=0]
	[america pos='r' feeling='normal' layer=1]
	[talk layer=message1 name='华盛顿']
		这是件喜悦的事情，大大振奋了士气。[r]
		而且促使大量平民加入了我们，这为革命注入新血。[l][er]
		战争发生转折，我们终将会胜利。[l][er]
		胜利女总会神会眷顾我们的，因为我们坚守自由。[l][er]
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(1000, f.intelligence, 102, 76, 120)"]
		[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
		[locate x=0 y=0]智力
		[locate x=0 y=30]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.intelligence)"]
		[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
	[endnowait]
	[bottom layer=message1]
		智力+10，军纪+30[l]
	[eval exp="f.intelligence+=10, f.discipline+=30"]
	[attributesDialog x=350 y=180 layer=message2 line=2]
		[eval exp="attributeBar(1000, f.intelligence, 102, 76, 120)"]
		[eval exp="attributeBar(1000, f.discipline, 102, 106, 120)"]
		[locate x=0 y=0]智力
		[locate x=0 y=30]军纪
		[locate x=88 y=-8][emb exp="Math.round(f.intelligence)"]
		[locate x=86 y=22][emb exp="Math.round(f.discipline)"]
	[endnowait]
	[current layer=message1][l]
	[cm]
	[layopt layer=0 visible=false][layopt layer=1 visible=false][layopt layer=2 visible=false]
[call target=*change_day][call target=*change_day][call target=*change_day][call target=*change_day][call target=*change_day][call target=*change_day]
[jump storage="work.ks" target=*endmonth]

*change_day
	[showDate]
	[delay speed=nowait]
	[actionDialog]准备偷袭行动．．．[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]

*change_day2
	[showDate]
	[delay speed=nowait]
	[actionDialog]偷偷回到营地．．．[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
