class LogParserController
  def initialize
    @log_file = LogFile.new
    @current_view = FileDialogView.new
    @current_view.clear_display
    @current_view.set_cursor
    @current_view.display @log_file
  end

  def run
    while user_input = $stdin.getch do
      begin
        while next_chars = $stdin.read_nonblock(10) do
          user_input = "#{user_input}#{next_chars}"
        end
      rescue => the_exception
        the_exception.backtrace
      end
      if @current_view.quittable? && user_input == 'q'
        break
      else
        parse_input user_input
      end
    end
  end

  def parse_input user_input
    case user_input
    when "\n"
      puts "next line"
    when "\e[A"
      puts "up button"
    when "\e[B"
      puts "down button"
    when "\e[C"
      puts "right button"
     when "\e[D"
      puts "left button"
     else
      puts "do something"
     end
  end
end
