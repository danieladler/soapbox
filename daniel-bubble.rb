class Bubble
  attr_accessor :username,
                :body,
                :created_at

  def initialize (b)
    @username = b[:username]
    @body = b[:body]
    @created_at = Time.now 
  end
end

# puts Bubble.class # <- OK -- Bubbles exist as a class
#                      - And I tested in IRB and can create a new Bubble
