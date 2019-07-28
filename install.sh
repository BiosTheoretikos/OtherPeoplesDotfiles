#!/bin/bash
# These files are split up to prevent root setting root privlages to user files and also for best practice.
echo 'Install only installs the system packages that require root. You only need to run it once, and every time you change the package setup'
echo 'Run ./run.sh after this'
sudo chef-solo -c solo.rb -o solobook::root_only
# after a run the cache folder is set as root and needs to be deleted
sudo rm -rf local-mode-cache
sudo rm -rf nodes/*.json # if you run the install first the node files will be set to root and chef will complain
