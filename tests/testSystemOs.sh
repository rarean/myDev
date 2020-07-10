#!/usr/bin/env bash

source ./scripts/common.sh
source ./tests/mocks.sh
#ensure we have shunit installed for tests
if [[ $(chkShUnit) = false ]]; then
  addShUnit
fi

#expand aliases for mocks & stubs
shopt -s expand_aliases

testShouldGetMacOs(){
  alias uname='mockMacKernel'
  assertEquals 'System is MacOs' "Mac" $(getOS)
}

testShouldGetLinOs(){
  alias uname='mockLinKernel'
  assertEquals 'System is Linux' "Lin" $(getOS)
}

testShouldGetWinOs(){
  alias uname='mockWindows'
  assertEquals 'System is Windows' "Win" $(getOS)
}

testShouldNotGetUnixOs(){
  alias uname='mockUnix'
  assertEquals 'System is Unkown' "unknown" $(getOS)
}

testShouldNotGetWinCert(){
  alias uname='mockWindows'
  cert=`chkCert Fake.cer`
  assertEquals 'Cant check Win' 'Not Found' "$cert"
}

testShouldNotAddWinCert(){
  alias uname='mockWindows'
  cert=`addCert Fake.cer`
  assertEquals 'Cant add to Win' 'Not Available' "$cert"
}

testShouldNotGetFakeCert(){
  alias uname='mockMacKernel'
  cert=`chkCert Fake`
  assertEquals 'Cant find cert' "Not Found" "$cert"
}
#cleanup all mocks & stubs
oneTimeTearDown(){
  unalias uname &>/dev/null
}

#load shunit2
. /usr/local/bin/shunit2
