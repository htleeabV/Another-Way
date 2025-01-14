*game
[cleanHistory]
[layopt layer=0 visible=false index=1000]
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[layopt layer=3 visible=false]
[position layer=message3 visible=false draggable=false]
[position layer=message2 visible=false]
[position layer=message1 visible=false]

;改变状态-生病
[if exp="f.state=='生病'&&f.health>=45&&f.fatigue<=f.health*1.5"]
	[america pos='c' feeling='normal' layer=1]
	[talk layer=message1 name='阿美利加']
	[eval exp="f.state='正常'"]
	[delay speed=50]身体恢复了。[l][er]
[elsif exp="f.state!='生病'&&(f.health<=45||f.fatigue>=f.health*1.5)"]
	[eval exp="f.state='生病'"]
	[america pos='c' feeling='normal' layer=1]
	[talk layer=message1 name='阿美利加' portrait='America_sad']
	身体有点难受...[l][er]
[endif]

;改变状态-思乡
[if exp="f.state!='思乡'&&f.AB>=75"]
	[america pos='lc' feeling='normal' layer=0]
	[talk layer=message1 name='阿美利加' portrait='America_sad']
	我有点挂念英国呢...[l][er]
	[eval exp="f.state='思乡'"]
	独立这决定真的好吗...?[l][er]
	[layopt layer=1 visible=false][layopt layer=3 visible=false]
	[position layer=message1 visible=false]
[elsif exp="f.state=='思乡'&&f.AB<=75"]
	[eval exp="f.state='正常'"]
[endif]

*label|储存点
[cm]
[delay speed=nowait]
;下句待删
[call storage="TJSfunction.ks" target=*initialize]
[setBasePlace]
[america pos='lc' layer=0 feeling='normal']
[layopt layer=1 visible=false]
[layopt layer=2 visible=false]
[layopt layer=3 visible=false]
[position layer=message3 visible=false draggable=false]
[position layer=message2 visible=false]
[position layer=message1 visible=false]

