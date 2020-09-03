# @summary Manage system-wide crypto policies
#
# This class manages the system-wide crypto policies on the Red Hat
# operating system family. This will configure policies for which
# cryptographic algorithms to use in various parts of the operating
# system. See man:crypto-policies(7) for more information.
#
# @example default
#   include crypto_policies
#
# @example with a policy module
#    class { 'crypto_policies':
#      policy => 'DEFAULT:NO-SHA1',
#    }
class crypto_policies(
  Crypto_policies::Policy $policy = 'DEFAULT',
) {

  if $facts['crypto_policies']['available'] {
    if $facts['crypto_policies']['current_policy'] != $policy {
      exec {"update-crypto-policies --set ${policy}":
        user => 'root',
        path => ['/usr/bin'],
      }
    }
  }
}
