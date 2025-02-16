*initialize

;戴入插件
[loadplugin module="wuvorbis.dll"]

;行程图
[macro name="workPicture"]
[eval exp="tf.string='work_'+mp.work"]
[image storage='invisible' visible=true left=110 top=0 layer=0]
[eval exp="mask(kag.fore.layers[0], tf.string, 'mask')"]
[eval exp="loadPic(0,0,kag.fore.layers[0],'dialog4')"]
[eval exp="kag.fore.layers[0].imageWidth=428"]
[endmacro]

;mask
[iscript]
function mask(layer, image, mask){

var mask =new Layer(kag,kag.fore.base);
mask.visible=true;
mask.loadImages('mask');
mask.setSizeToImageSize();

loadPic(0,0,layer,image);
layer.setSizeToImageSize();
layer.face=dfMask;
layer.copyRect(0,0,mask,0,0, layer.imageWidth, layer.imageHeight);
}

[endscript]

[iscript]
function loadPic(x,y,baseLayer, pic){
	var itemLayer = new global.Layer(kag, kag.fore.base);
	itemLayer.loadImages(pic);
	baseLayer.operateRect(x,y,itemLayer, 0,0, itemLayer.imageWidth, itemLayer.imageHeight, omPsNormal);
}
[endscript]


;schedule
[macro name="scheduleDialog"]
	[position layer=message1 frame=invisible visible=true left=0 top=0 margint=0 marginb=0 marginl=0 marginr=0]
	[current layer=message1][er][nowait]
	[eval exp="loadPic(0,0,kag.fore.messages[1], 'schedule1')"]
	[locate x=375 y=45][button graphic=close storage="game.ks"][font color=0x1F0F01 size=24]
	[font size=20]
	[locate x=20 y=46]下个月的行程安排：[r]
	[locate x=108 y=96]上旬
	[locate x=108 y=132]中旬
	[locate x=108 y=168]下旬
	[eval exp="loadPic(360,185,kag.fore.messages[1], 'schedule2')"]
[endmacro]


[macro name="attributesDialog"]
	[invisible layer=%layer|message2]
[position layer=%layer|message2 left=&mp.x top=&mp.y margint=65 marginb=0 marginl=55 marginr=0]
[current layer=%layer|message2]
	[eval exp="kag.current.colorRect(48, 58, 184, (20+mp.line*30) , 0x403629, 200)"]
	[eval exp="kag.current.colorRect(49, (58+20+mp.line*30), 182, 1 , 0x403629, 200)"]
	[eval exp="kag.current.colorRect(49, (58+20+mp.line*30+1), 182, 1 , 0x403629, 200)"]
	[eval exp="kag.current.colorRect(50, (58+20+mp.line*30+2), 180, 1 , 0x403629, 200)"]
	[eval exp="kag.current.colorRect(52, (58+20+mp.line*30+3), 176, 1 , 0x403629, 200)"]
	[eval exp="kag.current.colorRect(56, (58+20+mp.line*30+4), 168, 1 , 0x403629, 200)"]
	[eval exp="loadPic(0,0,kag.current,'Dialog_attributes')"]
	[nowait][font color=0xFFFFFF edgecolor=0x000000]
[endmacro]
;x,y,line,layer

[macro name="actionDialog"]
	[position layer=message1 left=0 top=0 visible=true frame=invisible margint=340 marginb=480 marginl=150 marginr=160]
	[eval exp="kag.fore.messages[1].colorRect(120, 330, 400, 50, 0xFFFFFF, 200)"]
	[current layer=message1]
[endmacro]

[macro name="actionAttributes"]
	[invisible layer=message2][position layer=message2 margint=0 marginb=0 marginl=0 marginr=0]
	[eval exp="kag.fore.messages[2].colorRect(0, 380, 640, 100, 0x000000, 100)"]
	[nowait][font color=0xFFFFFF edgecolor=0x000000]
