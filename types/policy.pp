type Crypto_policies::Policy = Pattern[
  /(?x:          # beginning of expression, 'x' permits whitespace and comments
  \A             # beginning of string
  [A-Z0-9-]+     # Policy name may be uppercase letters, numbers and hyphen
  (:[A-Z0-9-]+)* # Zero or more policy modules, colon separated
  \z             # end of string
  )/             # end of expression
]
