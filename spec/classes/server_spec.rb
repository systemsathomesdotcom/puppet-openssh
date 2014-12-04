require 'spec_helper'

describe 'ssh::server' do
	let (:facts) { {
		:osfamily	=> 'Debian'
	}}
		
	context "basic tests" do
		it { should contain_class('ssh::server') }
		it { should contain_package('openssh-server').with( :ensure => 'present' ) }
	end

	context "absence test" do
		let (:params) { { :ensure => 'absent' } }
		it { should contain_package('openssh-server').with( :ensure => 'absent' ) }
	end
end
