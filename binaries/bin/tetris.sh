#!/bin/bash
tetris > /dev/pts/$1 < /dev/pts/$1 & sleep 0.1 && kill -9 $2
