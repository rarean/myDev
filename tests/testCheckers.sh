#!/usr/bin/env bash

source ./scripts/common.sh
 #load mock functions
source ./tests/mocks.sh
#ensure we have shunit installed for testShoulds
if [[ $(chkShUnit) = false ]]; then
  addShUnit
fi

#expand aliases for mocks & stubs
shopt -s expand_aliases
MOCK_PROFILE=""

testShouldChekBrewExist(){
  alias brew='bash'
  assertEquals 'HomeBrew is installed' true $(chkBrew)
}

testShouldCheckBrewNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'HomeBrew is not installed' false $(chkBrew)
}

testShouldChekVaultExist(){
  alias vault='bash'
  assertEquals 'Vault is installed' true $(chkVault)
}

testShouldCheckVaultNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'Vault is not installed' false $(chkVault)
}

testShouldChekAwsCliExist(){
  alias awscli='bash'
  assertEquals 'AwsCli is installed' true $(chkAwsCli)
}

testShouldCheckAwsCliNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'AwsCli is not installed' false $(chkAwsCli)
}

testShouldChekAwsIamExist(){
  alias aws-iam-authenticator='bash'
  assertEquals 'AwsIam is installed' true $(chkAwsIam)
}

testShouldCheckAwsIamNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'AwsIam is not installed' false $(chkAwsIam)
}

testShouldChekJqExist(){
  alias jq='bash'
  assertEquals 'Jq is installed' true $(checkJq)
}

testShouldCheckJqNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'Jq is not installed' false $(checkJq)
}

testShouldCheckHelmExist(){
  alias helm='bash'
  assertEquals 'Helm is installed' true $(chkHelm)
}

testShouldCheckHelmNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'Helm is not installed' false "$(chkHelm)"
}

testShouldCheckKubectlExist(){
  alias kubectl='bash'
  assertEquals 'Kubectl is installed' true $(chkKubectl)
}

testShouldCheckKubectlNotExist(){
  alias command='command &>/dev/null' #stub out command
  assertEquals 'Kubectl is not installed' false "$(chkKubectl)"
}

testShouldCheckKubConfigSet(){
  export KUBECONFIG="~/.kube/config"
  assertEquals 'KubeConfig Env is set' "~/.kube/config" $(chkKubeConfig)
}

testShouldCheckKubeConfigNotSet(){
  unset KUBECOFIG
  assertEquals 'KubeConfig is not set' false "$(chkKubeConfig)"
}

testShouldCheckVaultUrlSet(){
  export VAULT_ADDR="http://my.com"
  assertEquals 'VaultUrl Env is set' "http://my.com" $(chkVaultUrl)
}

testShouldCheckVaultUrlNotSet(){
  unset VAULT_ADDR
  assertEquals 'VaultUrl is not set' false "$(chkVaultUrl)"
}

testShouldFindTxtInPofile(){
  assertEquals 'Find hello in file' true "$(search "source" ${MOCK_PROFILE})"
}
testShouldFindHelloInPofile(){
  assertEquals 'Find hello in file' true "$(search "hello" ${MOCK_PROFILE})"
}
testShouldNotFindTxtInPofile(){
  assertEquals 'Not find foo in file' false "$(search "foo" ${MOCK_PROFILE})"
}

#runs before each test
setUp(){
  unalias command &>/dev/null
  unset KUBECONFIG
  unset VAULT_ADDR
}

oneTimeSetUp(){
  MOCK_PROFILE="${SHUNIT_TMPDIR}/profile"
  cat <<EOF >"${MOCK_PROFILE}"
if [ -f ~/.bashrc ]; then
 source ~/.bashrc
fi
hello
EOF
  MOCK_BASHRC="${SHUNIT_TMPDIR}/bashrc"
  cat <<EOF >"${MOCK_BASHRC}"
#!/bin/bash
EOF
}

#cleanup all mocks & stubs
oneTimeTearDown(){
  unalias command &>/dev/null
  unalias brew &>/dev/null
  unalias vault &>/dev/null
  unalias awscli &>/dev/null
  unalias aws-iam-authenticator &>/dev/null
  unalias jq &>/dev/null
  unalias helm &>/dev/null
  unalias kubectl &>/dev/null
  unset KUBECONFIG
  unset VAULT_ADDR
}

#load shunit2
. /usr/local/bin/shunit2
