*historyStart



*history 
[er]
[position layer=message3 visible=true frame=invisible margint=50 marginb=20 marginl=50 marginr=50]
[current layer=message3]
[history enabled=true output=false]
[eval exp="tf.temp=0"]
[emb exp="kag.historyLayer.dataPos"][l]
*history_1
[if exp="kag.historyLayer.data[kag.historyLayer.dataPos-tf.temp] != void"]
	[emb exp="kag.historyLayer.data[kag.historyLayer.dataPos-tf.temp]"][r]
[endif] 
[eval exp="tf.temp+=1"]
[jump target=*history_1 cond="(tf.temp < kag.historyLayer.dataPos)&&(tf.temp < 20)"]
[locate x=300 y=350]
[link target=*return]返回[endlink][s]

*return
[history enabled=false output=true]
[layopt visible=false layer=message3]
[current layer=message2]