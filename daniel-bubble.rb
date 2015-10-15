class Bubble
  attr_accessor :username,
                :body,
                :created_at,
                :file #new

  def initialize (b)
    @username = b[:username]
    @body = b[:body]
    @created_at = Time.now.strftime("%A, %d %b %Y %l:%M %p")
  end

  def save_file(b) #argument could be filepath of where file should be saved
    @file = File.open(@body.txt, "w")
  end

end
