# TO-DO:
# * look for things that can be outsourced to Bubble class file
# * add in 'post' as an option instead of just typing from start
# * improve feed formatting
# * Save the  username in a local file called .soapbox, so they only have to enter it once, running the app in the future should #   read from the file what their username is.
# * improve other formatting across app (define line_width?)

#commit notes:
# * 'feed' function acts as refresh; limited feed to last 10

require_relative 'daniel-bubble'
require 'colorize'

puts
puts "\t\t\t\tSoapBox".on_light_blue.underline.bold + "\t".on_light_blue*5
puts "    ~ Bubble:".bold + "|ˈbəbəl | noun , a social media post on Soapbox"
puts "    ~ Squeak:".bold + "| skwēk | verb , to create a Bubble on Soapbox\n\n"

puts "Please enter username"
input = gets.chomp

#enter code for saving username to a directory here

if input == "exit"
  puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
  puts
  exit
else
  username = "@"+input
  puts "\nWelcome to " + "SoapBox".on_light_blue + ", " + username.light_yellow.bold + "!"
end

while true
  puts """\nStart typing to squeak your next Bubble, or:
  -type 'feed' to view of 10 most recent Bubbles across Soapbox
  -type 'exit' to quit
  """
  puts "#{username.light_yellow} squeaks:".on_light_black
  input = gets.chomp
  bubble_text = input
  bubble_time = Time.now
  current_user = username

  if input.downcase != "exit" && input.downcase != "feed"

    single_bubble = {
      username: current_user,
      body: bubble_text,
      created_at: bubble_time
      }

    bubble_instance = Bubble.new(single_bubble)
    bubble_instance.save_file
    puts
    puts bubble_instance.format

  elsif input.downcase == "exit"
    puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
    puts
    exit

  elsif input.downcase == "feed"

    bubble_array = []

    entire_feed = Dir.glob "/Users/danieladler/Dropbox/SoapBox/*"

    time_sorted_feed = entire_feed.sort_by {|x| File.birthtime(x)}

    puts "10 most recent Bubbles:"

    time_sorted_feed.last(10).each do |file|
      single_feed_file = File.open(file)
      contents = {
        body: File.basename(single_feed_file),
        username: File.read(single_feed_file),
        created_at: single_feed_file.birthtime
      }

      Bubble.new(contents).format

    end


      # puts """Start typing to squeak your next Bubble, or:
      #   - type 'feed' to refresh view of 10 most recent Bubbles across Soapbox
      #   - type 'history' see entire history of Soapbox feed
      #   - type 'exit' to quit
      # """
      #
      # input = gets.chomp

      # if input.downcase == 'history'
      #
      #   time_sorted_feed.each do |file|
      #     single_feed_file = File.open(file)
      #     contents = {
      #       body: File.basename(single_feed_file),
      #       username: File.read(single_feed_file),
      #       created_at: single_feed_file.birthtime
      #     }
      #
      #     Bubble.new(contents).format
      #   end

    #   elsif input.downcase == 'feed'
    #     puts "10 most recent Bubbles:"
    #
    #     time_sorted_feed.last(10).each do |file|
    #       single_feed_file = File.open(file)
    #       contents = {
    #         body: File.basename(single_feed_file),
    #         username: File.read(single_feed_file),
    #         created_at: single_feed_file.birthtime
    #       }
    #
    #       Bubble.new(contents).format
    #     end
    #
    #   elsif input.downcase == "exit"
    #     puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
    #     puts
    #     exit
    #
    #   elsif
    #
    # end

  end
end
