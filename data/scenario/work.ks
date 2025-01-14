*work
[position layer=message1 frame=invisible]

[if exp="f.i_gun2==0&&f.arms>=3000"]
	[call storage="gun.ks" target=*gun]
[endif]

[if exp="(f.spy==1||f.spy==2)&&f.month==f.spy_deadline"]
	[call storage="spy.ks" target=*deadline]
[endif]

[if exp="f.information!=0"][eval exp="f.information-=1"][endif]

[eval exp="f.talk='Y'"]

;set DelayTime
[eval exp="tf.delayTime=global.kag.delayTimeOfDialyWork*8"]

[if exp="f.year==1777&&f.month==3"][eval exp="tf.battle='纽约及新泽西战役'"][eval exp="tf.battle2='newyork'"][jump storage="battle.ks"]
[elsif exp="f.year==1777&&f.month==4"][call storage="france.ks" target=*france]
[elsif exp="f.year==1777&&f.month==10"][eval exp="tf.battle='萨拉托加战役'"][jump storage="battle.ks"]
[elsif exp="f.year==1778&&f.month==6"][eval exp="tf.battle='费城战役'"][eval exp="tf.battle2='philadelphia'"][jump storage="battle.ks"]
[elsif exp="f.year==1778&&f.month==8"][eval exp="tf.battle='加勒比海战区'"][eval exp="tf.battle2='caribbean'"][jump storage="battle.ks" target=*caribbean]
[elsif exp="f.year==1779&&f.month==10"][eval exp="tf.battle='萨凡纳围城战'"][jump storage="battle.ks"]
[elsif exp="f.year==1780&&f.month==5"][eval exp="tf.battle='沃克斯华战役'"][jump storage="battle.ks"]
[elsif exp="f.year==1781&&f.month==10"][eval exp="tf.battle='约克镇围城战役'"][jump storage="battle.ks"]
[endif]
*skip_battle

;法国参战2 1.未参战 2.日期在1777年4月以后 3.未决定胜负 4.胜场超过半数
[if exp="f.France!='Y'&&((f.year==1777&&f.month>4)||f.year>=1778)&&f.stage!='E'&&f.stage!='F'"]
	[if exp="f.numberOfWin > (f.numberOfBattle++/2)&&f.conversation>=300"][call storage="france.ks" target=*france1][endif]
[endif]

[if exp="f.year==1782&&f.month==10"]
	[jump stroage="win.ks"]
[elsif exp="f.year==1777&&f.month==1"]
	[call storage="Forage_War.ks" target=*part1]
[endif]

[nowait]
[cm]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[position layer=message2 visible=false]
[position layer=message1 visible=false]
[if exp="tf.sc[1]=='种植'"][call storage="farming.ks" target=*farming_start]
[elsif exp="tf.sc[1]=='开垦'"][call storage="cultivating.ks" target=*cultivating_start]
[elsif exp="tf.sc[1]=='赚钱'"][call storage="earning.ks" target=*earning_start]
[elsif exp="tf.sc[1]=='购物'"][call storage="marketing.ks"]
[elsif exp="tf.sc[1]=='休息'"][call storage="rest.ks" target=*rest_start]
[elsif exp="tf.sc[1]=='诊疗'"][call storage="treatment.ks" target=*treatment_start]
[elsif exp="tf.sc[1]=='战略课'"][call storage="studying.ks" target=*studying_start]
[elsif exp="tf.sc[1]=='军纪课'"][call storage="training.ks" target=*training_start]
[elsif exp="tf.sc[1]=='射击课'"][call storage="shooting.ks" target=*shooting_start]
[elsif exp="tf.sc[1]=='外交课'"][call storage="etiquette.ks" target=*etiquette_start]
[elsif exp="tf.sc[1]=='处理政务'"][call storage="document.ks" target=*document_start]
[endif]

