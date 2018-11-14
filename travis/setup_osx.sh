#!/bin/bash
set -e

# Start MySQL
mysql.server start
cat <<EOS
CREATE USER 'travis'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'travis'@'localhost' WITH GRANT OPTION;
EOS | mysql -uroot


# Use bison installed by homebrew
export YACC="$(brew --prefix bison)/bin/bison"
