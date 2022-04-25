{-# LANGUAGE OverloadedStrings #-}

module Handler.Response (successfulResponse, failureResponse) where
import Network.Wai (responseLBS)
import Network.HTTP.Types (status200, status404)

successfulResponse = responseLBS status200 []

failureResponse = responseLBS status404 [] ""
