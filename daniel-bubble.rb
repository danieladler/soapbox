# TO DO:
# *~ add 'path' class method - refer to filepath within here
# *~ add welcome note as a class method?
# *~ create class method for Bubbles -- read whole feed. include refresh inside?
    # def self.read_all
    #  Dir.glob("*")
    # end

# *~ also set class method for read_all_specific_user? -- read whole feed of specific users

class Bubble
  attr_accessor :username,
                :body,
                :created_at,
                :file,
                :birthtime

  def initialize (b)
    @username   = b[:username]
    @body       = b[:body]
    @created_at = if b[:created_at] != nil
        b[:created_at]
      else
        Time.now
      end
  end

  def format
    line_width = 40
    puts @username.bold.light_yellow + ":" + @body.center(line_width)
    puts "squeaked at: ".bold + @created_at.strftime("%A, %d %b %Y %l:%M %p").center(line_width)
    puts "_ _".bold*15
    puts
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
