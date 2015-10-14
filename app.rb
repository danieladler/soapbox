require_relative 'bubble'  #<--- turn this on at end, once user flow works



# 4. Add the bubble instance to an Array
# 5. Print out the details of each bubble.
# 6. Start over at step 2.

#                        -Next: empty array of Bubbles that is series of hashes,
#                         each hash consists of the three attributes
#                           1) username (should be automatic once completed first time)
#                           2) body (different user input each time)
#                           1) created_at (comes from Time class -- Time.now)

all_bubbles = [] #might not need this at the top when all is said and done?

# 1. Ask for a username
puts "Please enter username"
input = gets.chomp
username = "@"+input
puts "Welcome to Soapbox, " + username + "!"

# 2. Ask for the body of a Bubble
puts "Enter text for your Bubble:"
input = gets.chomp
bubble_text = input
bubble_time = Time.now #later, figure out how to format time
current_user = username

# puts "#{current_user} said #{bubble_text} at #{bubble_time}"
# ^^^ test for bubble coming through - it does!

single_bubble = {username: current_user, body: bubble_text, created_at: bubble_time}

all_bubbles << single_bubble

# puts "all_bubbles empty?"
# puts all_bubbles.empty? # <-- false -- so it's populated
# puts "all_bubbles class?"
# puts all_bubbles.class # <-- array
# puts "all_bubbles contentes - class?"
# puts all_bubbles.first.class # <-- hash

# 3. Create a Bubble instance using that information (with created_at being Time.now)
test_bubble_instance = Bubble.new(single_bubble)  #for this to work, need to have a hash that contains all 3 attributes of a single bubbles

puts test_bubble_instance.class # <-- now new bubble exists as an instance!
# puts test_bubble_instance.first #having trouble pulling attributes out of this instance of Bubble...but that comes next.
