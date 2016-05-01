#
#   Vagrantfile
#
#   Copyright 2016 Tony Stone
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#   Created by Tony Stone on 4/29/16.
#
require 'getoptlong'

#
# This script can be passed script arguments from the vagrant
# command line.  At this point script arguments must come
# before vagrant commands and arguments.
#
# Example:
#
# > vagrant --swift-snapshot="2016-04-25-a" up --provider=virtualbox
#
swiftSnapshot='2016-04-25-a'

options = GetoptLong.new(
    [ '--swift-snapshot', GetoptLong::OPTIONAL_ARGUMENT ]
)
options.quiet = true

begin
    options.each do |option, value|
        case option
            when '--swift-snapshot'
            swiftSnapshot=value
        end
    end
    rescue GetoptLong::InvalidOption
end

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox"

  config.vm.provider "parallels" do |v, override|
     v.name = "Ubuntu Linux 14.04 - Swift Development"
     override.vm.box = "parallels/ubuntu-14.04"
  end

  config.vm.provision "fix-no-tty", type: "shell" do |s|
     s.privileged = false
     s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end
 
  #
  # Shell script to install the swift development environment
  #
  config.vm.provision "shell", inline: <<-SHELL
    #!/bin/sh
    
    #
    # Install the needed development and admin packages
    #
    sudo apt-get --assume-yes install git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config

    #
    # Note: We're using wget here because of a display issue with curl and vagrant.  The display is corrupt using curl.
    #
    wget --progress=bar:force https://swift.org/builds/development/ubuntu1404/swift-DEVELOPMENT-SNAPSHOT-"#{swiftSnapshot}"/swift-DEVELOPMENT-SNAPSHOT-"#{swiftSnapshot}"-ubuntu14.04.tar.gz
   
   #
    # Expand the swift code into our current directory
    # and update the permissions
    #
    tar zxf swift-DEVELOPMENT-SNAPSHOT-"#{swiftSnapshot}"-ubuntu14.04.tar.gz
    
    sudo chown -R vagrant:vagrant swift-*
   
    # Update the path so we can get to swift
    #
    echo "export PATH=/home/vagrant/swift-DEVELOPMENT-SNAPSHOT-#{swiftSnapshot}-ubuntu14.04/usr/bin:\"${PATH}\"" >> .profile
    echo ""
    echo "Swift snapshot #{swiftSnapshot} has been successfully installed on Linux"
    echo "To use it, call 'vagrant ssh' and once logged in, cd to the /vagrant directory"
    echo ""
  SHELL
end
