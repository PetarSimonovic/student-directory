def input_students(students)
  puts "Please enter the names and the cohorts of the students"
  puts "To finish, just hit return twice"
  # create an empty array
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

def change_entry(students)
  if students.count == 0
    puts "No students to change"
  else
    puts "Enter index number of the student you eant to amend"
    change_index = gets.chomp.to_i - 1
    # get the first name
    name = gets.chomp
    cohort = gets.chomp
    # while the name is not empty, repeat this code
    students[change_index] = {name: name, cohort: cohort}
  end
  students
end

#print list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
    if students.count == 0
      print "No students have enrolled"
    else
      students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
end

def sort(students)
  puts "Type initial to search by first letter"
  puts "Type 1 to sort by cohort"
  alphabet = gets.chomp
  if alphabet.empty?
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  elsif !alphabet.empty?
    students.each_with_index do |student, index|
      if student[:name][0] == alphabet.upcase
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def menu
  puts "What would you like to do?"
  puts "a - add a name"
  puts "c - change entry"
  puts "p - print the student list"
  puts "q - quit"
end

student_dir = []

menu
action = gets.chomp

while action != "q"
  if action == "a"
    input_students(student_dir)
  elsif action == "p"
    print_header
    print_students(student_dir)
    print_footer(student_dir)
  elsif action == "c"
    change_entry(student_dir)
  end
    menu
    action = gets.chomp
end
