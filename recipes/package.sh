# This file is used for define functions 

# Set $package_manager to "apt-get" or "yum", or abort.
#

if which apt-get >/dev/null 2>&1; then
  export package_manager=apt-get
elif which yum >/dev/null 2>&1; then
  export package_manager=yum
fi

if [ "$package_manager" = '' ]; then
  echo 'package only supports apt-get or yum!' >&2
  exit 1
fi

# Mute STDOUT and STDERR
#
function package.mute() {
  echo "Running \"$@\""
  `$@ >/dev/null 2>&1`
  return $?
}

# Installer
#
function package.installed() {
  if [ "$package_manager" = 'apt-get' ]; then
    dpkg-query -l $@ >/dev/null 2>&1
  elif [ "$package_manager" = 'yum' ]; then
    rpm -qa | grep $@ >/dev/null
  fi
  return $?
}

# When there's "set -e" in install.sh, package.install should be used with if statement,
# otherwise the script may exit unexpectedly when the package is already installed.
#
function package.install() {
  if package.installed "$@"; then
    echo "$@ already installed"
    return 1
  else
    echo "No packages found matching $@. Installing..."
    package.mute "sudo $package_manager -y install $@"
    return 0
  fi
}
