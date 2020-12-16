@students_default = [
  {name: "Dr Hannibal Lecter", cohort: :november, hobby: "Intellectual pontificating", food: "You"},
  {name: "Darth Vader", cohort: :january, hobby: "Lightsaber tennis", food: "Gunk from vat"},
  {name: "Nurse Ratched", cohort: :december, hobby: "Psychic torture",  food: "Sandwich"},
  {name: "Michael Corleone", cohort: :november, hobby: "Scheming", food: "Revenge"},
  {name: "Terminator", cohort: :march, hobby: "Self repair", food: "Chips"},
  {name: "Freddy Kruger", cohort: :november, hobby: "Daydreaming", food: "Marshmallows"},
  {name: "Count Dracula", cohort: :january, hobby: "Cricket", food: "Blood"},
  {name: "Larry Talbot", cohort: :march, hobby: "Moon gazing", food: "Beef chow mein"},
]
@cohort_default = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "Unknown"]

@students = []

def intro_text
  puts "Please enter the names and the cohorts of the students"
  puts "d: populate with defaults, q: quit"
end

def get_name
  print "Name: "
  @name = gets
  name.gsub!("\r", "")
  name.gsub!("\n", "")
  if name.empty?
    @name = "Student X"
  elsif name == "d"
    @students = @students_default
  end
end

def get_cohort
  print "Cohort: "
  @cohort = gets.chomp
  if cohort.empty?
    @cohort = "Unknown"
  end
  until @cohort_default.include? @cohort.capitalize
    puts "Please enter a valid month"
    @cohort = gets.chomp
  end
end

def input_students
  intro_text
  get_name
  unless name == "q"
    get_cohort
    print "Hobby: "
    hobby = gets.chomp
    if hobby.empty?
      hobby = "Unknown"
    end
    print "Food: "
    food = gets.chomp
    if food.empty?
      food = "Unknown"
    end
  end
  # while the name is not empty, repeat this code
  until name == "q"
    #add the student hash to the array
    students << {name: name, cohort: :"#{cohort}", hobby: hobby, food: food}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another input from the user
    print "Name: "
    name = gets.chomp
    if name.empty?
      name = "Student X"
    end
    print "Cohort: "
    cohort = gets.chomp
    if cohort.empty?
      cohort = "Unknown"
    end
    print "Hobby: "
    hobby = gets.chomp
    if hobby.empty?
      hobby = "Unknown"
    end
    print "Food: "
    food = gets.chomp
    if food.empty?
      food = "Unknown"
    end
  end
  students
end

#print list of students
def print_header
  header_1 = "The students of Villains Academy"
  header_2 = "-------------"
  puts header_1.center(header_1.length + 5)
  puts header_2.center(header_2.length + 5)
end

def print_students(students, choice)
  n = 0
  if choice.empty?
    counter = 0
    until counter == students.count
      if "#{students[counter][:name]}".length < 12
        text = "#{counter + 1}. #{students[counter][:name]}, Cohort: #{students[counter][:cohort]}, Hobby: #{students[counter][:hobby]}, Food: #{students[counter][:food]}"
        puts text.center(text.length + 5)
      end
      counter += 1
    end
  elsif !choice.empty?
    students.each_with_index do |student, index|
      if student[:name][0] == choice.upcase
        text = "#{index + 1}. #{student[:name]}, Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]}, Food: #{student[:food]}"
        puts text.center(text.length + 5)
      end
    end
  end
end

def print_cohort(students)
  sorted = []
  index = 1
  students.each do |student|
    cohort_sort = student[:cohort].to_s
    if !sorted.include? cohort_sort
      sorted.push(cohort_sort)
    end
  end
  sorted.each do |month|
    puts "Month: " + month.upcase
    students.each do |student|
      if student[:cohort].to_s == month
      puts "#{index}. #{student[:name]}, Hobby: #{student[:hobby]}, Food: #{student[:food]}"
      index += 1
      end
    end
  end
end


def print_footer(student_number)
  puts "Overall, we have #{student_number.count} great students"
end

students = input_students
puts "Search by initial, sort by cohort or press return for full list"
choice = gets.chomp
print_header
if choice == "cohort"
  print_cohort(students)
else
  print_students(students, choice)
end
print_footer(students)