[endmacro]


;数值改变条
*attributesBase

[iscript]
function attributesBase(){
	var baseLayer = kag.current;
	var widthOfBar = 275;
	var color = 0x000000;
	baseLayer.colorRect(77, 60, widthOfBar, 30, color, 30);
	baseLayer.colorRect(77, 120, widthOfBar, 30, color, 30);
	baseLayer.colorRect(77, 180, widthOfBar, 30, color, 30);
	baseLayer.colorRect(77, 250, widthOfBar, 30, color, 30);
	baseLayer.colorRect(77, 310, widthOfBar, 30, color, 30);
	baseLayer.colorRect(77, 385, widthOfBar, 30, color, 30);
}

function attributeBar(max, amount, x, y, widthOfBar){
	var baseLayer = kag.current;
	var heightOfBar = 10;
	if (widthOfBar==void){widthOfBar=150;}
	if (amount>max){amount=max;}
	var width = amount * widthOfBar / max;
	baseLayer.colorRect(x-2, y-2, widthOfBar+4, heightOfBar+4, 0x777777, 250);
	baseLayer.colorRect(x, y, widthOfBar, heightOfBar, 0xFFFFFF, 265);
	baseLayer.colorRect(x, y, widthOfBar, heightOfBar, 0xC5C5C5, 50);
	baseLayer.colorRect(x, y, width, heightOfBar, 0xC5C5D2, 200);
	//刻线
	if (widthOfBar==150){
		for (var i=1; i<20; i++){
			baseLayer.colorRect(x+i*widthOfBar\20, y+8, 1, 2,0x333333, 150);
		}
		for (var i=1; i<10; i++){
			baseLayer.colorRect(x+i*widthOfBar\10, y+7, 2, 4,0x555555, 150);
		}
	}else{
		for (var i=1; i<10; i++){
			baseLayer.colorRect(x+i*widthOfBar\10, y+8, 1, 2,0x333333, 150);
		}
		for (var i=1; i<5; i++){
			baseLayer.colorRect(x+i*widthOfBar\5, y+7, 2, 4,0x555555, 150);
		}
	}
	//load前后弧型的图(先左后右, if检查是否空)
	var barLayer = new global.Layer(kag, kag.fore.base);
	if (amount!=0){barLayer.loadImages("bar");}
	else {barLayer.loadImages("bar_void");}
	baseLayer.operateRect(x-4, y-2, barLayer, 0, 0, barLayer.imageWidth, barLayer.imageHeight, omPsNormal);
	if (amount==max){barLayer.loadImages("bar");}
	else {barLayer.loadImages("bar_void");}
	barLayer.flipLR();
	baseLayer.operateRect(x+widthOfBar, y-2, barLayer, 0, 0, barLayer.imageWidth, barLayer.imageHeight, omPsNormal);
}
[endscript]

[macro name="attribute"]
	[locate x=&tf.xLocationOfString y=&(tf.yLocationOfString+tf.i*30)][emb exp="mp.string"]
	[locate x=220 y=&(tf.yLocationOfString+tf.i*30)][emb exp="Math.round(mp.amount)"]
	[eval exp="tf.i++"]
[endmacro]

*drawButtonCaption
[iscript]
//在按钮上写文字
function drawButtonCaption(button, caption, size)
{
button.font.mapPrerenderedFont(sf.fontFace1);

;button.font.face = '宋体';
;button.font.height = size;     
var w = button.font.getTextWidth(caption); 
var x = (button.width - w) \ 2;
var y = (button.height - size) \ 2; 

button.drawText(x, y, caption, 0x1F0F01);

button.drawText(x+button.width, y, caption, 0x000000);

button.drawText(x+button.width+button.width, y, caption, 0x110900);

}
[endscript]
[macro name="textButton"]
	[button graphic=%graphic target=%target]
	[eval exp="drawButtonCaption_item(kag.current.links[kag.current.links.count-1].object, tf.text, 20)"]
