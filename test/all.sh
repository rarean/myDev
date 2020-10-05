#!/usr/bin/env bash

for entry in `ls ./test/test*.shunit2`; do
  sh $entry
done
