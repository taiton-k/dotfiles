import XMonad
import Data.Monoid
import System.Exit

import XMonad.ManageHook

import qualified XMonad.Actions.FlexibleManipulate as Flex

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.FadeInactive

import XMonad.Layout.Spacing
import XMonad.Layout.Circle
import XMonad.Layout.OneBig
import XMonad.Layout.HintedGrid
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutModifier
import XMonad.Layout.IndependentScreens

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad

import XMonad.Operations



main = xmonad $ withSB myPolybarConf $ ewmhFullscreen $ ewmh $ docks $ def {
        terminal           = "alacritty",
        focusFollowsMouse  = True,
        clickJustFocuses   = True,
        borderWidth        = 3,
        modMask            = mod4Mask,
        workspaces         = withScreens 2 ["web", "coding", "terminal", "game", "other"],
        normalBorderColor  = "#1e1e29",
        focusedBorderColor = "#afaffd",

        keys = \c -> mkKeymap c (myKeymaps c),
        mouseBindings = \(XConfig {XMonad.modMask = modm}) -> M.fromList [
                ((modm, button1), \w ->
                        focus w >> Flex.mouseWindow (\x ->
                                if x < 0.15 then 0
                                else if x > 0.85 then 1
                                else 0.5
                        ) w >> windows W.shiftMaster
                ),
                ((modm, button2), \w ->
                        focus w >> windows W.shiftMaster
                ),
                ((modm, button3), \w ->
                        focus w >> mouseResizeWindow w >> windows W.shiftMaster
                )
        ],

        layoutHook = myLayoutHook,
        manageHook = manageHook def <+> namedScratchpadManageHook mySPconf,
        handleEventHook = mempty,
        logHook = return (),
        startupHook = return ()
}

myKeymaps conf = [
                ("M-S-<Return>", spawn $ XMonad.terminal conf),
                ("M-p", spawn "rofi -mode combi -show combi"),
                ("M-v", spawn "vivaldi-stable"),
                ("M-f", spawn "pcmanfm"),
                ("M-s", spawn "pavucontrol"),
                ("M-o", namedScratchpadAction mySPconf "Terminal"),
                ("M-c", kill),
                ("M-<Space>", sendMessage NextLayout),
                ("M-S-<Space>", setLayout $ XMonad.layoutHook conf),
                ("M-n", refresh),
                ("M-<Tab>", windows W.focusDown),
                ("M-S-<Tab>", windows W.focusUp),
                ("M-j", windows W.focusDown),
                ("M-k", windows W.focusUp),
                ("M-m", windows W.focusMaster),
                ("M-<Return>", windows W.swapMaster),
                ("M-S-j", windows W.swapDown),
                ("M-S-k", windows W.swapUp),
                ("M-h", sendMessage Shrink),
                ("M-l", sendMessage Expand),
                ("M-t", withFocused $ windows . W.sink),
                ("M-,", sendMessage (IncMasterN 1)),
                ("M-.", sendMessage (IncMasterN (-1))),
                ("M-S-q", io exitSuccess),
                ("M-q", spawn "xmonad --recompile; xmonad --restart"),

                ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +500"),
                ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -500"),
                ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
        ] ++ [
                ("M-" ++ m ++ show k, windows $ onCurrentScreen f i) |
                        (i, k) <- zip (workspaces' conf) [1 .. 5],
                        (f, m) <- [(W.greedyView, ""), (W.shift, "S-")]
        ]

myLayoutHook = layout1 ||| layout2 ||| layout3
        where
                layout1 = lessBorders OnlyScreenFloat $ makeSpace $ GridRatio (4 / 5) True
                layout2 = lessBorders OnlyScreenFloat $ makeSpace Full
                layout3 = noBorders Full
                makeSpace layout = spacingRaw  False layoutSpace True windowSpace True $ avoidStruts layout
                layoutSpace = Border 10 10 10 10
                windowSpace = Border 10 10 10 10

myPolybarConf = def {
        sbStartupHook = spawn "sleep 0.1; ~/.config/polybar/launch.sh",
        sbCleanupHook = spawn "killall polybar"
}

mySPconf = [
                NS "Terminal"
                "alacritty --title Terminal"
                (title =? "Terminal")
                (customFloating $ W.RationalRect 0.25 0.25 0.5 0.5)
        ]
