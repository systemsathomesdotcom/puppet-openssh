require 'spec_helper'

describe 'ssh::client' do
	context "basic tests" do
		it { should contain_class('ssh::client') }
		it { should contain_package('openssh-client').with( :ensure => 'present' ) }
	end

	context "absence test" do
		let (:params) { { :ensure => 'absent' } }
		it { should contain_package('openssh-client').with( :ensure => 'absent' ) }
	end
end
