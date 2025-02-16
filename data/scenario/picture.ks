;sf.CG<-0   用于记录该CG是否已收藏
;sf.endingPicture<-0   用于记录该结局是否已收藏

;显示和收藏图片
;[image storage="" layer=base]
;[eval exp="sf.CG[searchCG('')]=1"]

[eval exp="tf.page=1"]

[iscript]
function get_tfi(){  
	var x=kag.lastMouseDownX; 
	var y=kag.lastMouseDownY; 

	x = (x-60)\180;
	if (y<=220)
		y=0;
	else
		y=1;
	tf.i = (tf.page-1)*6 + y*3 + x +1;
}

function thumbnail(i, x, y, type){
	var itemLayer = new Layer(kag, kag.fore.base);
	var baseLayer = kag.current;
	if(type=='CG')
		itemLayer.loadImages(sf.CGName[i]);
	else
		itemLayer.loadImages(sf.EndingName[i]);
	itemLayer.stretchCopy(0, 0, 160, 120, itemLayer, 0, 0, itemLayer.imageWidth, itemLayer.imageHeight, stLinear);
	baseLayer.operateRect(x, y, itemLayer, 0, 0, 160, 120, omPsNormal);
}

function unknownPic(x, y){
	var itemLayer = new Layer(kag, kag.fore.base);
	var baseLayer = kag.current;
	itemLayer.loadImages("160_120");
	baseLayer.operateRect(x, y, itemLayer, 0, 0, 160, 120, omPsNormal);
}

[endscript]

*CG
[layopt visible=false layer=0]
[position layer=message0 frame=invisible visible=true left=0 top=0 margint=0 marginb=0 marginl=0 marginr=0][current layer=message0][er]
[image storage="invisible" layer=base]
[locate y=20][font size=24][style align=center]相片图集[r][style align=left][font size=20]
[eval exp=" tf.i=(tf.page-1)*6 "]
*showPictures
;显示第i张图片
[eval exp="tf.i++"]
[eval exp="tf.xlocation=60+(tf.i-1)%3*180"]
[if exp="(tf.i-1)%6<3"][eval exp="tf.ylocation = 100"]
[else][eval exp="tf.ylocation = 250"][endif]
[locate x=&tf.xlocation y=&tf.ylocation]
;显示button
[if exp="sf.CG[tf.i]==0"]
	[eval exp="unknownPic(tf.xlocation, tf.ylocation)"]
[else]
;载入function:绘制缩图到layer0
	[eval exp="thumbnail(tf.i, tf.xlocation, tf.ylocation, 'CG')"]
	[button graphic="160_120_transparent" target=*showCGi exp="get_tfi()"]
;160_120_transparent
[endif]
[call target=*showPictures cond="tf.i<tf.page*6"]
[call target=*page]
[call target=*linking][s]

*showCGi
[layopt visible=false layer=message0]
[eval exp="tf.string=sf.CGName[tf.i]"]
[image storage=&tf.string visible=true page=fore layer=0 left=0 top=0]
[l]
[jump target=*CG]

*ending
[layopt visible=false layer=0]
[layopt visible=true layer=message0][current layer=message0][er]
[locate y=20][font size=24][style align=center]结局图集[r][style align=left][font size=20]
[eval exp="tf.page=1"]
[eval exp=" tf.i=0 "]
*showendings
[eval exp="tf.i++"]
[eval exp="tf.xlocation=120+(tf.i-1)%2*240"]
[if exp="(tf.i-1)%4<2"][eval exp="tf.ylocation = 100"]
[else][eval exp="tf.ylocation = 250"][endif]
[locate x=&tf.xlocation y=&tf.ylocation]
;显示button
[if exp="sf.endingPicture[tf.i]==0"]
	[eval exp="unknownPic(tf.xlocation, tf.ylocation)"]
[else]
;载入function:绘制缩图到layer0
	[eval exp="thumbnail(tf.i, tf.xlocation, tf.ylocation, 'Ending')"]
	[button graphic="160_120_transparent" target=*showEndingi exp="get_tfi()"]
[endif]
[call target=*showendings cond="tf.i<4"]
[call target=*linking][s]

*showEndingi
[layopt visible=false layer=message0]
[eval exp="tf.string=sf.EndingName[tf.i]"]
[image storage=&tf.string visible=true page=fore layer=0 left=0 top=0]
[l]
[jump target=*ending]

*page
	[locate y=410][style align=center]
	[link target=*CG exp="tf.page=1"]1[endlink]　　
	[link target=*CG exp="tf.page=2"]2[endlink]　　
	[link target=*CG exp="tf.page=3"]3[endlink]　　
	;[link target=*CG exp="tf.page=4"]4[endlink]
[return]


*linking
	[locate y=440][style align=center]
	[link target=*CG]CG图集[endlink]　　
	[link target=*ending]结局图集[endlink]　　
	;[link target=*NG]福利花絮[endlink]　　
	[link storage="first.ks"]主界面[endlink]
[return]
