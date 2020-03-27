import XMonad
import qualified XMonad.Actions.Volume as Volume
import XMonad.Hooks.ManageHelpers
  ( doCenterFloat
  , doFullFloat
  , isDialog
  , transience'
  )
import XMonad.Hooks.SetWMName
import XMonad.StackSet (focusDown, focusUp)
import XMonad.Util.EZConfig

-- Key definitions
--
--
winKey = mod4Mask

-- Functions
--
-- Screenshot
--
--
screenshotPath = "~/pictures/screenshots/$(date +%Y-%m-%d_%H.%M.%S.png)"

doFullScreenshot :: X ()
doFullScreenshot = spawn $ "scrot -q 85 " ++ screenshotPath

doSelectScreenshot :: X ()
doSelectScreenshot =
  spawn $
  "sleep 0.2; scrot -q 85 -a $(slop -f '%x,%y,%w,%h') " ++ screenshotPath

-- Hooks
--
--
myManageHook =
  composeAll
    [ className =? "Emacs" --> doShift "1"
    , className =? "Firefox" --> doShift "2"
    , className =? "keepassxc" --> doShift "7"
    , className =? "KeePassXC" --> doShift "7"
    ]

-- Key mapping.
--
--
myRemovedKeys = [("M-<Space>")]

myKeyMap =
  [ ("M-h", windows focusUp)
  , ("M-l", windows focusDown)
  , ("M-S-h", sendMessage Shrink)
  , ("M-S-l", sendMessage Expand)
  , ("M-n", sendMessage NextLayout)
  , ("M-<Left>", Volume.lowerVolume 2 >> return ())
  , ("M-<Right>", Volume.raiseVolume 2 >> return ())
  , ("M-<Up>", Volume.raiseVolume 10 >> return ())
  , ("M-<Down>", Volume.lowerVolume 10 >> return ())
  , ("<Print>", doFullScreenshot)
  , ("S-<Print>", doSelectScreenshot)
  ]

--  , ("M-<Right>", Volume.raiseVolume 2)
-- Fix the display problem of Java Swing programs.
myStartupHook = setWMName "LG3D"

myConfig =
  def
    { modMask = winKey -- Set 'Mod' to windows key.
    , terminal = "urxvt" -- Set default terminal to URxvt.
    , borderWidth = 0 -- Disable border width.
    , manageHook = myManageHook
    , startupHook = myStartupHook
    }

-- myKeyMap config = [("M-")]
main = xmonad $ myConfig `removeKeysP` myRemovedKeys `additionalKeysP` myKeyMap
