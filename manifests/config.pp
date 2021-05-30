# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include crypto_policies::config
class crypto_policies::config (
  Stdlib::Absolutepath $config_file = '/etc/crypto-policies/config',
  Crypto_policies::Policy $policy = 'DEFAULT',
) {

  file { $config_file:
    content => $policy,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  exec { 'update-crypto-policies':
    user        => 'root',
    path        => ['/usr/bin'],
    refreshonly => true,
    subscribe   => File[$config_file],
  }
}
