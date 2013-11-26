#!/bin/bash

set -o verbose
rails generate controller home index about contact --skip-stylesheets
