# crypto_policies

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with crypto_policies](#setup)
    * [What crypto_policies affects](#what-crypto_policies-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with crypto_policies](#beginning-with-crypto_policies)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module sets the system-wide crypto policy.

It provides a fact showing the current crypto policy and if the
crypto-policies software is available and installed.

The `crypto-policies` software available on the RedHat os family from
version 8 and on configures the policy for which cryptographic
algorithms are to be available and used across various applications
and libraries. See the [Red Hat documentation on security
hardening](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/security_hardening/using-the-system-wide-cryptographic-policies_security-hardening#system-wide-crypto-policies_using-the-system-wide-cryptographic-policies)
for more information.

## Setup

### Beginning with crypto_policies

This is a simple module. Include it to use the 'DEFAULT' crypto
policy, or use the `policy` parameter to set a policy and optional
policy modules.

## Usage

Basic usage. This will use the `DEFAULT` policy, which is default for
this module..

```puppet
include crypto_policies
```

Set a policy of `DEFAULT` adding the `NO-SHA1` module to disable the
`sha1` hashing algorithm.


```puppet
class { 'crypto_policies':
  policy => 'DEFAULT:NO-SHA1',
}
```

## Limitations

For now, this only works on the RedHat OS family version 8.

On any other OS, or if the crypto-policies software is uninstalled,
this module will silently do nothing.

## Development

Pull requests and bug reports are welcome.
