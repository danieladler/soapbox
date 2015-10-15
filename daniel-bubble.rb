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

  def save_file  File.open("/Users/danieladler/Programming/Code_Builders/ruby_practice/projects/soapbox/bubble_test/#{@body}", "w") do |file|
      file << "#{@username}"
    end
  end
end
