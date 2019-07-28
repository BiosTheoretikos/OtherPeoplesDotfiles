# These checks are useless without root mode, but serve as a good check
# for the user to run ./install.sh

# For both Ubuntu and Debian
# https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
if node['platform_family'] == 'debian'
  apt_package 'atom'
end

# Arch/Manjaro
if node['platform'] == 'arch'
  pacman_package 'atom'
end

unless File.exist?(wuser_dir('.chef/chefflag-atom_packages'))
  execute 'Atom: Install basics' do
    command 'apm install fonts file-icons toggle-quotes linter minimap ' \
    'minimap-linter minimap-find-and-replace'
    live_stream true
  end

  execute 'Atom: Install Javascript/HTML5 stuff' do
    command 'apm install atom-beautify prettier-atom atom-ternjs ' \
    'atom-wrap-in-tag autoclose-html autocomplete-modules color-picker ' \
    'docblockr emmet emmet-jsx-css-modules es6-javascript js-hyperclick ' \
    'pigments linter-eslint tree-view-copy-relative-path lodash-snippets ' \
    'language-babel atom-jest-snippets atom-live-server'
    live_stream true
  end

  execute 'Set Atom package flag' do
    command 'touch ' + wuser_dir('.chef/chefflag-atom_packages')
  end
end

directory wuser_dir('.atom')

template wuser_dir('.atom/keymap.cson') do
  source 'keymap.cson.erb'
end

template wuser_dir('.atom/config.cson') do
  source 'config.cson.erb'
end

# Notes:
# Still hack to set the hack font in the fonts package
