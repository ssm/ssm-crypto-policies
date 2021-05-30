# @summary Manage crypto-policies installation
#
# Ensure the required packages for crypto policies are installed
#
# @api private
class crypto_policies::install (
  Array[String] $packages = ['crypto-policies'],
){
  ensure_packages($packages)
}
