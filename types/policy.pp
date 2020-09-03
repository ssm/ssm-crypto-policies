type Crypto_policies::Policy = Pattern[
  /(?x:
  \A
  [A-Z0-9_-]+     # Policy name
  (:[A-Z0-9_-]+)* # Zero or more policy modules, colon separated
  \z
  )/
]
