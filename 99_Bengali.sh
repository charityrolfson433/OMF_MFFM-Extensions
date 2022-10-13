#--Bengali Extension for OMF
#--v3.6
#--2022/10/13
#--By MFFM

##---------------------
## ইন্সট্র্যাকশন্স ##
##---------------------
## এন্ড্রোয়েডে বাংলা ফন্ট ব্যবহার করার জন্যে আপনার মূলত তিনটা ওয়েটের ফন্ট  দরকার হবে, বোল্ড/মিডিয়াম এবং রেগুলার। যে ফন্টটি ব্যবহার করতে চান  সেটা যদি শুধুমাত্র একটা  (রেগুলার) ওয়েট থাকে, তাহলে
## সেই একটি ফাইলকে কপি করে  তিনটি ফন্ট বানিয়ে নিন। এরপর তিনটা ফাইল কে নিচের মত করে রিনেম করুন। 
## Bengali-Regular.ttf
## Bengali-Medium.ttf
## Bengali-Bold.ttf

## এবার এই ফাইল গুলো সরাসরি OMF ডিরেক্টরি তে কপি করুন (ইন্টারনাল মেমোরির  OhMyFont নামে যে ফোল্ডার টি আছে  এটাকেই আমরা OMF Directory বা  ওমএফ ফোল্ডার বলছি) । আপনি চাইলে ফাইল গুলোকে
## জিপ করে Bengali.zip নামে রিনেম করেও  ওএমএফ ডিরেক্টরিতে রাখতে পারেন। 
## এবার  এই স্ক্রিপ্ট ফাইল  টি কপি করে  সেইম (OMF) ফোল্ডারে রাখুন। এবং সবশেষে, আপনার OMF পাওয়ার্ড মডিউল টি ফ্ল্যাশ করুন।  

##---------------------
## Instructions ##
##---------------------
## You are gonna need 3 weights of your Bengali font, Bold/Medium/Regular. If you have only one weight (ie. Regular), copy it and make total 3 copies. 
## Rename the 3 weight (Bold/Medium/Regular) Bengali font like this: 

## Bengali-Regular.ttf
## Bengali-Medium.ttf
## Bengali-Bold.ttf

## From this point you can directly copy the font files to OMF directory (/sdcard/OhMyFont) 
## or make a zip of the fonts and rename it to Bengali.zip and then copy it to avoid messy environment inside the folder.
## Finally put the script in the OMF Directory and flash the OMF powered module. 

bffiles(){
   if [ -f $OMFDIR/Bengali-Regular.ttf ]; then
       cp $OMFDIR/Bengali-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
       cp $OMFDIR/Bengali-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
       cp $OMFDIR/Bengali-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf
   fi
   if [ -f $OMFDIR/Beng-Regular.ttf ]; then
      cp $OMFDIR/Beng-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
      cp $OMFDIR/Beng-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
      cp $OMFDIR/Beng-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf
   fi
   if [ -f $OMFDIR/Bengali*.zip ]; then
       unzip -q $OMFDIR/Bengali*.zip -d $MODPATH
       cp $MODPATH/Beng-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
       cp $MODPATH/Beng-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
       cp $MODPATH/Beng-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf	
       cp $MODPATH/Bengali-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
       cp $MODPATH/Bengali-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
       cp $MODPATH/Bengali-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf
 elif [ -f $OMFDIR/Beng*.zip ]; then
       unzip -q $OMFDIR/Beng*.zip -d $MODPATH    
       cp $MODPATH/Beng-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
       cp $MODPATH/Beng-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
       cp $MODPATH/Beng-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf	
       cp $MODPATH/Bengali-Regular.ttf $SYSFONT/NotoSansBengali-VF.ttf
       cp $MODPATH/Bengali-Medium.ttf $SYSFONT/NotoSerifBengali-VF.ttf
       cp $MODPATH/Bengali-Bold.ttf $SYSFONT/NotoSansBengaliUI-VF.ttf
   fi
}

bpatch(){
    if [ -f $SYSFONT/NotoSansBengali-VF.ttf ]; then
	ui_print '+ Bengali'
        local italic=false; mksty und-Beng.* 7 4
        font und-Beng.* NotoSansBengali-VF.ttf r
        font und-Beng.* NotoSerifBengali-VF.ttf m
        font und-Beng.* NotoSerifBengali-VF.ttf sb
        font und-Beng.* NotoSansBengaliUI-VF.ttf b
        ver Beng
    fi
}

bffiles
bpatch
