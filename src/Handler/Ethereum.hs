{-# LANGUAGE OverloadedStrings #-}

module Handler.Ethereum
  ( getEthereum,
    transactEthereum,
  )
where

import Data.String (IsString (fromString))
import Handler.Response (failureResponse, successfulResponse)
import Network.HTTP.Types (status200)
import Network.Wai (Request (queryString), Response, responseLBS)

getEthereum :: Request -> Response
getEthereum request =
  let response = responseLBS status200 [] "Hello, client!"
      query = queryString request
      id = filter (\queryItem -> fst queryItem == fromString "id") query
   in do
        successfulResponse ""

transactEthereum :: Request -> Response
transactEthereum request =
  let response = responseLBS status200 [] "Hello, client!"
   in do
        successfulResponse ""