[endmacro]

*drawButtonCaption_item
[iscript]
function drawButtonCaption_item(button, caption, size)
{
button.font.face = sf.font0;
button.font.height = size;     
var w = button.font.getTextWidth(caption); 
var x = 5;
var y = (button.height - size) \ 2; 

button.drawText(x, y, caption, 0x000000);
button.drawText(x+button.width, y, caption, 0x1F0F01);
button.drawText(x+button.width+button.width, y, caption, 0x110900);

}
[endscript]
[macro name="drawButtonCaption_item"]
	[button graphic="button_items" target=&tf.string]
	[eval exp="drawButtonCaption_item(kag.current.links[kag.current.links.count-1].object, sf.itemNameC[tf.i], 20)"]
[endmacro]

*drawButtonCaption_good
[macro name="drawButtonCaption_good"]
	[button graphic="button_items" target=%target]
	[eval exp="drawButtonCaption_item(kag.current.links[kag.current.links.count-1].object, tf.nameC, 20)"]
[endmacro]


;把link转成对话选项(星图放在文字先前)
*starLink
[eval exp="tf.star=[0,0,0,0,0]"]
[iscript]

function showStar(number, star){
	if (tf.star[number]==1){
		var baseLayer = kag.current;
		var starImage = new global.Layer(kag, kag.fore.base);
		var x = 185;
		if(baseLayer.frameGraphic=="bottom"){ x = 70; }
		var y = 50 + number*26;
		if(baseLayer.frameGraphic=="bottom"){ y = 10 + number*26 ; }
		if(star==1){starImage.loadImages("star1");}
		else {starImage.loadImages("star2");}
		baseLayer.operateRect(x, y, starImage, 0, 0, starImage.imageWidth, starImage.imageHeight, omPsNormal);
	}
}
[endscript]

[iscript]
function getNumberOfStar(){
	var y = kag.current.cursorY;
	var numberOfStar = (y-49)\26;
	var baseLayer = kag.current;
	if(baseLayer.frameGraphic=="bottom"){ numberOfStar = (y-9)\26 ; }
	if (tf.star[numberOfStar]==0){numberOfStar--;}
	return numberOfStar;
}

[endscript]

[macro name="cleanStar"]
	[eval exp="tf.star=[0,0,0,0,0]"]
[endmacro]

[macro name="starLink"]
	[eval exp="tf.star[mp.number]=1"] 
	[eval exp="showStar(mp.number, 1)"]　
	[if exp="mp.storage==void"]
		[link target=%target onenter="showStar(getNumberOfStar(), 2)" onleave="showStar(getNumberOfStar(), 1)"][emb exp="mp.string"][endlink]
	[elsif exp="mp.target==void"]
		[link storage=%storage onenter="showStar(getNumberOfStar(), 2)" onleave="showStar(getNumberOfStar(), 1)"][emb exp="mp.string"][endlink]
	[else]
		[link storage=%storage target=%target onenter="showStar(getNumberOfStar(), 2)" onleave="showStar(getNumberOfStar(), 1)"][emb exp="mp.string"][endlink]
	[endif]
;*-> target/storage
;string->字
[endmacro]

[iscript]
function printText(x,y,layer,text){
	layer.font.mapPrerenderedFont(sf.fontFace1);
	layer.drawText(x,y,text,0x000000, 255, true, 500, 0x000000, 1, 0, 0);
}
[endscript]

[iscript]
class historyButton extends Layer {

	function  historyButton(window, parent) {
		super.Layer(window, parent);
	}

	function onMouseEnter() {
	}

	function onMouseLeave() {
	}

	function onMouseDown() {
//显示文字履历
		kag.showHistory();
	}
	function clear(){
		super.clear();
	}
}

