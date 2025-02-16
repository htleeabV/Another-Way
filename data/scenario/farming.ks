*farming_start
[showDate]
[call target=*farming_picture_update]
[america pos=l layer=1 feeling='normal']
[talk layer=message1 name="阿美利加"]
	开始干活了！[l][er]
[eval exp="tf.tfFarm=0"]
[layopt layer=1 visible=false][layopt layer=3 visible=false]
[if exp="!(f.year==1776&&f.month==7&&f.day==4)"]
	[call target=*farming_dayly]
	[call target=*farming_dayly]
	[call target=*farming_dayly]
[endif]
[call target=*farming_dayly]
[call target=*farming_dayly]
[call target=*farming_dayly]
[call target=*farming_dayly]
[call target=*farming_dayly]
[if exp="f.year==1780&&f.month==2&&f.day>20"]
	[call target=*farming_dayly]
[elsif exp="f.day<=20||f.month!=2||f.year!=1780"]
	[call target=*farming_dayly]
	[call target=*farming_dayly]
[endif]
[if exp="f.day>=30&&(f.month==1||f.month==3||f.month==5||f.month==7||f.month==8||f.month==10||f.month==12)"]
	[call target=*farming_dayly]
[endif]
[if exp="f.day>=25"][eval exp="f.day-=1"][endif]
[layopt layer=message2 visible=false]
[bottom layer=message1][delay speed=user]
农作物生长了[emb exp="Math.round(tf.tfFarm/35*100)"]%。[l]
[position layer=message2 visible=false]
[return]
;return to work


*farming_picture_update
[if exp="f.farm<8"]
[workPicture work='farming']
[elsif exp="f.farm<18"]
[workPicture work='farming_1']
[elsif exp="f.farm<28"]
[workPicture work='farming_2']
[else]
[workPicture work='farming_3']
[endif]
[return]


*farming_dayly
	[showDate]
	[delay speed=nowait]
	[actionAttributes]
		[eval exp="attributeBar(35, f.farm, 175, 400)"]
		[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
		[locate x=60 y=390]农作生成度
		[locate x=330 y=390]疲累
		[locate x=225 y=380][emb exp="Math.round(f.farm/35*100)"]%
		[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
	[endnowait]
	[actionDialog]种植中．．．[wait time=&tf.delayTime][er]
	[actionDialog]
		[if exp="f.fatigue<=f.health*1.3"]
			种植，农作物茁壮成长。
			[eval exp="f.farm+=1, f.fatigue+=3"][eval exp="tf.tfFarm+=1"]
		[else]
			种植不太顺利。
			[eval exp="f.fatigue+=2"]
		[endif]
		[call target=*farming_picture_update]
		[actionAttributes]
			[eval exp="attributeBar(35, f.farm, 175, 400)"]
			[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
			[locate x=60 y=390]农作生成度
			[locate x=330 y=390]疲累
			[locate x=225 y=380][emb exp="Math.round(f.farm/35*100)"]%
			[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
	[if exp="f.farm>=35"]
		[layopt layer=message2 visible=false]
;未有图		[america pos=c layer=1 feeling=happy]
		[america pos=c layer=1 feeling=normal]
		[talk layer=message1 name="阿美利加" feeling='happy']
		辛苦这么久，终于收成了！
		[if exp="f.month==6||f.month==7||f.month==8"][r]农作物比往常多呢！太好了！[endif][l]
		[delay speed=nowait]
		[layopt layer=2 visible=false][layopt layer=1 visible=false]
		[actionAttributes]
			[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
			[locate x=60 y=390]粮食
			[locate x=330 y=390]疲累
			[locate x=225 y=390][emb exp="Math.round(f.food)"]
			[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
		[actionDialog]
		收成了！[wait time=&(tf.delayTime/2)]
		[if exp="f.month==6||f.month==7||f.month==8"]
			大丰收！
			[eval exp="f.food+=450, f.farm=0, f.fatigue-=20"][eval exp="tf.tfFarm=0"]
		[else]
			收割。
			[eval exp="f.food+=300, f.farm=0, f.fatigue-=10"][eval exp="tf.tfFarm=0"]
		[endif]
		[actionAttributes]
			[eval exp="attributeBar(200, f.fatigue, 380, 400)"]
			[locate x=60 y=390]粮食
			[locate x=330 y=390]疲累
			[locate x=225 y=390][emb exp="Math.round(f.food)"]
			[locate x=430 y=380][emb exp="Math.round(f.fatigue)"]
		[endnowait]
		[call target=*farming_picture_update]
		[current layer=message1][l]
		[layopt visible=false layer=1]	
	[endif]
	[wait time=&tf.delayTime][er]
	[eval exp="f.day+=1"]
[return]
;return to farming start