[if exp="f.year==1776&&f.month==9"][jump storage="NYC.ks"]
[elsif exp="f.year==1777&&f.month==6"][call storage="letter.ks" target=*letter1]
[elsif exp="f.year==1778&&f.month==4"][call storage="letter.ks" target=*letter2]
[elsif exp="f.year==1783&&f.month==4"][jump storage="ending.ks"]
[elsif exp="f.year==1777&&f.month==1"][call storage="Forage_War.ks" target=*part2]
[endif]

[nowait][cm]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[position layer=message2 visible=false]
[position layer=message1 visible=false]
[if exp="tf.sc[2]=='种植'"][call storage="farming.ks" target=*farming_start]
[elsif exp="tf.sc[2]=='开垦'"][call storage="cultivating.ks" target=*cultivating_start]
[elsif exp="tf.sc[2]=='赚钱'"][call storage="earning.ks" target=*earning_start]
[elsif exp="tf.sc[2]=='购物'"][call storage="marketing.ks"]
[elsif exp="tf.sc[2]=='休息'"][call storage="rest.ks" target=*rest_start]
[elsif exp="tf.sc[2]=='诊疗'"][call storage="treatment.ks" target=*treatment_start]
[elsif exp="tf.sc[2]=='战略课'"][call storage="studying.ks" target=*studying_start]
[elsif exp="tf.sc[2]=='军纪课'"][call storage="training.ks" target=*training_start]
[elsif exp="tf.sc[2]=='射击课'"][call storage="shooting.ks" target=*shooting_start]
[elsif exp="tf.sc[2]=='外交课'"][call storage="etiquette.ks" target=*etiquette_start]
[elsif exp="tf.sc[1]=='处理政务'"][call storage="document.ks" target=*document_start]
[endif]

[if exp="f.year==1777&&f.month==5"][call storage="smallpox.ks" target=*smallpox]
[elsif exp="f.year==1777&&f.month==9"][jump storage="retreat.ks"]
[elsif exp="f.year==1776&&f.month==12"][jump storage="christmas.ks"]
[elsif exp="f.year==1777&&f.month==1"][call storage="Forage_War.ks" target=*part3]
[endif]

[nowait][cm]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[position layer=message2 visible=false]
[position layer=message1 visible=false]
[if exp="tf.sc[3]=='种植'"][call storage="farming.ks" target=*farming_start]
[elsif exp="tf.sc[3]=='开垦'"][call storage="cultivating.ks" target=*cultivating_start]
[elsif exp="tf.sc[3]=='赚钱'"][call storage="earning.ks" target=*earning_start]
[elsif exp="tf.sc[3]=='购物'"][call storage="marketing.ks"]
[elsif exp="tf.sc[3]=='休息'"][call storage="rest.ks" target=*rest_start]
[elsif exp="tf.sc[3]=='诊疗'"][call storage="treatment.ks" target=*treatment_start]
[elsif exp="tf.sc[3]=='战略课'"][call storage="studying.ks" target=*studying_start]
[elsif exp="tf.sc[3]=='军纪课'"][call storage="training.ks" target=*training_start]
[elsif exp="tf.sc[3]=='射击课'"][call storage="shooting.ks" target=*shooting_start]
[elsif exp="tf.sc[3]=='外交课'"][call storage="etiquette.ks" target=*etiquette_start]
[elsif exp="tf.sc[1]=='处理政务'"][call storage="document.ks" target=*document_start]
[endif]

*endwork

[if exp="f.year==1777&&f.month==1"]
	[call storage="Forage_War.ks" target=*part4]
[endif]

;转阶段, 签约+终结日
[if exp="f.year==1778&&f.month==6"]
	[if exp="f.win_philadelphia=='W'"]
	[america pos='r' feeling='normal' layer=0]
	[image storage="Washington" pos=l visible=true layer=1]
	[talk layer=message1 name="华盛顿"]
		我们夺回费城了！[l][er]
	[talk layer=message1 name="阿美利加"]
		那即我们能回应独立厅了？[l][er]
	[talk layer=message1 name="华盛顿"]
		没错！而且沿河的城市，工作就更方便了。[l][er]
	[talk layer=message1 name="阿美利加"]
		太好了！[l][er]
	[layopt layer=0 visible=false]
	[layopt layer=1 visible=false]
	[layopt layer=2 visible=false]
	;转背景+特效
	[backlay]
	[image storage="independence_hall" layer=base page=back]
	[trans method=universal rule=universal_1 time=1000 children=false][wt canskip=true][wait time=100]
		[eval exp="f.stage='C'"]
	[else]
		[eval exp="f.stage='D'"]
	[endif]
