Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "lib", "**/*.rb")].map { |f| require f }
Dir[File.join("#{File.expand_path(File.dirname(__FILE__))}", "application", "**/*.rb")].map { |f| require f }

raw_input = File.read(ARGV[0])
golife = GameOfLife.new(raw_input, 50)

golife.start

puts golife.print_universe


