[eval exp="sf.savedate= new Array()" cond="sf.savedate==void"]
[eval exp="tf.savePlace=0"]

[iscript]
function get_savePlace(){  
	var y=kag.lastMouseDownY; 
	tf.savePlace = (y-130)\30;
}

function drawButtonCaption_saveload(button, caption, size)
{
button.font.face = sf.font0;
button.font.height = size;
var x = 20;
var y = (button.height - size) \ 2;

if(tf.i==9)
	x=8;
button.drawText(x, y, caption, 0x000000);
button.drawText(x+button.width,              y, caption, 0x505050);
button.drawText(x+button.width+button.width, y, caption, 0x505050);
}

[endscript]

*save_load
[current layer=message1 page=fore][er]
[position layer=message2 visible=false]
[position layer=message3 visible=false draggable=false]
[layopt layer=0 visible=false]
[position layer=message1 visible=true left=0 top=70 frame=saveload margint=5 marginb=0 marginl=40 marginr=0]
[locate x=268 y=18][button graphic=close storage="game.ks"]
[locate x=10 y=15][font size=24]
存点   日期
[eval exp="tf.i=0"]
*printing_link
[locate x=10 y=&(50+tf.i*30)]
[button graphic="link_saveload" target=*save_load_ exp="get_savePlace()"]
[eval exp="drawButtonCaption_saveload(kag.current.links[kag.current.links.count-1].object, tf.i+1+'　 　'+sf.savedate[tf.i], 24)"]
[eval exp="tf.i++"]
[jump target=*printing_link cond="tf.i<10"]
[s]

*save_load_
[position layer=message3 visible=true left=370 top=160 frame=dialog margint=0 marginb=0 marginl=0 marginr=0]
[current layer=message3][er]
[locate x=205 y=2][button graphic=close target=*save_load]
[locate y=20]
[font size=24][style align=center]
[link target=*save]存储[endlink]
[if exp="sf.savedate[tf.savePlace]!=''"]
	[r]
	[link target=*load]读取[endlink]
[endif]
[s]


*save
[eval exp="sf.savedate[tf.savePlace]=f.year+'年'+f.month+'月'+f.day+'日'"]
[position layer=message3 visible=false draggable=true]
[save place=&tf.savePlace]

*load
[load place=&tf.savePlace]