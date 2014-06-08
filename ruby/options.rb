require 'optparse'

class Options
  def self.parse_options

    options = {}

    OptionParser.new do |opts|
      opts.banner = "Usage: ruby game.rb [options]"
      opts.separator ""
      opts.separator "Specific options: [default value]"

      opts.on("-c", "--cols COLS",     "Set column count. [20]")               { |c| options[:cols]   = c.to_i }
      opts.on("-r", "--rows ROWS",     "Set row count. [20]")                  { |r| options[:rows]   = r.to_i }
      opts.on("-f", "--factor FACTOR", "Chance a cell will seed alive. [0.2]") { |f| options[:factor] = f.to_f }
      opts.on("-s", "--speed SPEED",   "Refresh rate in seconds. [0.3]")       { |s| options[:speed]  = s.to_f }
    end.parse!

    options
  end
end
