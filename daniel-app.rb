# TO-DO:
# * remove 'history' feature
# * implement refresh of feed
# * eliminate 'history' option & section (including all_bubbles array) once
#   feed is in place.
# * limit feed to 10 most recent bubbles
# * improve feed formatting

#commit notes:
# *

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

while true #eliminate 'history' feature once 'feed' is in place
  puts """\nStart typing to squeak your next Bubble
  -type 'feed' for all Bubbles across Soapbox
  -type 'history' for past Bubbles
  -type 'exit' to quit
  """
  puts "#{username.light_yellow} squeaks:".on_light_black
  input = gets.chomp
  bubble_text = input
  bubble_time = Time.now
  current_user = username

  if input.downcase != "exit" && input.downcase != "history" && input.downcase != "feed"

    single_bubble = {username: current_user, body: bubble_text, created_at: bubble_time}
    bubble_instance = Bubble.new(single_bubble)
    bubble_instance.save_file
    puts
    puts bubble_instance.format
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

  elsif input.downcase == "feed"

    entire_feed = Dir.glob "/Users/danieladler/Dropbox/SoapBox/*"
    puts "Total # of posts:"
    puts entire_feed.count

    time_sorted_feed = entire_feed.sort_by {|x| File.birthtime(x)}.reverse

    entire_feed.sort_by do |x|
      File.birthtime(x)
    end

    time_sorted_feed.each do |file|
      single_feed_file = File.open(file)
      contents = {
        body: File.basename(single_feed_file),
        username: File.read(single_feed_file),
        created_at: single_feed_file.birthtime #+ strftime
      }

      feed_bubble_instance = Bubble.new(contents)

      puts feed_bubble_instance.format

    end

    # give prominent place to 'refresh' function of feed as I'll want it to
    # stand out against other user options (not sure want to rewrite loops to
    # make feed a 'different place' in user flow)

  end
end
