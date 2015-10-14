require_relative 'daniel-bubble'
require 'colorize'

all_bubbles = [] #is the very top of the app the best place for this?

puts
puts "\t\t\t\tSoapBox".on_light_blue.underline.bold + "\t".on_light_blue*5
puts "    ~ Bubble:".bold + "|ˈbəbəl | noun , a social media post on Soapbox"
puts "    ~ Squeak:".bold + "| skwēk | verb , to create a Bubble on Soapbox\n\n"

# 1. Ask for a username
puts "Please enter username"
input = gets.chomp

if input == "exit"
  puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
  puts
  exit
else
  username = "@"+input
  puts "\nWelcome to " + "SoapBox".on_light_blue + ", " + username.light_yellow.bold + "!"
end

# 6. Start over at step 2.
while true
  # 2. Ask for the body of a Bubble
  puts """\nStart typing to squeak your next Bubble
  -type 'history' for past squeaks
  -type 'exit' to quit
  """
  puts "#{username.light_yellow} squeaks:".on_light_black
  input = gets.chomp
  bubble_text = input
  bubble_time = Time.now
  current_user = username

    # puts "#{current_user} said #{bubble_text} at #{bubble_time}"
    # ^^^ test for user input coming through - it does!
    # ^^^ But it's not yet a Bubble itself - just a bunch of strings

  if input.downcase != "exit" && input.downcase != "history"
    single_bubble = {username: current_user, body: bubble_text, created_at: bubble_time}
    # ^^^ now user input is in a hash

    # 3. Create a Bubble instance using that information (with created_at being Time.now)
    bubble_instance = Bubble.new(single_bubble)
    # puts bubble_instance.class # <-- now user input exists as an instance of Bubble!

    # 4. Add the bubble instance to an Array
    all_bubbles << bubble_instance

    # puts "all_bubbles empty?"
    # puts all_bubbles.empty? # <-- false -- so it's populated
    # puts "all_bubbles class?"
    # puts all_bubbles.class # <-- array
    # puts "all_bubbles contents - class?"
    # puts all_bubbles.first.class # <-- Bubble

  elsif input.downcase == "exit"
    puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
    puts
    exit

  elsif input.downcase == "history"
    # 5. Print out the details of each bubble.
    puts "\n#{username.light_yellow}'s Soapbox history:".underline
    all_bubbles.each do |b|
      puts
      puts "\t#{b.username.bold.light_yellow}:" + "\t" + "'#{b.body}'"
      puts "\tsqueaked at: ".bold + "\t" + "#{b.created_at}"
      puts "\t"+"_ _".bold*15
    end
  end
end
