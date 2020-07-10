#!/bin/bash

function binary(){
  echo $? $1 $2
  [ `command -v git` ] && echo true || echo false
}

#binary $(command -v foo 2>/dev/null)
binary