[elsif exp="f.year==1782&&f.month==11"]
	[call storage="Treaty_of_Paris.ks" target=*Treaty_of_Paris]
[elsif exp="f.year==1783&&f.month==4"]
	[eval exp="f.day=11"]
[endif]

*endmonth



;修正日期
[eval exp="f.day=1"]
[if exp="f.month==12"][eval exp="f.month=1, f.year+=1"]
[else][eval exp="f.month+=1"]
[endif]

[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[showDate]
[position layer=message1 visible=false]
[position layer=message2 visible=false]

[if exp="f.smallpox=='S'&&f.intelligence>=500"][call storage="smallpox.ks" target=*endsmallpox][endif]

[if exp="f.spy==0&&f.intelligence>=500&&f.conversation>=375&&!(f.stage=='E'||f.stage=='F')"][call storage="spy.ks" target=*spy0][endif]

[if exp="f.conversation>=450&&f.borrow!='E'"][call storage="france.ks" target=*borrow][endif]

[if exp="f.discipline>=500&&f.gift!='F'"][call storage="gift.ks"][endif]

;订货军备运至
[if exp="f.buy_arms==3||f.buy_arms==2"]
	[eval exp="f.buy_arms-=1"]
[elsif exp="f.buy_arms==1"]
	[eval exp="f.buy_arms=0"][eval exp="f.arms+=300"]
	[layopt layer=0 visible=false]
	[layopt layer=1 visible=false]
	[layopt layer=2 visible=false]
	[position layer=message2 visible=false]
	[position layer=message1 visible=true left=207 top=180 frame=dialog margint=0 marginb=0 marginl=10 marginr=10]
	[current layer=message1][er]
	[locate x=195 y=2][button graphic=close target=*arms_c]
	[nowait][locate y=20][style align=center]
		军备运到了。[endnowait]
	[style align=left][s]
[endif]

*arms_c

;改变状态-思乡
[if exp="f.state!='思乡'&&f.AB>=75"]
	[america pos='c' feeling='normal' layer=1]
	[talk layer=message1 name="阿美利加" feeling='sad']
		我有点挂念英国呢...[l][r]
	[eval exp="f.state='思乡'"]
		独立真的好吗...?[l][er]
	[layopt layer=1 visible=false][layopt layer=3 visible=false]
	[position layer=message1 visible=false]
[elsif exp="f.state=='思乡'&&f.AB<=75"]
	[eval exp="f.state='正常'"]
[endif]

;饿死
[if exp="f.stage!='F'&&f.food==0"][jump storage="ending.ks" target=*death][endif]
;病死
[if exp="f.stage!='F'&&f.health<=20"][jump storage="ending.ks" target=*death][endif]

;粮食
[if exp="f.stage!='F'"]
;若果粮食不足应付粮食方针
	[if exp="(f.food<=25)&&(f.diet!='节约')"]
		[america pos='c' layer=1 feeling='normal']
		[talk layer=message1 name="阿美利加" feeling='sad']
		粮食不足。[r]
		唯有省着吃了。[l]
		[eval exp="f.diet='节约'"][er]
	[elsif exp="(f.food<=50)&&(f.diet=='丰富')"]
		[america pos='c' layer=1 feeling='normal']
		[talk layer=message1 name="阿美利加" feeling='sad']
		粮食不足以吃一般丰富餐呢。[r]
		还是照常好了。[l]
		[eval exp="f.diet='一般'"][er]
		
	[endif]
;粮食扣减
	[if exp="f.diet=='一般'"]
		[eval exp="f.food-=50"]
	[elsif exp="f.diet=='节约'"]
		[eval exp="f.food-=25"][eval exp="f.health-=5"][eval exp="f.food=0" cond="f.food<0"]
	[elsif exp="f.diet=='丰富'"]
		[eval exp="f.food-=75"][eval exp="f.health+=3"]
	[endif]
;if粮食<150, 自动转成节约
	[if exp="f.food<150&&f.diet!='节约'"]
		[america pos='c' layer=1 feeling='normal']
		[talk layer=message1 name="阿美利加" feeling='sad'][delay speed=user]
		剩余的粮食不足3个月的分量 。[l][er]
		需要省着吃吗？[r]
		[nowait][cleanStar]
		[starLink string='唯有省着吃了。' target='*dietChange' number=1][r]
		[starLink string='维持现状吧。' target='*dietNotChange' number=2]
		[endnowait][s]

*dietChange
		[eval exp="f.diet='节约'"][er]
		[bottom layer=message1]粮食方针转成节约。[l][jump target=*dietEnd]
*dietNotChange
		[bottom layer=message1][er]粮食方针不变，需要注意粮食数量。[l][jump target=*dietEnd]
	[endif]
[endif]
*dietEnd

;被软禁时，健康减5
[if exp="f.stage=='F'"][eval exp="f.health-=5"][endif]

;改变状态-生病
[if exp="f.state=='生病'&&f.health>=45&&f.fatigue<=f.health*1.5"]
	[america pos='c' feeling='normal' layer=0]
	[talk layer=message1 name="阿美利加" feeling='happy']
		感觉好了很多。[l][er]
	[bottom layer=message1][delay speed=user]
	[eval exp="f.state='正常'"]
		身体康复了。[l][er]
	[layopt layer=0 visible=false]
[elsif exp="f.state=='生病'"]
	[america pos='c' feeling='normal' layer=0]
	[talk layer=message1 name="阿美利加" feeling='sad']	
		感觉软弱无力......[l][er]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000,f.power, 102, 76, 120)"]
		[locate x=0 y=0]武力
		[locate x=88 y=-8][emb exp="Math.round(f.power)"]
	[endnowait]
	[bottom layer=message1][delay speed=user]
	[eval exp="f.power-=30"]
	生病，武力-30[l]
	[attributesDialog x=350 y=180 layer=message2 line=1]
		[eval exp="attributeBar(1000,f.power, 102, 76, 120)"]
		[locate x=0 y=0]武力
		[locate x=88 y=-8][emb exp="Math.round(f.power)"]
	[endnowait]
	[current layer=message1][l][er]
	[layopt layer=1 visible=false]
