{- |
Module      : Main
Copyright   : Copyright (c) 2016 Elvis
Licence     : MIT (see LICENSE in the distribution)
Maintainer  : github.com/cpselvis
This file implements a REPL /shell/ to host the interpreter, and also
allows execution of stand-alone files containing Scheme code.
-}

main :: IO ()
main = showBanner


-- |A utility function to display the husk console banner
showBanner :: IO ()
showBanner = do
    putStrLn "  _   _       _       _____    _    _    ______   _        _              "
    putStrLn " | | | |     / \\     | ____|  | |  / /  |  ____| | |      | |            "
    putStrLn " | |_| |    /   \\    | |___   | | / /   | |___   | |      | |            "
    putStrLn " | '_  |   / /_\\ \\   |____ |  | |/ /    |  ___|  | |      | |           "
    putStrLn " | | | |  / /   \\ \\   ___| |  | |\\ \\    | |____  | |____  | |____     "
    putStrLn " |_| |_| /_/     \\_\\ |_____|  |_| \\_\\   |______| |______| |______|    "
    putStrLn "                                                                          "
    putStrLn " https://github.com/cpselvis/scheme-in-hashell                            "
    putStrLn " (c) 2016 Elvis                                                           "
    putStrLn ""
