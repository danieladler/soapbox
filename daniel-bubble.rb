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
    puts @username.bold.light_yellow + ":\t" + @body
    puts "squeaked at:\t".bold + @created_at.strftime("%A, %d %b %Y %l:%M %p")
    puts "_ _".bold*15
    puts
  end

  def save_file

    File.open("/Users/danieladler/Dropbox/SoapBox/#{@body}", "w") do |file|
      file << "#{@username}"
    end
  end

end
