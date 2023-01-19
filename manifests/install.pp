# @summary Manage crypto-policies installation
#
# Ensure the required packages for crypto policies are installed
#
# @api private
class crypto_policies::install {
  stdlib::ensure_packages($crypto_policies::packages)
}
