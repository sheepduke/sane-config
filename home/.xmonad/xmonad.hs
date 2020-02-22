import XMonad
import XMonad.Hooks.ManageHelpers
  ( doCenterFloat
  , doFullFloat
  , isDialog
  , transience'
  )
import XMonad.StackSet (focusDown, focusUp)
import XMonad.Util.EZConfig

-- Key definitions
--
--
winKey = mod4Mask

myManageHook =
  composeAll
    [ className =? "Emacs" --> doShift "1"
    , className =? "Firefox" --> doShift "2"
    , className =? "keepassxc" --> doShift "7"
    , className =? "KeePassXC" --> doShift "7"
    , isDialog --> doCenterFloat
    ]

myRemovedKeys = [("M-<Space>")]

myKeyMap =
  [ ("M-h", windows focusUp)
  , ("M-l", windows focusDown)
  , ("M-S-h", sendMessage Shrink)
  , ("M-S-l", sendMessage Expand)
  , ("M-n", sendMessage NextLayout)
  ]

myConfig =
  def
    { modMask = winKey -- Set 'Mod' to windows key.
    , terminal = "urxvt" -- Set default terminal to URxvt.
    , borderWidth = 0 -- Disable border width.
    , manageHook = myManageHook
    }

-- myKeyMap config = [("M-")]
main = xmonad $ myConfig `removeKeysP` myRemovedKeys `additionalKeysP` myKeyMap
