require 'csv'
@students = []

def input_students
  puts "Please enter the names and the cohorts of the students"
  puts "To finish, just hit return twice"
  # get the first name
  # while the name is not empty, repeat this code
  get_students
  while !@name.empty? do
    #add the student hash to the array
    add_students
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another input from the user
    get_students
  end
  @students
end

def get_students
  @name = STDIN.gets.chomp
  @cohort = STDIN.gets.chomp
end

#print list of students
def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students\n"
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save directory"
  puts "4. Load directory"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def menu_selection(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      filename = get_filename(filename)
      save_students(filename)
      puts "Students saved in #{filename}"
    when "4"
      filename = get_filename(filename)
      load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def get_filename(filename)
  puts "Enter filename"
  filename = gets.chomp
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    # 2. read the input and save it into a variable
    # 3. do what the user has asked
    print_menu
    menu_selection(STDIN.gets.chomp)
  end
end


def save_students(filename)
  # open the file
  File.open(filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end


def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(',')
    add_students
    end
  end
  load_message(filename)
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_message(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

def add_students
  @students << {name: @name, cohort: @cohort}
end

try_load_students
interactive_menu
