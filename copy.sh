#!/bin/bash
for i in gitignore *rc; do
    cp $i ~/.$i
done
