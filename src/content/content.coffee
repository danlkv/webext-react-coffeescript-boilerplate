import browser from 'webextension-polyfill'
import React, { Component, useState, useEffect } from 'react'
import L from 'react-dom-factories'
import ReactDOM from 'react-dom'
L_ = React.createElement

console.log 'hello content'
body =document.getElementsByTagName('body')[0]
root = document.createElement("div")
root.id='root'
body.appendChild(root)

Main = (props)->
  [msg, setMsg] = useState('')
  communicate = (message)=>
    console.log 'sending ', message
    browser.runtime.sendMessage greeting:message
      .then (response)=> setMsg response

  useEffect ()=>
    communicate 'hello'
    return
  , []

  L.div
    className:'extover'
    style:
      position:'fixed'
      backgroundColor:'#0A4B9A'
      bottom:40
      right:100
      color:'#FF2D9F'
      padding:'1em'
    "Echo from back: #{msg}"
    L.div 0,
      L.button
        onClick:()=>communicate 'click message'
        "Send 'click message'"

ReactDOM.render <Main />, root
