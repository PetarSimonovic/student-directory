def input_students(students)
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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  puts "Search by letter or press return for full list"
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

def print_footer(student_number)
  puts "Overall, we have #{student_number.count} great students"
end

students =[]
input_students(students)
print_header
print_students(students)
print_footer(students)
