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
    if ENV['ENGINEERING_URL']
      output.puts ActiveRecord::Base.establish_connection(ENV['ENGINEERING_URL'])
    end
  end

  command 'local', 'Connect to local db' do
    output.puts 'going local'
    output.puts ActiveRecord::Base.establish_connection(:development)
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

  command 'morphin time', 'Allow mutation of transactions' do
    output.puts ActiveRecord::Base.connection.execute('DROP TRIGGER prevent_transaction_commit_for_immutable_attributes ON transactions')
  end
end

Pry.config.commands.import default_command_set

class Array
  def self.toy
    [1, 2, 3, 4, 5]
  end
end

class Hash
  def self.toy
    {a: 1, b: 2, c: 3, d: 4, e: 5}
  end
end

# Pistachio config
if defined?(Pistachio)
  CURRENT_YEAR = 2017
  def month
    @_month = Month.current
  end

  def rmonth
    @_rmonth = month.beginning..month.ending
  end

  def ryear
    @_rmonth = january.beginning..Time.current
  end

  def january
    @_july = Month.parse("January #{CURRENT_YEAR} ")
  end

  def july
    @_july = Month.parse("July #{CURRENT_YEAR} ")
  end

  def august
    @_august = Month.parse("August #{CURRENT_YEAR}")
  end

  def october
    @_august = Month.parse("October #{CURRENT_YEAR}")
  end

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
