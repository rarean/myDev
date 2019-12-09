#!/usr/bin/env bash

for entry in `ls ./tests/tes*.sh`; do
  sh $entry
done
