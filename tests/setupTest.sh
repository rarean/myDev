#!/bin/bash

# Tests for main setup.sh

testStarted(){
  firstLine=$(/bin/bash ./setup.sh | head -1)
  assertEquals "Let's get started" "$firstLine"
}

# load shunit2
#. /usr/local/bin/shunit2
