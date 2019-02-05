{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Hadolint.Formatter.Gitlab
    ( printResult
    ) where

import Data.Aeson hiding (Result)
import qualified Data.ByteString.Lazy.Char8 as B
import qualified Hadolint.Formatter.Codeclimate as CC
import Hadolint.Formatter.Format (Result(..))
import Text.Megaparsec (Stream)
import Text.Megaparsec.Error


printResult :: (Stream s, ShowErrorComponent e) => Result s e -> IO ()
printResult result = B.putStrLn (encode (CC.formatResult result))
    
