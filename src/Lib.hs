{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( someFunc,
  )
where

import Data.String (IsString (fromString))
import Handler.Ethereum (getEthereum, transactEthereum)
import Handler.Response (failureResponse, successfulResponse)
import Network.HTTP.Types.Method (methodGet, methodPost)
import Network.HTTP.Types.Status (status200, status404)
import Network.Wai (Request (queryString, rawPathInfo, rawQueryString, requestMethod), Response, ResponseReceived, responseLBS)
import Network.Wai.Handler.Warp (run)

someFunc :: IO ()
someFunc = run 8084 requestHandler

requestHandler :: Request -> (Response -> IO ResponseReceived) -> IO ResponseReceived
requestHandler request respond =
  let method = requestMethod request
      path = rawPathInfo request
   in do
        case (show path, method) of
          ("/api/v0.1/payment/ethereum", methodGet) -> respond $ getEthereum request
          ("/api/v0.1/payment/ethereum", methodPost) -> respond $ transactEthereum request
          _ -> respond failureResponse
