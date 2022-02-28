{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( someFunc
    ) where

import Network.Wai.Handler.Warp (run)
import Network.Wai (Request, Response, ResponseReceived, responseLBS)
import Network.HTTP.Types.Status (status200)

someFunc :: IO ()
someFunc = run 8080 requestHandler

requestHandler :: Request -> (Response -> IO ResponseReceived) -> IO ResponseReceived
requestHandler request respond =
    let
        response = responseLBS status200 [] "Hello, client!"
    in
        do
            putStrLn "Received an HTTP request!"
            respond response
