# @summary Manage the crypto-policies configuration
#
# Manage /etc/crypto-policies/config, and run update-crypto-policies if it changes
#
# @api private
class crypto_policies::config {

  file { $crypto_policies::config_file:
    content => "# This file is managed by puppet\n${crypto_policies::policy}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  exec { 'update-crypto-policies':
    user        => 'root',
    path        => ['/usr/bin'],
    refreshonly => true,
    subscribe   => File[$crypto_policies::config_file],
  }
}
