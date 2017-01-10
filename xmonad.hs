import XMonad
import XMonad.Actions.FocusNth
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout
import XMonad.Layout.Column
import XMonad.Layout.Combo
import XMonad.Layout.FixedColumn
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.OneBig
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

baseConfig = ewmh defaultConfig

myWorkspaces = ["web", "dev", "im"] ++ map show [4 .. 8] ++ ["junk"]

defaultLayout = FixedColumn 1 5 128 10

myIM = withIM (1/7) ((ClassName "Skype") `And` (Not (Role "ConversationsWindow"))) (Tall 1 0.01 0.5)

-- too hard to maintain window numbers :(
myDevLayout = combineTwo (Mirror $ TwoPane 0.03 0.8) (FixedColumn 1 5 128 10) Full

-- myTabbed = tabbed shrinkText def

-- myDevLayout = spiralWithDir South CW 0.68 -- FixedColumn 1 5 130 10

myLayoutHook = windowNavigation $ noBorders 
    (onWorkspace "im" (myIM ||| Full ||| defaultLayout) $
     onWorkspace "dev" (myDevLayout ||| defaultLayout ||| Full) $
     defaultLayout ||| myDevLayout ||| Full
    )

myManageHook = composeAll
    [ (className =? "Chromium" <&&> resource =? "getgoing.slack.com") --> doShift "im"
    , (className =? "Chromium" <&&> resource =? "messenger.com") --> doShift "im"
    , className =? "Skype" --> doShift "im"
    , className =? "KeePass2" --> doShift "junk"
    , isDialog --> doCenterFloat
    ]

myBrowser = "chromium"
incognitoBrowser = "chromium --incognito"
myFileManager = "thunar"
myTerminal = "terminator"

myKeys = 
    [ ((mod1Mask .|. controlMask, xK_Delete), spawn "xscreensaver-command -lock")
    , ((mod4Mask .|. shiftMask, xK_s), spawn "systemctl suspend")
    , ((mod4Mask, xK_b), spawn myBrowser)
    , ((mod4Mask .|. shiftMask, xK_b), spawn incognitoBrowser)
    , ((mod4Mask, xK_f), spawn myFileManager)
    , ((mod4Mask, xK_Left), sendMessage $ Swap L)
    , ((mod4Mask, xK_Right), sendMessage $ Swap R)
    , ((mod4Mask, xK_Up), sendMessage $ Swap U)
    , ((mod4Mask, xK_Down), sendMessage $ Swap D)
    ] -- ++ [((mod1Mask, k), focusNth i) | (i, k) <- zip [0 .. 8] [xK_1 ..]]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ baseConfig
        { terminal    = myTerminal
        , modMask     = mod4Mask
        -- , focusFollowsMouse = False
        , manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  myLayoutHook
        , workspaces = myWorkspaces
        , logHook = fadeInactiveLogHook 0.8 >> dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        } `additionalKeys` myKeys
