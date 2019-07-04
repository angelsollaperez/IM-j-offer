# InSpec test for recipe dockertest::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should be_listening }
end


## Check if docker is running
describe service('docker') do  it { should be_installed }
end  

## check if prestashop CONTAINER is running
describe docker_container('prestashop') do
  it { should exist }
  it { should be_running }
end

## Check if prestashop is listening on port 80
describe docker_container(name: 'prestashop') do
  its('ports') { should eq '0.0.0.0:80->80/tcp' }
end
