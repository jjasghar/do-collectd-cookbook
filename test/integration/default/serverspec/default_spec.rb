require 'serverspec'
include Serverspec::Helper::Exec

describe file('/home/vagrant/ircbot') do
  it { should be_directory }
end

describe file('/home/vagrant/ircbot/lib/python2.7') do
  it { should be_directory }
end

describe file('/tmp/kitchen/cache/MeetBot-current.tar.gz') do
  it { should be_file }
end

describe file('/tmp/kitchen/cache/Supybot-0.83.4.1.zip') do
  it { should be_file }
end

