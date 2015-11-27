#!/bin/bash

find ~/.tmux/plugins/ -type f | xargs sed -e s,#!/usr/bin/env,#!`which env`,g -i 
