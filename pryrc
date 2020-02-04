if defined?(AwesomePrint)
  require "awesome_print"
  AwesomePrint.pry!
end

Pry.commands.alias_command "c", "continue"
Pry.commands.alias_command "s", "step"
Pry.commands.alias_command "n", "next"
Pry.commands.alias_command "f", "finish"
Pry.commands.alias_command "l", "whereami"

Pry.color = true

# Custom methods
# From https://gist.github.com/rondale-sc/1297510
default_command_set = Pry::CommandSet.new do
  command 'pb', 'Copy to clipboard' do |str|
    IO.popen('pbcopy', 'w') { |f| f << target.eval(str) }
  end

  command 'caller_method' do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end

  command 'conx', 'Connect to analysis db' do
    output.puts 'connecting'
    if ENV['READ_ONLY_CREDENTIALS']
      output.puts ActiveRecord::Base.establish_connection(ENV['READ_ONLY_CREDENTIALS'])
    end
  end

  command 'local', 'Connect to local db' do
    output.puts 'going local'
    output.puts ActiveRecord::Base.establish_connection(:development)
  end
end

Pry.config.commands.import default_command_set

class Array
  def self.toy
    [1, 2, 3, 4, 5]
  end

  def count_values
    group_by{ |x| x }.map { |k, v| [k, v.length] }.to_h
  end

  def credits_per_group
    group_by{ |x| x.group }.map { |k, v| [k, v.sum(&:credits)] }.to_h
  end
end

class Hash
  def self.toy
    {a: 1, b: 2, c: 3, d: 4, e: 5}
  end
end

local_pryrc = File.expand_path '~/.pryrc.local'
load local_pryrc if File.exists? local_pryrc
