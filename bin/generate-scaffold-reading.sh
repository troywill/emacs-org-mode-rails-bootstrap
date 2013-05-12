#!/bin/bash

rails generate scaffold reading \
    weight:decimal \
    reading_time:datetime \
    note:text \
    --skip-stylesheets
