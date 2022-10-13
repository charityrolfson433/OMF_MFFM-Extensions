# Universal Emoji Extension For OMF v2.5.2
# By MFFM
# 2022-10-13
# Special Thanks To @MrCarb0n

## Instructions
#📌 Rename and add Emoji- in front of the name of the Emoji font. eg, Rename WhatsappEmoji.ttf to Emoji-WhatsappEmoji.ttf
#📌 Copy the script (sh) file and the Renamed Emoji font to OMF Directory
#📌 Extension Replaces system emoji and Facebook/Messenger emojis as well

[ ! -d $OMFDIR/service.d ] && mkdir -p $OMFDIR/service.d

uniemoji(){
    [ $OMFDIR/Emoji*.ttf ] && ui_print "+ Installing Custom Emoji" || ui_print "- Custom Emoji Resources Not Found."
    DEMJ="NotoColorEmoji.ttf"
    [ $ORISYSFONT/$DEMJ ] && cp $OMFDIR/Emoji*.ttf $SYSFONT/$DEMJ &&  ui_print "- Replacing $DEMJ ✅" || ui_print "- Replacing $DEMJ ❎"
	
	SEMJ="$(find $ORISYSFONT -type f ! -name 'NotoColorEmoji.ttf' -name "*Emoji*.ttf" -exec basename {} \;)"	
	for i in $SEMJ ; do
        if [ -f $SYSFONT/$DEMJ ]; then
	   ln -s $SYSFONT/$DEMJ $SYSFONT/$i && ui_print "- Replacing $i ✅" || ui_print "- Replacing $i ❎"
        fi
    done

    [ -d /data/fonts ] && rm -f -rf /data/fonts
    [ -d /data/data/com.google.android.inputmethod.latin ] &&
        find /data -type d -path '*inputmethod.latin*/*cache*' -exec rm -f -rf {} + &&
        am force-stop com.google.android.inputmethod.latin
}

uniemoji

{
    echo '#!/system/bin/sh'	
    echo '## Universal Emoji Extension For OMF v2.5.2 by MFFM'
    echo '## 2022/10/13'
    echo ''
    echo '('
    echo 'cp -rf $MODPATH/system/fonts/NotoColorEmoji.ttf /data/data/com.facebook.orca/app_ras_blobs'
    echo 'cd /data/data/com.facebook.orca/app_ras_blobs/'
    echo 'mv NotoColorEmoji.ttf FacebookEmoji.ttf'
    echo 'cp -rf $MODPATH/system/fonts/NotoColorEmoji.ttf /data/data/com.facebook.katana/app_ras_blobs'
    echo 'cd /data/data/com.facebook.katana/app_ras_blobs/'
    echo 'mv NotoColorEmoji.ttf FacebookEmoji.ttf'
    echo ''
    echo 'am force-stop com.facebook.orca'
    echo 'am force-stop com.facebook.katana'
    echo ''
    echo 'set_perm_recursive /data/data/com.facebook.katana/app_ras_blobs/FacebookEmoji.ttf 0 0 0755 700'
    echo 'set_perm_recursive /data/data/com.facebook.orca/app_ras_blobs/FacebookEmoji.ttf 0 0 0755 700'
    echo 'set_perm_recursive /data/data/com.facebook.katana/app_ras_blobs 0 0 0755 755'
    echo 'set_perm_recursive /data/data/com.facebook.orca/app_ras_blobs 0 0 0755 755'
    echo ''
    echo '[ -d /data/fonts ] && rm -f -rf /data/fonts'
    echo ')'
} > $OMFDIR/service.d/svc_uniemoji.sh
