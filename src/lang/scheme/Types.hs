{- |
Module      : Lang.Scheme.Types
Copyright   : Copyright (c) 2016 Elvis
Licence     : MIT (see LICENSE in the distribution)
Maintainer  : github.com/cpselvis

This module contains top-level data type definitions, environments, error types, and associated functions.
-}

module Lang.Scheme.Types
  (
    -- * Types
    LispVal (
        Atom
      , List
      , DottedList)
  )
  where

-- |Scheme data types
data LispVal = Atom String
  -- ^Symbol
  | List [LispVal]
  -- ^List
  | DottedList [LispVal] LispVal