class historyPlugin extends KAGPlugin {
	global.historyButton = new historyButton(kag, kag.current);
	function historyPlugin(){
		super.KAGPlugin();
	}
	function finalize(){
		super.finalize();
	}
	function buildHistoryButton(){
		historyButton.setPos(500, 140);
		historyButton.loadImages('button_schedule2');
        	historyButton.setSize(100, 25);
		//发布修改:字体
		historyButton.font.mapPrerenderedFont("SimSun_20.tft");
		historyButton.drawText(10, 10, "文字纪录", 0x000000);
		historyButton.font.unmapPrerenderedFont();
		historyButton.visible = true;
	}
	function hideHistoryButton(){
		global.historyButton.visible = false;
	}
	function clearButton(){
		historyButton.clear();
	}
}
global.historyPlugin = new historyPlugin();
kag.addPlugin(global.historyPlugin);
[endscript]


[macro name="cleanHistory"]
;清除纪录
	[eval exp="sf.showHistory='F'"]
	[eval exp="kag.historyLayer.clear()"]
	[history output=false]
	[eval exp="historyPlugin.hideHistoryButton()"]
	[if exp="mp.layer!=void"]
		[current layer=my.layer][er]
	[endif]
[endmacro]




[macro name="talk"]
;set Layer
	[eval exp="f.talkLayer=mp.layer" cond="mp.layer!=void"]
;文字履历
	[eval exp="sf.showHistory=mp.history" cond="mp.history!=void"]
	[if exp="sf.showHistory=='T'"]
		[eval exp="historyPlugin.buildHistoryButton()"]
		[history output=true]
	[else]
		[eval exp="historyPlugin.hideHistoryButton()"]
		[history output=false]
	[endif]
;set talkName
	[if exp="mp.name!=void"][eval exp="f.talkName=mp.name"]
	[elsif exp="mp.portrait!=void"]
		[if exp="mp.portrait.substring(0,7)=='America'"][eval exp="f.talkName='阿美利加'"]
		[elsif exp="mp.portrait.substring(0,7)=='England'"][eval exp="f.talkName='英国'"]
		[elsif exp="mp.portrait.substring(0,10)=='Washington'"][eval exp="f.talkName='华盛顿'"]
		[elsif exp="mp.portrait.substring(0,7)=='Prussia'"][eval exp="f.talkName='普鲁士'"]
		[elsif exp="mp.portrait.substring(0,6)=='France'"][eval exp="f.talkName='法国'"]
		[elsif exp="mp.portrait.substring(0,10)=='Amerindian'"][eval exp="f.talkName='印地安人'"]
		[elsif exp="mp.portrait.substring(0,5)=='girlA'"][eval exp="f.talkName='女性A'"]
		[elsif exp="mp.portrait.substring(0,5)=='girlB'"][eval exp="f.talkName='女性B'"]		[endif]
	[endif]
;f.portraitFeeling[i] = 角色i上一个的Feeling
;****另加一个清f.角色layer的script
	[if exp="(f.talkName=='阿美利加')||(f.talkName=='美国')"][eval exp="tf.person='America'"][eval exp="tf.number=0"]
	[elsif exp="f.talkName=='华盛顿'"][eval exp="tf.person=''"]
	[elsif exp="f.talkName=='英国'"][eval exp="tf.person='England'"][eval exp="tf.number=1"]
	[elsif exp="f.talkName=='法国'"][eval exp="tf.person='France'"][eval exp="tf.number=2"]
	[elsif exp="f.talkName=='普鲁士'"][eval exp="tf.person='Prussia'"][eval exp="tf.number=3"]
	[elsif exp="(f.talkName=='战友')||(f.talkName=='士兵')||(f.talkName=='印地安人')"][eval exp="tf.person=''"]
	[else][eval exp="tf.person=''"]
	[endif]
;设定mp.feeling
	[if exp="tf.person!=''&&mp.feeling == void"]
		[eval exp="mp.feeling='normal'"]
	[endif]
