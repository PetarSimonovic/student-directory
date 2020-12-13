def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    # 2. read the input and save it into a variable
    # 3. do what the user has asked
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_students(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
      end
    end
  end

def input_students
  puts "Please enter the names and the cohorts of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another input from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  students
end

#print list of students
def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(student_number)
  puts "Overall, we have #{student_number.count} great students\n"
end

interactive_menu
