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
  , parseString
  , parseNumber
  , parseExpr
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

-- |Match atom
parseAtom :: Parser LispVal
parseAtom =  do first <- letter <|> symbol
                rest <- many (letter <|> digit <|> symbol)
                let atom = [first] ++ rest
                    return $ case atom of
                      "#t" -> Bool True
                      "#f" -> Bool False
                      otherwise -> Atom atom

-- |Match string                
parseString :: Parser LispVal
parseString = do char '"'
                 x <- many (noneOf "\"")
                 char '"'
                 return $ String x

-- |Match number
parseNumber :: Parser LispVal
parseNumber = liftM (Number .read) $many1 digit

-- |Match expression
parseExpr :: Parser LispVal
parseExpr = parseAtom
  <|> parseString
  <|> parseNumber
  <|> parseQuoted
  <|> do char '('
         x <- (try parseList) <|> parseDottedList
         char ')'
         return x

-- |Match proper list
parseList :: Parser LispVal
parseList = liftM List $ sepBy parseExpr space

-- |Match quoted list
parseQuoted :: Parser LispVal
parseQuoted = do char '\''
                 x <- parseExpr
                 return $ List [Atom "quote", x]

-- |Match dotted list
parseDottedList :: Parser LispVal
parseDottedList = do head <- endBy parseExpr space
                     tail <- char '.' >> space >> parseExpr
                     return $ DottedList head tail
