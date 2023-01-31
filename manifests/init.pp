# @summary Manage system-wide crypto policies
#
# This class manages the system-wide crypto policies on the Red Hat
# operating system family. This will configure policies for which
# cryptographic algorithms to use in various parts of the operating
# system. See man:crypto-policies(7) for more information.
#
# @param policy
#   Which system crypto policy to use
#
# @param config_file
#   Which configuration file to manage
#
# @param packages
#   Packages required for crypto-policies
#
# @example default
#   include crypto_policies
#
# @example with a policy module
#    class { 'crypto_policies':
#      policy => 'DEFAULT:NO-SHA1',
#    }
class crypto_policies (
  Crypto_policies::Policy $policy = 'DEFAULT',
  Stdlib::Absolutepath $config_file = '/etc/crypto-policies/config',
  Array[String] $packages = ['crypto-policies'],
) {
  class { 'crypto_policies::install':
    packages => $packages,
    notify   => Class['crypto_policies::config'],
  }

  class { 'crypto_policies::config':
    config_file => $config_file,
    policy      => $policy,
  }
}
