# This directory is needed because the way my code is setup will install atom
# packages and other checks to /root/.chef instead of the user
# It is just faster to do it this way.

# Disable doc generation for gemfiles
template wroot_dir('.gemrc') do
  source '.gemrc.erb'
end

# For both Ubuntu and Debian
if node['platform_family'] == 'debian'
  unless File.exist?(wroot_dir('.chef/chefflag-debian_install'))
    deb_list_install(['curl'])
  
    execute 'Add Atom PPA key' do
      command 'curl -L https://packagecloud.io/AtomEditor/atom/gpgkey ' \
      ' | sudo apt-key add -'
    end

    execute 'Add Atom PPA' do
      command 'sudo sh -c "echo \'deb [arch=amd64] ' \
      'https://packagecloud.io/AtomEditor/atom/any/ any main\' > ' \
      '/etc/apt/sources.list.d/atom.list"'
    end

    execute 'Add NodeJS PPA (untested)' do
      command 'curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -'
    end

    execute 'Refresh apt repos' do
      command 'sudo apt-get update'
    end

    directory wroot_dir('.chef')

    execute 'Set Debian install flag' do
      command 'touch ' + wroot_dir('.chef/chefflag-debian_install')
    end
  end
  deb_list_install([
    'atom',
    'build-essential',
    'nodejs'
  ])
end

# Arch/Manjaro
if node['platform'] == 'arch'
  pacman_list_install([
    'atom',
    'nodejs'
  ])
end
