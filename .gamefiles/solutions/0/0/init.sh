#!/bin/bash

echo "testfile" > test.f
git add test.f
git commit -m "add test"
git push > /dev/null
cd ..
