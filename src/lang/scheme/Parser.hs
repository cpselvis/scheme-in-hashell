 {- |
 Module      : Lang.Scheme.Parser
 Copyright   : Copyright (c) 2016 Elvis
 Licence     : MIT (see LICENSE in the distribution)
 Maintainer  : github.com/cpselvis
 
 This module implements parsing of Scheme code.
 -}

module Lang.Scheme.Parser
  (
    parseAtom
  , parseList
  , parseDottedList
  , parseQuoted
  )
  where

import Lang.Scheme.Types
import Text.ParserCombinators.Parsec hiding (spaces)


-- |Match a special character
symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=>?@^_~."

