require_relative 'bubble'

all_bubbles = [] #is the very top of the app the best place for this?

# 1. Ask for a username
puts "Please enter username"
input = gets.chomp
username = "@"+input
puts "\nWelcome to Soapbox, " + username + "!"

# 6. Start over at step 2.
while true
  # 2. Ask for the body of a Bubble
  puts "\nEnter text for your Bubble or 'exit':"
  input = gets.chomp
  bubble_text = input
  bubble_time = Time.now #later, figure out how to format time
  current_user = username

    # puts "#{current_user} said #{bubble_text} at #{bubble_time}"
    # ^^^ test for user input coming through - it does!
    # ^^^ But it's not yet a Bubble itself - just a bunch of strings

  if input == "exit"
    puts "\nThanks for using SoapBox!"
    exit

  else

    single_bubble = {username: current_user, body: bubble_text, created_at: bubble_time}
    # ^^^ now user input is in a hash

    # 3. Create a Bubble instance using that information (with created_at being Time.now)
    bubble_instance = Bubble.new(single_bubble)
    # puts bubble_instance.class # <-- now user input exists as an instance of Bubble!

    # puts test_bubble_instance.first
    # ^^having trouble pulling attributes out of this instance of Bubble.

    # 4. Add the bubble instance to an Array
    all_bubbles << bubble_instance

    # puts "all_bubbles empty?"
    # puts all_bubbles.empty? # <-- false -- so it's populated
    # puts "all_bubbles class?"
    # puts all_bubbles.class # <-- array
    # puts "all_bubbles contents - class?"
    # puts all_bubbles.first.class # <-- Bubble

    # 5. Print out the details of each bubble.
    puts "\n#{username}'s Soapbox history"
    all_bubbles.each do |b|
      puts
      puts "\t#{b.username} squeaks:\n\t'#{b.body}'"
      puts "\tsqueaked at: #{b.created_at}" #reformat to shorter time display?
    end
  end
end
