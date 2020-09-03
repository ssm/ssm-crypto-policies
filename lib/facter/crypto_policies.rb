# Custom fact for showing if the crypto-policies software is
# available, and what the current crypto-policy is.
Facter.add(:crypto_policies, type: :aggregate) do
  confine :os do |os|
    os['family'] == 'RedHat' && os['release']['major'].to_i >= 8
  end

  cmd = '/usr/bin/update-crypto-policies'

  chunk(:available) do
    { available: File.exist?(cmd) }
  end

  chunk(:current_policy) do
    { current_policy: Facter::Core::Execution.execute("#{cmd} --show") }
  end
end

Facter.add(:crypto_policies) do
  setcode do
    { available: false }
  end
end
