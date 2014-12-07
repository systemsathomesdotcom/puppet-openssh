require 'spec_helper'

describe 'ssh::server' do
	let (:facts) { {
		:osfamily	=> 'Debian'
	}}
		
	context "basic tests" do
		it { should contain_class('ssh::server') }
		it { should contain_package('openssh-server').with( :ensure => 'present' ) }
	    it { should contain_service('ssh').with(
                :ensure => true,
                :enable => true
            )}
        it { should contain_file('/etc/ssh/sshd_config').with(
                :owner  => 'root',
                :group  => 'root',
                :mode   => '0644'
           )}
    end

    context "RedHat-specific differences" do
        let (:facts) {{
            :osfamily   => 'RedHat'
        }}

        it { should contain_service('sshd').with(
                :ensure => true,
                :enable => true
            )}
    end

	context "absence test" do
		let (:params) { { :ensure => 'absent' } }
		it { should contain_package('openssh-server').with( :ensure => 'absent' ) }
	end
end
