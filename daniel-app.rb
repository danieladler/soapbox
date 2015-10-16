# TO-DO:
# * put bubble formatter in Bubble class file
# * improve feed formatting
# * implement refresh of feed
# * eliminate 'history' option & section (including all_bubbles array) once
#   feed is in place.

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

    # the feed (Dropbox folder) is the source of all necessary data
    # create new Bubbles here by walking through the folder

    entire_feed = Dir.glob "/Users/danieladler/Dropbox/SoapBox/*"
    puts "Total # of posts:"
    puts entire_feed.count

    # FEED OPTION 1
    # entire_feed.each do |file|
    #   target_file = File.read(file)
    #   puts target_file
    #   puts "- -"*10
    #   # username = target_file.read
    #   # created_at = target_file.birthtime
    #
    #     # target_file_hash = {
    #     #   # body:
    #     #   username: target_file.read,
    #     #   created_at: target_file.birthtime #+ strftime
    #     # }
    #     #
    #     # feed_bubble_instance = Bubble.new(target_file_hash)
    #     #
    #     # # new bubble formatting
    #     # # close file?
    #     # File.close(file)
    #
    # end

    # FEED OPTION 2
    time_sorted_feed = entire_feed.sort_by {|x| File.birthtime(x)}.reverse
    time_sorted_feed.each do |file|
      single_feed_file = File.open(file)
      contents = {
        body: File.basename(single_feed_file),
        username: File.read(single_feed_file),
        created_at: single_feed_file.birthtime #+ strftime
      }

      # formatted_content =
      # """#{contents[:username].bold.light_yellow}:\t#{contents[:body]}
      # \nsqueaked at #{contents[:created_at]}--------------------------
      # """

      # formatted_bubble = """
      #    \t#{contents[:username].bold.light_yellow}: + \t + #{contents[:body]}
      #    \tsqueaked at:.bold \t + #{b.created_at}
      #    \t+_ _.bold*15
      #   """

      feed_bubble_instance = Bubble.new(contents)

      puts feed_bubble_instance  # <-- actually, need to puts each new bubble!

    end

    # {|f| puts f}
    # ^^^ this globs target dir
    # ^^^ it's an array of strings, which are all directories w/ body @ end
    # ^^^ e.g. /Users/danieladler/Dropbox/SoapBox/asdsa

    # all_bubble_handles = all_bubble_bodies.map {|f| File.read(f)}


    # all_file_contents = all_bubbles.map {|f| f + File.read(f)} # <--
    # # ^^^ this variable is also an array, made up of strings that are
    # puts all_file_contents[0]
    # puts all_file_contents[2]
    # puts all_file_contents[4]
    # puts all_file_contents[7]
    # puts all_file_contents[9]
    # puts all_file_contents[11]


    # do the mapping and formatting in one step - while creating the bubble
    # VVVVV when creating new bubble, try with argument pulling from the glob'd directory
    # feed_bubble_instance = all_bubble_locs.each do |f|
    #     username: File.read(f)
    #     #body: all_bubble_contents.each {|b| (b)} # chop off the end of the directories
    #     # created_at:                             # TBD
    # }
    # )
    # end
    # puts feed_bubble_instance.class
    # feed_bubble_instance.class

    # OLD CODE??
    # [feed_single_bubble] = {
    #     username: current_user,
    #     body: bubble_text,
    #     created_at: bubble_time
    #   }

    # give prominent place to 'refresh' function of feed as I'll want it to
    # stand out against other user options (not sure want to rewrite loops to
    # make feed a 'different place' in user flow)

  end
end

# end
