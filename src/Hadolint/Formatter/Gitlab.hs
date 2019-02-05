{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Hadolint.Formatter.Gitlab
    ( printResult
    ) where

import Data.Aeson hiding (Result)
import qualified Data.ByteString.Lazy as B
import Data.Monoid ((<>))
import Data.Sequence (Seq)
import qualified Data.Text as Text
import GHC.Generics
import qualified Hadolint.Formatter.Codeclimate as CC
import Hadolint.Formatter.Format (Result(..), errorPosition)
import Hadolint.Rules (Metadata(..), RuleCheck(..))
import ShellCheck.Interface
import Text.Megaparsec (Stream)
import Text.Megaparsec.Error
import Text.Megaparsec.Pos (sourceColumn, sourceLine, sourceName, unPos)


printResult :: (Stream s, ShowErrorComponent e) => Result s e -> IO ()
printResult result = B.putStrLn (encode (CC.formatResult result))
    
