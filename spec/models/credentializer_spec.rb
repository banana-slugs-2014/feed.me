require 'spec_helper'

describe Credentializer do

  let(:configs){ ['facebook.yml', 'split.yml', 'google_keys.yml', 'foursquare.yml'] }
  let(:bad_configs){ ['facebook.yml', 'split.yml', 'google_keys.yml', 'foursquare.yml','bad_config.yml'] }
  describe '.credentialize!' do
    context 'with all config files' do
      it 'adds all configs to the env' do
        expect{Credentializer.credentialize!(configs)}.to_not raise_error Errno::ENOENT
      end
    end

    context 'missing config files' do
      it 'does not raise Errno::ENOENT error' do
        expect{Credentializer.credentialize!(bad_configs)}.to_not raise_error Errno::ENOENT
      end
    end
  end
end