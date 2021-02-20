# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

RSpec.describe 'HimekuriRs' do
  before(:each) do
    require 'himekuri_rs/version'
  end

  describe 'has a version number' do
    context 'version info' do
      ver = '1.0.1.2'
      subject { HimekuriRs::VERSION }
      it { is_expected.to eq(ver) }
    end
  end
end
