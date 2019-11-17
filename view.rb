class BasicView
end

class FileDialogView < BasicView
  def display
    puts "Please select an apache log file"
  end
end

class LogListView < BasicView
end

class SortFilterView < BasicView
end