[elsif exp="f.state!='生病'&&(f.health<=45||f.fatigue>=f.health*1.5)"]
	[eval exp="f.state='生病'"]
	[america pos='c' feeling='sad' layer=0]
	[talk layer=message1 name="阿美利加" feeling='sad']
		身体不适...[l][er]
	[layopt layer=0 visible=false][layopt layer=3 visible=false]
[endif]

;发行纸币
[if exp="f.finance=='增发纸币'"]
[eval exp="f.money+=200"]
[eval exp="f.printedMoney+=200"]
[endif]


;情报
[if exp="f.intelligence>=700"]
	[eval exp="tf.battle=''"]
	[if exp="f.year==1776&&f.month==12"][eval exp="tf.battle='纽约及新泽西'"]
	[elsif exp="f.year==1777&&f.month==7"][eval exp="tf.battle='萨拉托加'"]
	[elsif exp="f.year==1778&&f.month==3"][eval exp="tf.battle='费城'"]
	[elsif exp="f.year==1778&&f.month==5&&f.france=='N'"][eval exp="tf.battle='加勒比海'"]
	[elsif exp="f.year==1779&&f.month==7"][eval exp="tf.battle='萨凡纳'"]
	[elsif exp="f.year==1780&&f.month==2"][eval exp="tf.battle='沃克斯华'"]
	[elsif exp="f.year==1781&&f.month==7"][eval exp="tf.battle='约克镇'"]
	[endif]
	[if exp="tf.battle!=''"]
		[call storage="intelligence.ks" target=*intelligence]
	[endif]
[endif]

[jump storage="game.ks" target=*game]
