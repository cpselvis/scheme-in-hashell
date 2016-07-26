 {- |
 Module      : Lang.Scheme.Numerical
 Copyright   : Copyright (c) 2016 Elvis
 Licence     : MIT (see LICENSE in the distribution)
 Maintainer  : github.com/cpselvis

 This module implements number operator such add, sub, multi, div and so on.
 Currently, only support Integer type (Float, Complex, Rational hasn't support yet)
-}
module Lang.Scheme.Numerical
    (
      primitives
    )
    where

import Lang.Scheme.Types

primitives :: [(String, [LispVal] -> LispVal)]
primitives = [("+", numericBinop (+)),
              ("-", numericBinop (-)),
              ("*", numericBinop (*)),
              ("/", numericBinop div),
              ("mod", numericBinop mod),
              ("quotient", numericBinop quot),
              ("remainder", numericBinop rem)]

numericBinop :: (Integer -> Integer -> Integer) -> [LispVal] -> LispVal
numericBinop op params = Number $ foldl1 op $ map unpackNum params

unpackNum :: LispVal -> Integer
unpackNum (Number n) = n
unpackNum (String n) = let parsed = reads n in
                         if null parsed
                           then 0
                           else fst $ parsed !! 0
unpackNum (List [n]) = unpackNum n
unpackNum _ = 0


