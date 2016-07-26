{- |
Module      : Main
Copyright   : Copyright (c) 2016 Elvis
Licence     : MIT (see LICENSE in the distribution)
Maintainer  : github.com/cpselvis
This file implements a REPL /shell/ to host the interpreter, and also
allows execution of stand-alone files containing Scheme code.
-}

-- Module Dependencies
import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)
import Lang.Scheme.Types
import Lang.Scheme.Eval
import Lang.Scheme.Parser
import Lang.Scheme.Numerical

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

-- Read expression
readExpr :: String -> LispVal
readExpr input = case parse parseExpr "lisp" input of
    Left err -> String $ "No match: " ++ show err
    Right val -> val

-- main
main :: IO()
main = getArgs >>= putStrLn .show .eval .readExpr .(!! 0)

instance Show LispVal where show = showVal