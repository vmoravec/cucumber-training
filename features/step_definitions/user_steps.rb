Given(/^the user home directory exists$/) do
  expect(user.homedir.exist?).to eq(true)
end

Given(/^the config directory "([^"]*)" exists$/) do |dir_name|
  @config_dir = user.homedir.join(dir_name)
  expect(@config_dir.exist?).to eq(true)
end

Given(/^the config file "([^"]*)" exists$/) do |file_name|
  expect(user.homedir.join(file_name).exist?).to be(true)
end

When(/^I list the content of config directory$/) do
  @config_files = @config_dir.children.map(&:basename).map(&:to_s)
end

Then(/^I get an non\-empty list of entries$/) do
  expect(@config_files.size.nonzero?).to be_truthy
end

Then(/^the public key "([^"]*)" is present$/) do |key|
  expect(@config_files).to include(key)
end

Then(/^the private key "([^"]*)" is present$/) do |key|
  expect(@config_files).to include(key)
end
