require_relative '../config/environment'

###> WIP Class. Procedural below <###

class Termodoro

  SECS_IN_MIN = 60
  SECS_IN_HOUR = 3600

  def initialize(arguments)
    @arguments = arguments
    # message
    # title on/off
  end

  def time_part
    segment = @arguments.scan(/[\D]+[^\w]/).first.strip
    #=> hours/minutes/seconds, etc.
  end

  def number_part
    number = @arguments.scan(/[\d]+/).first.strip.to_i
    #=> the number of time_parts given
  end

  def calculate_time
    if time_part.minutes?
      seconds = number_part * SECS_IN_MIN
    elsif time_part.hours?
      seconds = number_part * SECS_IN_HOUR
    elsif time_part.seconds?
      seconds = number_part
    end
  
    seconds #=> returns seconds
  end

  def command
    # if title on/off call one or the other
    # this is what will be passed to the executable in that interface
    #=> return the fully-formed command string for Bash
  end

  def seconds?
    seconds = %w[s sec secs second seconds]
    true if seconds.include?(self.time_part)
    #=> true/false
  end

  def minutes?
    minutes = %w[m min mins minute minutes]
    true if minutes.include?(self.time_part)
    #=> true/false
  end

  def hours?
    hours = %w[h hr hrs hour hours]
    true if hours.include?(self.time_part)
    #=> true/false
  end

  def clean_message
    # will need something to sanitize apostrophes and stuff
    #=> return sanitized message to insert into terminal
  end

end

binding.pry

###> procedural code below. object archiecting happening above <###

=begin 

puts "how long? (write only a number for minutes)"
length_response = gets.chomp
number = length_response.split(" ").first.to_i
segment = length_response.split(" ").last
duration = 5

if segment == "seconds" || segment == "sec" || segment == "secs" || segment == "s"
  duration = number
elsif segment == "m" || segment == "min" || segment == "mins" || segment == "minutes" || segment == ""
  duration = number * 60
elsif segment == "h" || segment == "hour" || segment == "hours"
  duration = number * 3600
end

puts "what message?"
message = gets.chomp
puts "enter a title here if you want one,"
puts "otherwise, just hit enter"
title = gets.chomp

if title == ""
  system("sleep #{duration} && terminal-notifier -message '#{message}' & disown && exit")
else
  system("sleep #{duration} && terminal-notifier -message '#{message}' -title '#{title}' & disown && exit")
end

=end