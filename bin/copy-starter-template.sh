#!/bin/sh

# ./bin/copy-starter-template.sh
# this command will replace the default rails layout with a Twitter Bootstrap layout
cp -v app/views/layouts/starter-template.html.erb ../app/views/layouts/application.html.erb
