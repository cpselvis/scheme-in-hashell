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
      numAdd
    , numSub
    , numMul
    , numDiv
    , numMod
    )
    where

import Lang.Scheme.Types