[iscript]
function showcomment(com)
{
	var msgLayer = kag.fore.messages[1];  
	msgLayer.font.mapPrerenderedFont(sf.fontFace1);
	if(com=='schedule')
		msgLayer.drawText(0,460,"行程。安排并进行下个月的行动。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='attributes')
		msgLayer.drawText(0,460,"属性。查看阿美利加现时各属性数值及拥有的金钱和军备。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='item')
		msgLayer.drawText(0,460,"物品栏。查看和使用物品。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='shopping')
		msgLayer.drawText(0,460,"购物。到市集购买物资及军备。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='talk')
		msgLayer.drawText(0,460,"与上司对话。增进对战况的了解。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='diary')
		msgLayer.drawText(0,460,"日记。储存和读取游戏纪录。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='shopping2')
		msgLayer.drawText(0,460,"购物。离市集太远，未能于一日内到达。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='talk2')
		msgLayer.drawText(0,460,"与上司对话。战败被俘，无法进行对话。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='system')
		msgLayer.drawText(0,460,"系统设定。调节速度，字体，及返回主界面。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	msgLayer.visible=true; 
}  

function hidecomment(){  
	var msgLayer = kag.fore.messages[1];  
	msgLayer.clear();  
	msgLayer.visible=false;  
}  
[endscript]

;test
;[jump storage="win.ks" target=*lose]

[cleanHistory]
[fadeoutbgm time=3000]
[playbgm storage="A New Day"]
[fadeinbgm storage="A New Day" time=3000]
[position layer=message1 left=0 top=0 frame=invisible margint=0 marginb=0 marginl=0 marginr=0]
[position layer=message0 visible=true left=400 top=0 margint=0 marginb=0 marginl=0 marginr=0 frame=game]
[if exp="f.AB<80"][position layer=message0 frame=game]
[else][position layer=message0 frame=game2]
[endif]
[current layer=message0]
[font size=20 color=0xFFFFFF edge=true edgecolor=0x000000]
[locate x=10 y=13]地点: [if exp="f.stage=='A'||f.stage=='C'||f.stage=='E'"]费城独立厅[elsif exp="f.stage=='B'||f.stage=='D'"]兰卡斯特[else]英国的住宅[endif][r]
[locate x=10]日期: [emb exp="f.year"]年[emb exp="f.month"]月[emb exp="f.day"]日[r]
[locate x=10]状态: [emb exp="f.state"][r]
[locate x=210 y=0]
[button graphic="system.png" storage="system.ks" graphickey=adapt onenter="showcomment('system')" onleave="hidecomment()"]
[locate x=7 y=95]
[button graphic="schedule" storage="schedule.ks" onenter="showcomment('schedule')" onleave="hidecomment()"]
[locate x=46 y=95]
[button graphic="attributes" target=*attributes onenter="showcomment('attributes')" onleave="hidecomment()"]
[locate x=85 y=95]
[button graphic="item" storage="item.ks" onenter="showcomment('item')" onleave="hidecomment()"]
[locate x=122 y=95]
[if exp="f.stage=='A'||f.stage=='C'||f.stage=='E'"][button graphic="shopping" storage="shopping.ks" onenter="showcomment('shopping')" onleave="hidecomment()"][else][button graphic="XEnglandX" target=*blocked hint="购物" onenter="showcomment('shopping2')" onleave="hidecomment()"][endif]
[locate x=163 y=95]
[if exp="f.stage!='F'"][button graphic="talking" storage="talk.ks" onenter="showcomment('talk')" onleave="hidecomment()"][else][button graphic="XEnglandX" target=*blocked onenter="showcomment('talk2')" onleave="hidecomment()"][endif]
[locate x=202 y=95]
[button graphic="diary" storage="save_load.ks" onenter="showcomment('diary')" onleave="hidecomment()"]
[s]


*attributes
[call storage="TJSfunction.ks"]
[position layer=message1 visible=true left=0 top=0 frame=dialog6 margint=50 marginb=10 marginl=70 marginr=10]
[image storage="invisible" visible=true left=0 top=0 layer=0]
[current layer=message1][er][nowait]
;画框
[eval exp="attributesBase()"]
[eval exp="attributeBar(1000, f.power, 135, 71, 150)"]
[eval exp="attributeBar(1000, f.intelligence, 135, 101, 150)"]
[eval exp="attributeBar(1000, f.discipline, 135, 131, 150)"]
[eval exp="attributeBar(1000, f.marksmanship, 135, 161, 150)"]
[eval exp="attributeBar(1000, f.conversation, 135, 191, 150)"]
[eval exp="attributeBar(100, f.health, 135, 221, 150)"]
[eval exp="attributeBar(10000, f.arms, 135, 261, 150)"]
[eval exp="attributeBar(40, f.doc, 185, 361, 100)" cond="f.stage=='E'"]
[eval exp="attributeBar(200, f.fatigue, 135, 396, 150)"]
[font color=0x000000]
[eval exp="tf.xLocationOfString=15, tf.yLocationOfString=10"]
[eval exp="tf.i=0, tf.yLocationOfBar = 72"]
[attribute string='武力' amount=&f.power]
[attribute string='智力' amount=&f.intelligence]
[attribute string='军纪' amount=&f.discipline]
[attribute string='枪械' amount=&f.marksmanship]
[attribute string='谈吐' amount=&f.conversation]
[font color=0x820000 cond="f.health<55"][attribute string='健康' amount=&f.health][font color=0x0000000]
[eval exp="tf.yLocationOfString+=10, tf.yLocationOfBar+=10"]
[attribute string='军备' amount=&f.arms]
[attribute string='粮草' amount=&f.food]
[attribute string='金钱' amount=&f.money]
[eval exp="tf.yLocationOfString+=10, tf.yLocationOfBar+=10"]
[if exp="f.stage=='E'"][attribute string='剩余公文' amount=&f.doc][endif]
[eval exp="tf.yLocationOfString+=35, tf.yLocationOfBar+=35"]
[locate x=&tf.xLocationOfString y=335]疲劳[locate x=220][font color=0x820000 cond="f.fatigue>=f.health"][emb exp="f.fatigue"]
[locate y=500]
[endnowait][l]
[jump target=*game]

*blocked
[position layer=message1 visible=true left=207 top=180 frame=dialog margint=0 marginb=0 marginl=10 marginr=10]
[current layer=message1][er]
[locate x=195 y=2][button graphic=close target=*game]
[nowait][locate x=0 y=20]
[if exp="f.stage=='F'"]
	被软禁，无法进行该选项。
[else]
	离城镇太远，需要在行程选择"购物"。
[endif]
[endnowait][s]


