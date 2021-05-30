# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include crypto_policies::install
class crypto_policies::install (
  Array[String] $packages = ['crypto-policies'],
){
  ensure_packages($packages)
}
