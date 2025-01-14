*rest_start
[showDate]
[workPicture work='rest']
[america pos='l' feeling='normal' layer=1]
[if exp="f.spy==0||f.spy==3||f.spy==4"]
	[talk layer=message1 name='阿美利加' feeling='happy']
	得到休息真好呢。[l][er]
	[eval exp="tf.tfFatigue=f.fatigue"]
	[if exp="!(f.year==1776&&f.month==7&&f.day==4)"]
		[call target=*rest_dayly]
		[call target=*rest_dayly]
		[call target=*rest_dayly]
	[endif]
	[call target=*rest_dayly]
	[call target=*rest_dayly]
	[call target=*rest_dayly]
	[if exp="f.stage=='E'"][call storage="England.ks" target=*0][endif]
	[call target=*rest_dayly]
	[call target=*rest_dayly]
	[if exp="f.day<=20||f.month!=2||f.year!=1780"]
		[call target=*rest_dayly]
		[call target=*rest_dayly]
	[elsif exp="f.year==1780&&f.month==2&&f.day>20"]
		[call target=*rest_dayly]
	[endif]
	[if exp="f.day>=25&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
		[call target=*rest_dayly]
	[endif]
	[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
	[eval exp="f.health+=2" cond="f.stage=='生病'"]
[elsif exp="f.spy==1"][call storage="spy.ks" target=*spy1]
[elsif exp="f.spy==2"][call storage="spy.ks" target=*spy2]
[endif]
[layopt layer=message2 visible=false]
[bottom layer=message1][delay speed=user]
[if exp="tf.tfFatigue!=0"]疲累下降了[emb exp="tf.tfFatigue-f.fatigue"]。[endif]
[if exp="f.fatigue==0"]精神满满！[endif][l]
[position layer=message1 visible=false]
[return]
;return to work


*rest_dayly
	[showDate]
	[actionAttributes]
		[eval exp="attributeBar(200, f.fatigue, 175, 400)"]
		[locate x=120 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
	[delay speed=nowait]
	[actionDialog]
	自由活动．．．[wait time=&tf.delayTime][er]
	[actionDialog]
	自由活动，休息。
	[if exp="f.stage=='A'||f.stage=='C'||f.stage=='E'||f.stage=='F'"]
		[if exp="f.state=='粮食短缺'"][if exp="f.fatigue>=4"][eval exp="f.fatigue-=4"][else][eval exp="f.fatigue=0"][endif]
		[else][if exp="f.fatigue>=7"][eval exp="f.fatigue-=7"][else][eval exp="f.fatigue=0"][endif]
		[endif]
	[else]
		[if exp="f.state=='粮食短缺'"][if exp="f.fatigue>=4"][eval exp="f.fatigue-=4"][else][eval exp="f.fatigue=0"][endif]
		[else][if exp="f.fatigue>=6"][eval exp="f.fatigue-=6"][else][eval exp="f.fatigue=0"][endif]
		[endif]
	[endif]
	[actionAttributes]
		[eval exp="attributeBar(200, f.fatigue, 175, 400)"]
		[locate x=120 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
	[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
;return to rest start