class Bubble
  attr_accessor :username,
                :body,
                :created_at

  def initialize (b)
    @username = b[:username]
    @body = b[:body]
    @created_at = Time.now.strftime("%A, %d %b %Y %l:%M %p")
  end
end