;set portrait
	[if exp="mp.portrait!=void"][eval exp="f.portrait=mp.portrait"]
	[elsif exp="mp.name!=void"]
		[if exp="tf.person != '' "]
			[eval exp="f.portrait=tf.person+'_'+mp.feeling"]
			[eval exp="mp.standing='T'"]
		[else]
			[eval exp="mp.standing='F'"]
			[if exp="mp.name=='华盛顿'"][eval exp="f.portrait='Washington_'"]
			[elsif exp="mp.name=='印地安人'"][eval exp="f.portrait='Amerindian_'"]
			[elsif exp="(mp.name=='战友')||(mp.name=='士兵')"][eval exp="f.portrait='soldier_'"]
			[elsif exp="(mp.name=='女性A')||(mp.name=='护士')"][eval exp="f.portrait='girlA'"]
			[elsif exp="mp.name=='女性B'"][eval exp="f.portrait='girlB'"]
			[else][eval exp="f.portrait='unknown'"]
			[endif]
		[endif]
	[endif]
;让立绘随头像改变
	[if exp="(mp.standing!='F')&&(mp.feeling!=void)"]
;	寻找立绘Layer
		[eval exp="tf.flag=2"]
		[eval exp="tf.portraitLayer=5"]
		[if exp="(kag.fore.layers[0].imageStorage.substring(0,6)==tf.person.substring(0,6)) && (kag.fore.layers[0].visible==true) "]
			[eval exp="tf.portraitLayer=0"]
		[endif]
		[if exp="(kag.fore.layers[1].imageStorage.substring(0,6)==tf.person.substring(0,6)) && (kag.fore.layers[1].visible==true) "]
			[eval exp="tf.portraitLayer=1"]
		[endif]
		[if exp="(kag.fore.layers[2].imageStorage.substring(0,6)==tf.person.substring(0,6)) && (kag.fore.layers[2].visible==true) "]
			[eval exp="tf.portraitLayer=2"]
		[endif]
		[if exp="(kag.fore.layers[3].imageStorage.substring(0,6)==tf.person.substring(0,6)) && (kag.fore.layers[3].visible==true) "]
			[eval exp="tf.portraitLayer=3"]
		[endif]
;	改变立绘
		[if exp="tf.portraitLayer != 5"]
		[eval exp="tf.flag=3.0"]
			[if exp="tf.person=='America'"]
			[eval exp="tf.flag=3.1"]
				[eval exp="tf.string=tf.person+'_'+f.dress+'_'+mp.feeling" cond="mp.feeling!=void"]
			[elsif exp="tf.person=='England'"]
			[eval exp="tf.flag=3.2"]
				[eval exp="tf.dressOfArthur=kag.fore.layers[tf.portraitLayer].imageStorage.substring(0,15)"]
				[eval exp="tf.string=tf.dressOfArthur+'_'+mp.feeling"]
			[else]
				[eval exp="tf.string=tf.person+'_'+mp.feeling+'_'" cond="mp.feeling!=void"]
			[endif]
			[image storage=&tf.string visible=true layer=&tf.portraitLayer]
		[endif]
	[endif]
;Layer & Frame
	[current layer=&f.talkLayer]
	[position layer=&f.talkLayer visible=true left=0 top=270 frame=talk2 margint=45 marginb=50 marginl=185 marginr=50]
	[current layer=&f.talkLayer]
;名字、头像修改=>system > messageLayer > clear()，使er也能重印名字和头像
;输出history
	[eval exp="kag.historyLayer.store(f.talkName)"]
	[eval exp="kag.historyLayer.reline()"]
	[delay speed=user]
[endmacro]

[macro name="bottom"]
	[eval exp="f.bottomLayer=mp.layer" cond="mp.layer!=void"]
	[position layer=&f.bottomLayer visible=true left=0 top=330 frame=bottom margint=5 marginb=5 marginl=70 marginr=30]
	[current layer=&f.bottomLayer][er]
