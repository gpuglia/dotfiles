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

Pry.config.correct_indent = false if ENV["INSIDE_EMACS"]

# Custom methods
# From https://gist.github.com/rondale-sc/1297510
default_command_set = Pry::CommandSet.new do
  command 'copy', 'Copy argument to description' do |str|
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
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
    if ENV['ANALYSIS_URL']
      output.puts ActiveRecord::Base.establish_connection(ENV['ANALYSIS_URL'])
    end
  end

end

pistachio_command_set = Pry::CommandSet.new do
  command 'ship=', 'Set local variable adv to advisorship of passed-in id' do |id|
    output.puts target.local_variable_set(:ship, Advisorship.find(id))
  end

  command 'adv=', 'Set local variable adv to advisorship of passed-in id' do |id|
    output.puts target.local_variable_set(:adv, Advisor.find(id))
  end

  command 'inv=', 'Set local variable inv to advisorship of passed-in id' do |id|
    output.puts target.local_variable_set(:inv, Invoice.find(id))
  end

  command 'pro=', 'Set local variable inv to advisorship of passed-in id' do |id|
    output.puts target.local_variable_set(:pro, Project.find(id))
  end
end

Pry.config.commands.import default_command_set

# Pistachio config
if defined?(Pistachio)
  class ActiveRecord::Relation
    def vals
      pluck(:id, :group, :credits, :amount, :currency, :owner_id, :at)
    end
  end

  class Array
    def vals
      sort_by { |t| [t.at, t.id] }.map do |t|
        {
          id: t.id,
          group: t.group_name,
          credits: t.credits,
          total: Cash.new(t.amount, t.currency),
          owner: t.owner.name,
          at: t.at
        }
      end
    end

    def to_human
      map(&:to_human)
    end
  end

  class Advisorship
    alias_method :comps, :interaction_completions
  end

  Pry.config.commands.import pistachio_command_set
end
