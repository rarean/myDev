#!/usr/bin/env bash

source ./scripts/common.sh
source ./tests/mocks.sh
#ensure we have shunit installed for tests
if [[ $(chkShUnit) = false ]]; then
  addShUnit
fi

#expand aliases for mocks & stubs
shopt -s expand_aliases

testShouldNotAddVault(){
  alias chkVault='mockHaveVault'
  assertEquals 'Should not add vault' '' "$(addVault)"
}
testShouldNotAddAwsCli(){
  alias chkAwsCli='mockHaveAwsCli'
  assertEquals 'Should not add awscli' '' "$(addAwsCli)"
}
testShouldNotAddJq(){
  alias checkJq='mockHaveJq'
  assertEquals 'Should not add Jq' '' "$(addJq)"
}
testShouldNotAddAwsIam(){
  alias chkAwsIam='mockHaveAwsIam'
  assertEquals 'Should not add AwsIam' '' "$(addAwsIam)"
}

#run before each
setUp(){
  unalias chkVault &>/dev/null
  unalias chkAwsCli &>/dev/null
  unalias checkJq &>/dev/null
  unalias chkAwsIam &>/dev/null
}

#cleanup all mocks & stubs
oneTimeTearDown(){
  unalias chkVault &>/dev/null
  unalias chkAwsCli &>/dev/null
  unalias checkJq &>/dev/null
  unalias chkAwsIam &>/dev/null
}

#load shunit2
. /usr/local/bin/shunit2
