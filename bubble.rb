class Bubble
  attr_accessor :username
                :body
                :created_at

  def initialize (b)
    @username = b[:username]
    @body = b[:body]
    @created_at = Time.now #I suspect this should be time.now, now b[:created_at] -- but switch back if needed
  end
end

# puts Bubble.class # <- OK -- Bubbles exist as a class
#                        -And I tested in IRB and can create a new Bubble
#                        -Next: empty array of Bubbles that is series of hashes,
#                         each hash consists of the three attributes
#                           1) username (should be automatic once completed first time)
#                           2) body (different user input each time)
#                           1) created_at (comes from Time class -- Time.now)
