import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
   [ className =? "Yakuake" --> doFloat
   , manageDocks
   ]           

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/jon//.xmobarrc"
xmproc <- spawnPipe "/usr/bin/yakuake"
xmonad $ defaultConfig
        { modMask = mod4Mask
        , terminal = "konsole"
        , manageHook = myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        }
        `additionalKeys`
        [
          ((0            , 0x1008ff11), spawn "amixer set Master 4-")
        , ((0            , 0x1008ff13), spawn "amixer set Master 4+")
        ]
        
