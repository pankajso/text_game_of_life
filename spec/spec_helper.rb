if ENV['COVERAGE'] == 'enable'
  require 'simplecov'
  SimpleCov.start
end
Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "..", "lib", "**/*.rb")].map { |f| require f }
Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "..", "application", "**/*.rb")].map { |f| require f }
RSpec.configure do |config|
end