[endmacro]

[macro name="invisible"]
	[position visible=true left=0 top=0 frame=invisible layer=%layer]
	[current layer=%layer][er]
[endmacro]

[macro name="showDate"]
	[position layer=message0 page=fore visible=true left=0 top=0 frame=invisible margint=0 marginb=0 marginl=0 marginr=0]
	[current layer=message0][er]
	[if exp="!(f.month==6||f.month==7||f.month==8)"][eval exp="loadPic(440,-25,kag.fore.messages[0],'date')"]
	[else][eval exp="loadPic(440,-25,kag.fore.messages[0],'dateFall')"][endif]
	[nowait][font size=24 color=0x000844][locate x=25][emb exp="mp.event"]
	[font color=0x000844][locate x=430 y=0][emb exp="f.year"]年[emb exp="f.month"]月[emb exp="f.day"]日[r][endnowait]
[endmacro]
;深红820000

[macro name="america"]
	[eval exp="tf.string='America_'+f.dress+'_'+mp.feeling" cond="mp.feeling!=void"]
	[eval exp="tf.string='America_'+f.dress+'_normal'" cond="mp.feeling==void"]
	[if exp="mp.layer!=void"]
		[eval exp="tf.americaLayer=mp.layer"]
	[elsif exp="tf.americaLayer!=void"]
		[if exp="(kag.fore.layers[tf.americaLayer].imageStorage.substring(0,6)=='Americ') && (kag.fore.layers[tf.americaLayer].visible==true)"]
			[eval exp="tf.americaLayer=tf.americaLayer"]
		[endif]
	[else]
		[if exp="(kag.fore.layers[0].imageStorage.substring(0,6)=='Americ') && (kag.fore.layers[0].visible==true) "]
			[eval exp="tf.americaLayer=0"]
		[elsif exp="(kag.fore.layers[1].imageStorage.substring(0,6)=='Americ') && (kag.fore.layers[1].visible==true) "]
			[eval exp="tf.americaLayer=1"]
		[elsif exp="(kag.fore.layers[2].imageStorage.substring(0,6)=='Americ') && (kag.fore.layers[2].visible==true) "]
			[eval exp="tf.americaLayer=2"]
		[elsif exp="(kag.fore.layers[3].imageStorage.substring(0,6)=='Americ') && (kag.fore.layers[3].visible==true) "]
			[eval exp="tf.americaLayer=3"]
		[else][eval exp="tf.americaLayer=0"][endif]
	[endif]
	[eval exp="tf.pos=mp.pos" cond="mp.pos!=void"]
	[image storage=&tf.string pos=&tf.pos visible=true layer=&tf.americaLayer]
[endmacro]

[macro name="closeLayer"]
@eval exp="tf.layer0=kag.fore.layers[0].visible"
@eval exp="tf.layer1=kag.fore.layers[1].visible"
@eval exp="tf.layer2=kag.fore.layers[2].visible"
@eval exp="tf.layerm0=kag.fore.messages[0].visible"
@eval exp="tf.layerm1=kag.fore.messages[1].visible"
@eval exp="tf.layerm2=kag.fore.messages[2].visible"
@eval exp="tf.layerm3=kag.fore.messages[3].visible"
	[layopt visible=false layer=0]
	[layopt visible=false layer=1]
	[layopt visible=false layer=2]
	[layopt visible=false layer=3]
	[layopt visible=false layer=message0]
	[layopt visible=false layer=message1]
	[layopt visible=false layer=message2]
	[layopt visible=false layer=message3]
[endmacro]

[macro name="openLayer"]
@eval exp="kag.fore.layers[0].visible=tf.layer0"
@eval exp="kag.fore.layers[1].visible=tf.layer1"
@eval exp="kag.fore.layers[2].visible=tf.layer2"
@eval exp="kag.fore.messages[0].visible=tf.layerm0"
@eval exp="kag.fore.messages[1].visible=tf.layerm1"
@eval exp="kag.fore.messages[2].visible=tf.layerm2"
@eval exp="kag.fore.messages[3].visible=tf.layerm3"
[endmacro]

