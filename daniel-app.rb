require_relative 'daniel-bubble'
require 'colorize'

all_bubbles = [] #is the very top of the app the best place for this?

puts
puts "\t\t\t\tSoapBox".on_light_blue.underline.bold + "\t".on_light_blue*5
puts "    ~ Bubble:".bold + "|ˈbəbəl | noun , a social media post on Soapbox"
puts "    ~ Squeak:".bold + "| skwēk | verb , to create a Bubble on Soapbox\n\n"

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

while true
  puts """\nStart typing to squeak your next Bubble
  -type 'history' for past squeaks
  -type 'exit' to quit
  """
  puts "#{username.light_yellow} squeaks:".on_light_black
  input = gets.chomp
  bubble_text = input
  bubble_time = Time.now
  current_user = username

  if input.downcase != "exit" && input.downcase != "history"
    single_bubble = {username: current_user, body: bubble_text, created_at: bubble_time}

    bubble_instance = Bubble.new(single_bubble)

    file =  File.open("/Users/danieladler/Dropbox/SoapBox/#{single_bubble[:body]}.txt","w")
    file.write "#{single_bubble[:username]}"
    file.close

    all_bubbles << bubble_instance
    # keeping array so that it also populates array for 'history' function
    # but perhaps there's also a way to pull history of my tweets from the actual files?

  elsif input.downcase == "exit"
    puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
    puts
    exit

  elsif input.downcase == "history"
    puts "\n#{username.light_yellow}'s Soapbox history:".underline
    all_bubbles.each do |b|
      puts
      puts "\t#{b.username.bold.light_yellow}:" + "\t" + "#{b.body}"
      puts "\tsqueaked at: ".bold + "\t" + "#{b.created_at}"
      puts "\t"+"_ _".bold*15
    end
  end
end
