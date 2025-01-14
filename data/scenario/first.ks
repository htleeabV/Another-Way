[if exp="sf.i==void"]
[eval exp="sf.itemName=[0, 'leisure', 'militia', 'uniform', 'declaration', 'letter1', 'letter2', 'gun1', 'gun2', 'sword', 'gunsword', 'book', 'common_sence', 'training_manual', 'dessert', 'medicine']"]
[eval exp="sf.itemNameC=[0, '常服', '民兵服', '正式军服', '独立宣言', '来自英国的信', '附送食物的信', '滑膛枪', '来福枪', '军刀', '装上刺刀的枪', '书', '常识', '训练手册', '点心', '药物']"]
[eval exp="sf.price0 = [500, 1000, 250, 150, 300, 600, 1500]"]
[eval exp="sf.price1 = [650, 1250, 350, 200, 400, 750, 1900]"]
[eval exp="sf.price2 = [800, 1600, 400, 250, 500, 950, 2400]"]
[eval exp="sf.price3 = [1000, 2000, 500, 300, 600, 1200, 3000]"]
[eval exp="sf.price4 = [1300, 2500, 700, 400, 800, 1500, 3800]"]

;[deffont font=""][resetfont]
;测试现有CG[eval exp="sf.CG[9]=1, sf.CG[10]=1, sf.CG[11]=1, sf.CG[13]=1, sf.CG[16]=1, sf.CG[17]=1, sf.CG[22]=1, sf.CG[23]=1"]
;jump 去某段劇情
;[jump storage="England.ks" target=*meet]

;繁体
;[eval exp="sf.font0='ＭＳ Ｐ明朝'"]
;[eval exp="sf.font1='正黑体'"]
;[eval exp="sf.fontFace1='正黑体_20.tft'"]
;[font face=正黑体 size=20]
;[mappfont storage="正黑体_20.tft"]
;[font face=正黑体 size=24]
;[mappfont storage="正黑体_24.tft"]

[font face=Times size=20]
[mappfont storage="Times_New_Roman_20.tft"]


;简体
[eval exp="sf.font0='宋体'"]
[eval exp="sf.font1='宋体'"]
[eval exp="sf.fontFace1='SimSun_20.tft'"]
[font face=宋体 size=16]
[mappfont storage="SimSun_16.tft"]
[font face=宋体 size=20]
[mappfont storage="SimSun_20.tft"]
[font face=宋体 size=24]
[mappfont storage="SimSun_24.tft"]
[resetfont]

[endif]
[call storage="TJSfunction.ks" target=*initialize]
[history output=false]
[rclick enabled=false]

[cm][delay speed=nowait]

*start
[playbgm storage="bgm_maoudamashii_healing01"]
[image storage=Surrender_of_Lord_Cornwallis.jpg layer=base]
;[position layer=message0 left=382 top=327 frame=start visible=true margint=5 marginb=5 marginl=5 marginr=5]
[position layer=message0 left=382 top=327 frame=start visible=true margint=0 marginb=0 marginl=5 marginr=5]
[position layer=message1 visible=false]
[position layer=message2 visible=false]
[position layer=message3 visible=false]
[layopt layer=0 visible=false]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[layopt layer=3 visible=false]
[current layer=message0]
[style align=center][font color=0xFFFFFF shadow=false edge=true edgecolor=0x0000FF]
	[link storage="new_game.ks"]1776​​年[endlink][r]
	[link storage="read_game.ks"]历史纪录[endlink][r]
	[link storage="picture.ks"]博物馆[endlink][r]
	[link storage="about.ks"]关于游戏[endlink][r]
	[link target=*end]关闭游戏[endlink]
	[if exp="sf.endingPicture[1]==1||sf.endingPicture[2]==1||sf.endingPicture[3]==1||sf.endingPicture[4]==1"]
		[r][link storage="guide.ks"]攻略[endlink]
	[endif]
	[endif]
[s]


*end
[close]
[jump target=*start]