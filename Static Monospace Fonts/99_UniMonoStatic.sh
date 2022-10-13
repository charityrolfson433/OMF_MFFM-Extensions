# Universal Static Monospace Font Extension
# 2022/10/13
# v1.5
# By MFFM

## Instructions
#📌 Just add Mono- before the name of your Monospace (Regular) font. 
#📌 Copy the script file (*.sh) and the Monospace font to OMF Directory before flashing the module.

if [ -f $OMFDIR/Mono*.ttf ]; then
    ui_print '+ Monospace (Static)'
	  cp $OMFDIR/Mono*.ttf $SYSFONT/DroidSansMono.ttf
	  cp $OMFDIR/Mono*.ttf $SYSFONT/CutiveMono.ttf
    ver Mono
fi
