#!/bin/bash

# This script builds the project using the specified build tool.

#!/bin/bash
set -e  # Exit on error

cd src

if [[ $1 == "--all" ]]; then
  jupyter-book clean . --all
  jupyter-book build . --all
else
  jupyter-book build .
fi

ghp-import -n -p -f _build/html