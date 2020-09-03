# frozen_string_literal: true

require 'spec_helper'

describe 'crypto_policies' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'defaults' do
        it { is_expected.to compile }
      end

      context 'with policy' do
        let(:params) do
          { policy: 'DEFAULT:NO-SHA1' }
        end

        it { is_expected.to compile }
      end

      context 'with bad policy name' do
        let(:params) do
          { policy: 'INVALID: syntax' }
        end

        it { is_expected.to compile.and_raise_error(%r{Crypto_policies::Policy}) }
      end
    end
  end
end
