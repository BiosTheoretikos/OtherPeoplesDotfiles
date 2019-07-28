# Dotfile Manager with Chef Tutorial

This is a complete bootstrap to get a Chef dotfile manager running on a Linux system with examples for packages, templates, and even setting up the Atom text editor + Atom packages + Atom config. Mac and Windows is not supported (but pull requests are welcome).

## Install Ruby & Chef (system wide)

Ruby needs to be installed at root the level with a system package or the official Chef deb to do operations like manage packages or system files. RVM can also be installed as a user local version of Ruby if the root script below is run first.

[I use both the system Ruby and RVM. By default I only source the .bash_profile since RVM requires a login shell with gnome-terminal.](https://rvm.io/integration/gnome-terminal)

### Debian / Ubuntu

For Debian / Ubuntu systems install the offical Chef deb from here.

[Chef Deb](https://downloads.chef.io/chefdk#ubuntu)

This will install not only Chef, but a Ruby runtime for the root user.

(Optional) Follow the instructions at [RVM.io](https://rvm.io/) to install RVM and Ruby to the local user.

### Arch / Manjaro

For Arch simply install the ruby and rubygems package directly from the Arch repo.

Make sure to disable doc generation (in both user and root) before installing gems.

Install Chef system-wide:

`sudo gem install chef-dk`

(Optional) Follow the instructions at [RVM.io](https://rvm.io/) to install RVM and Ruby to the local user.

## Usage

Download the repo and run the following commands in the root of the repo.

First, you can test installing packages to the system as root.

To install packages (as root) run:
`./install.sh`

This will run the [cookbooks/solobook/recipes/root_only.rb](https://gitlab.com/jbwyatt4/chef_dotfile_manager_tutorial/blob/master/cookbooks/solobook/recipes/root_only.rb) file.

To add your favorite package add the package name to the list for Debian/Ubuntu and Arch.

To actually configure your user bash file, hostfile, and atom (as a user) run:
`./run.sh`

This will run the [cookbooks/solobook/recipes/default.rb](https://gitlab.com/jbwyatt4/chef_dotfile_manager_tutorial/blob/master/cookbooks/solobook/recipes/default.rb) file.

Notice the template resource around line 40? Goto [cookbooks/solobook/templates/default/.user_custom.erb](https://gitlab.com/jbwyatt4/chef_dotfile_manager_tutorial/blob/master/cookbooks/solobook/templates/default/.user_custom.erb) file. You can see a few example custom commands in Bash, and of course, you can add your own.

Notice that wupdate has a Ruby IRB if block that checks the distribution you are using. This is an example of how to use Chef's builtin functions + Ruby embedded templating to handle logic.

## Notes

Tested on Ubuntu 18.04, Debian 10 Testing, and Manjaro. All with user able to sudo into root.

To reinstall system packages or atom packages, delete the chefflag-packages shown in root and user folders, respectively.

If you have issues installing, see Gemfile.lock for the version number I tested with.

[Now listed with GitHub's unofficial guide to dotfiles.](https://dotfiles.github.io/)

## License
Apache-2.0
Copyright 2018-2019 John B. Wyatt IV

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
