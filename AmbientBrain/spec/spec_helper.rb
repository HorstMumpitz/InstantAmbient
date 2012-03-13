# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require "simplecov"
SimpleCov.start do
	add_group 'Lib', '../lib'
end

require_relative "../lib/ambient_brain/broker"
require_relative "../lib/ambient_brain/receiver"
require_relative "../lib/ambient_brain/section"
require_relative "../lib/ambient_brain/connection"
require_relative "../lib/ambient_brain/converter"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
