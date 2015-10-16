# TO DO:
# *~ create class method for Bubbles -- read whole feed. include refresh inside?
    # def self.read_all
    #  Dir.glob("*")
    # end

# *~ also set class method for read_all_specific_user? -- read whole feed of specific users

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

  def save_file

    File.open("/Users/danieladler/Programming/Code_Builders/ruby_practice/projects/soapbox/bubble_test/#{@body}", "w") do |file|
      file << "#{@username}"
    end
  end
end

#write folder for finished app: /Users/danieladler/Dropbox/SoapBox/


#write folder for testing
# /Users/danieladler/Programming/Code_Builders/ruby_practice/projects/soapbox/bubble_test/
