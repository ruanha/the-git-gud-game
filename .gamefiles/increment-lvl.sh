#!/bin/bash
LVL=$( < "./LVL")

./set-lvl.sh $(( $LVL + 1 ))

