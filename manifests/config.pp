# @summary Manage the crypto-policies configuration
#
# Manage /etc/crypto-policies/config, and run update-crypto-policies if it changes
#
# @example
#   include crypto_policies::config
class crypto_policies::config (
  Stdlib::Absolutepath $config_file = '/etc/crypto-policies/config',
  Crypto_policies::Policy $policy = 'DEFAULT',
) {

  file { $config_file:
    content => "# This file is managed by puppet\n${policy}\n",
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