[macro name="setBasePlace"]
[if exp="f.stage=='A'||f.stage=='C'||f.stage=='E'"]
	[image storage="independence_hall" layer=base]
[elsif exp="f.stage=='B'||f.stage=='D'"]
	[image storage="Couder_Yorktown_Versailles" layer=base][else][image storage="house" layer=base]
[endif]
[endmacro]

[macro name="changeBasePlace"]
	[image storage=%picture layer=base page=back]
	[trans method=universal rule=universal_1 time=1000 children=false][wt canskip=true][wait time=100]
[endmacro]

*showCommentOfSchedule
[iscript]
function showCommentOfSchedule(com)
{
	var msgLayer = kag.fore.messages[2];  
	msgLayer.font.mapPrerenderedFont(sf.fontFace1);
	if(com=='财政')
		msgLayer.drawText(0,460,"财政方针:增发纸币/维持现状。增发纸币能增加收入，伴随通涨的风险。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='粮食')
		msgLayer.drawText(0,460,"粮食方针:节约/一般/丰富。影响粮食耗用量和健康。剩余粮食:"+f.food,0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='战略课')
		msgLayer.drawText(0,460,"跟上司学习战略，包括军事计划、情报交收等。提升智力。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='军纪课'){
		if(f.year<1778||(f.year==1778&&f.month==1))
			msgLayer.drawText(0,460,"由上司训练。提高军纪。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
		else
			msgLayer.drawText(0,460,"由普鲁士训练。提高军纪。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	}
	else if(com=='射击课'){
		if(f.year<1778||(f.year==1778&&f.month==1))
			msgLayer.drawText(0,460,"由上司训练。提高枪械技能。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
		else
			msgLayer.drawText(0,460,"由普鲁士训练。提高枪械技能。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	}
	else if(com=='外交课')
		msgLayer.drawText(0,460,"跟上司学习外交知识，包括国际政治、礼仪、说话技巧等。提升谈吐。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='种植')
		msgLayer.drawText(0,460,"种植农作物，收成获得粮食。农作物生成度:"+Math.round(f.farm/35*100)+"%",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='开垦')
		msgLayer.drawText(0,460,"重新开垦耕地，以种植粮食。农田开发度:"+Math.round(f.cultivation/30*100)+"%",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='购物')
		msgLayer.drawText(0,460,"到城镇或港口购物。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='赚钱')
		msgLayer.drawText(0,460,"工作以赚取金钱报酬。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='休息')
		msgLayer.drawText(0,460,"自由活动，放松心情。现时疲累值:"+f.fatigue,0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='诊疗')
		msgLayer.drawText(0,460,"接受诊治，休养生息，医治疾病。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='处理政务')
		msgLayer.drawText(0,460,"处理各种建国事宜、战后复苏等。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='战役')
		msgLayer.drawText(0,460,"下个月有战役，不能安排行程。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else if(com=='撤消')
		msgLayer.drawText(0,460,"点击撤消行程安排。",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	else
		msgLayer.drawText(0,460,"未定",0xffffff, 255, true, 500, 0x000000, 1, 0, 0);
	msgLayer.visible=true; 
}

function hideCommentOfSchedule(){  
	var msgLayer = kag.fore.messages[2];  
	msgLayer.clear();  
	msgLayer.visible=false;  
}  
[endscript]

;音量
[if exp="sf.gvolume_bgm!=void"][bgmopt gvolume=&sf.gvolume_bgm][endif]
[if exp="sf.gvolume_se!=void"][seopt gvolume=&sf.gvolume_se][endif]

*savePicture

;sf.CG<-0   用于记录该CG是否已收藏
;sf.endingPicture<-0   用于记录该结局是否已收藏

;初始化相片图集
[if exp="sf.CG == void"]
	[eval exp="sf.CG = new Array()"]
;loop - CG
	[eval exp="tf.i = 0"]
*picture_initialization
	[eval exp="sf.CG[tf.i]=0"]
	[eval exp="tf.i++"]
	[call target=*picture_initialization cond="tf.i<=24"]
;loop - endingPicture
	[eval exp="sf.endingPicture = new Array()"]
	[eval exp="tf.i = 0"]
*ending_initialization
	[eval exp="sf.endingPicture[tf.i]=0"]
	[eval exp="tf.i++"]
	[call target=*ending_initialization cond="tf.i<=4"]
;图片名字初始化
	[eval exp="sf.CGName = new Array()"]
	[eval exp="sf.CGName[1] = 'CG_letter'"]
	[eval exp="sf.CGName[2] = 'CG_rifle'"]
	[eval exp="sf.CGName[3] = 'CG_indians'"]
	[eval exp="sf.CGName[4] = 'CG_battle_lose'"]
	[eval exp="sf.CGName[5] = 'CG_battle_win'"]
	[eval exp="sf.CGName[6] = 'CG_guerrilla'"]
	[eval exp="sf.CGName[7] = 'CG_Hell'"]
	[eval exp="sf.CGName[8] = 'CG_france'"]
	[eval exp="sf.CGName[9] = 'CG_vaccination'"]
	[eval exp="sf.CGName[10] = 'CG_Prussia'"]
	[eval exp="sf.CGName[11] = 'CG_PrussiaHandbook'"]
	[eval exp="sf.CGName[12] = 'CG_borrowMoney'"]
	[eval exp="sf.CGName[13] = 'CG_draftedOfTreatyOfParis'"]
	[eval exp="sf.CGName[14] = 'CG_draftedOfTreatyOfLondon'"]
	[eval exp="sf.CGName[15] = 'CG_victory'"]
	[eval exp="sf.CGName[16] = 'CG_encounter1'"]
	[eval exp="sf.CGName[17] = 'CG_encounter2'"]
	[eval exp="sf.CGName[18] = 'CG_chat'"]
	[eval exp="sf.EndingName = new Array()"]
	[eval exp="sf.EndingName[1] = 'ending_indenpence'"]
	[eval exp="sf.EndingName[2] = 'ending_united'"]
	[eval exp="sf.EndingName[3] = 'ending_unchanged'"]
	[eval exp="sf.EndingName[4] = 'ending_captivity'"]
[endif]

[iscript]
function searchCG(pictureName){
	var i=1;
	while (pictureName!=sf.CGName[i]&&i<=24){
		i++;
	}
	return i;
}

function searchEnding(pictureName){
	var i=1;
	while (pictureName!=sf.EndingName[i]&&i<=6){
		i++;
	}
	return i;
}
[endscript]


[macro name="showCG"]
	[closeLayer]
	[eval exp="tf.cg=mp.cg"]
	[image storage=&tf.cg left=0 top=0 visible=true layer=3]
	[eval exp="sf.CG[searchCG(&mp.cg)]=1"]
	[wait time=500]
	[l]
	[openLayer]
	[layopt layer=3 visible=false]
[endmacro]

[macro name="showEnding"]
	[closeLayer]
	[eval exp="tf.ending=mp.ending"]
	[image storage=&tf.ending left=0 top=0 visible=true layer=3]
	[eval exp="sf.endingPicture[searchEnding(&mp.ending)]=1"]
	[wait time=500]
	[l]
	[position layer=message1 visible=true left=0 top=0 frame=invisible margint=0 marginb=0 marginl=0 marginr=0][current layer=message1][er]
	[locate x=270 y=420]
	[link storage="first.ks"]按此结束[endlink][s]
	[openLayer]
	[layopt layer=3 visible=false]
[endmacro]

[return]



