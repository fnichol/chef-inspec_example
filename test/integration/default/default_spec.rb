describe file('/proc/cpuinfo') do
  it { should be_file }
end

release_file = case os[:family]
when 'ubuntu'
  '/etc/lsb-release'
when 'centos'
  '/etc/centos-release'
else
  'UNKNOWN-PLATFORM-NO-RELEASE-FILE'
end

describe file(release_file) do
  it { should be_file }
end

describe user('root') do
  it { should exist }
  its('uid') { should eq 0 }
  its('groups') { should eq ['root'] }
end

describe package('chef') do
  it { should be_installed }
end

describe package('chefdk') do
  it { should_not be_installed }
end
