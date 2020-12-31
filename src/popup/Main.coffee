import browser from 'webextension-polyfill'
import React, { Component, useState, useEffect} from 'react'
import L from 'react-dom-factories'
L_ = React.createElement

export default Popup = (props)=>
  [tabUrl, setTabUrl] = useState '<tab>'
  useEffect ()=>
    browser.tabs.query active:true, currentWindow: true
      .then (tab)=>
        setTabUrl JSON.stringify tab
    return
  , []
  L.div className:"popup",
    "Current tab url: #{tabUrl}."

