require_relative 'daniel-bubble'
require 'colorize'

puts
puts "\t\t\t\tSoapBox".on_light_blue.underline.bold + "\t".on_light_blue*5
puts "    ~ Bubble:".bold + "| ˈbəbəl | noun , a social media post on Soapbox"
puts "    ~ Squeak:".bold + "|  skwēk | verb , to create a Bubble on Soapbox\n\n"

username = File.read("./username.soapbox")

  if username == ""
    puts  "Please enter username:"
    input = gets.chomp
    username = "@"+input
    file = File.open("./username.soapbox", "w")
      file << username
    puts "\nWelcome to " + "SoapBox".on_light_blue + ", " + username.light_yellow.bold + "!\n\n"
  else
    puts "Welcome back to " + "SoapBox".on_light_blue + ", " + username.light_yellow.bold + "!\n\n"
  end

  puts "If you are not " + username.light_yellow.bold + ", type 'change' to log in as a different user. \nOtherwise, press " + "return".bold.light_blue + " for main menu."
  input = gets.chomp
    if input.downcase == 'change'
      puts "Please enter username:"
      input = gets.chomp
      username = "@"+input
      file = File.open("./username.soapbox", "w")
        file << username
      puts "\nWelcome to " + "SoapBox".on_light_blue + ", " + username.light_yellow.bold + "!\n\n"
    end

while true

  puts "Would you like to " + "post".bold.light_blue + ", see a " + "feed".bold.light_blue + " of 10 most recent Bubbles, " + "history".bold.light_blue + " of all Bubbles, or " + "exit".bold.light_blue + "?"

  input = gets.chomp

  if input.downcase == 'post'

    puts
    puts "#{username.light_yellow} squeaks:".on_light_black
    input = gets.chomp
    bubble_text = input
    bubble_time = Time.now
    current_user = username

    single_bubble = {
      username: current_user,
      body: bubble_text,
      created_at: bubble_time
      }

    bubble_instance = Bubble.new(single_bubble)
    bubble_instance.save_file
    puts
    puts bubble_instance.format

  elsif input.downcase == 'feed'

    bubble_array = []

    entire_feed = Dir.glob "/Users/danieladler/Dropbox/SoapBox/*"

    time_sorted_feed = entire_feed.sort_by {|x| File.birthtime(x)}

    time_sorted_feed.last(10).each do |file|
      single_feed_file = File.open(file)
      contents = {
        body: File.basename(single_feed_file),
        username: File.read(single_feed_file),
        created_at: single_feed_file.birthtime
      }

      Bubble.new(contents).format

    end

    puts "^^^".blink + " Scroll up to view 10 most recent Bubbles ".light_green + "^^^\n".blink

  elsif input.downcase == 'history'

    bubble_array = []

    entire_feed = Dir.glob "/Users/danieladler/Dropbox/SoapBox/*"

    time_sorted_feed = entire_feed.sort_by {|x| File.birthtime(x)}

    time_sorted_feed.each do |file|
      single_feed_file = File.open(file)
      contents = {
        body: File.basename(single_feed_file),
        username: File.read(single_feed_file),
        created_at: single_feed_file.birthtime
      }

      Bubble.new(contents).format

    end

    puts "^^^ ".blink + "Scroll up to view all bubbles across Soapbox ".light_green + "^^^\n".blink

  elsif input.downcase == 'exit'

    puts "\nThanks for using " + "SoapBox".on_light_blue + "!"
    puts
    exit

  end
end
