
Control the click-to-run utility for Office apps.

It runs constantly for no reason. Should only run while Office apps are going.

start-word.bat
  turns on the utility before starting word. stops utility when word stops.

invisible.vbs
  runs start-word.bat but without making a terminal window
  
runner shortcut
  use this in place of your shortcut for Word
  note you'll need to use correct paths to the .vbs and .bat.
  for now the shortcut runs the command below

```
wscript.exe "E:\Desktop\office-cleanrun\invisible.vbs" "E:\Desktop\office-cleanrun\start-word.bat"
```

you can make other versions of start-word.bat for the other office apps, and shortcuts for those other versions as well.
