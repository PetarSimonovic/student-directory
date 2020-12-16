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
  #replace chomp
  @name.gsub!("\r", "")
  @name.gsub!("\n", "")
  if empty_input_check(@name) == true
    @name = "Unknown"
  end
  puts @name
end

def get_cohort
  print "Cohort: "
  @cohort = gets.chomp
  if empty_input_check(@cohort) == true
    @cohort = "Unknown"
  end
  puts @cohort
  # check cohort for typos and provide default values
  until @cohort_default.include? @cohort.capitalize
    puts "Please enter a valid month"
    @cohort = gets.chomp
    empty_input_check(@cohort)
  end
end

def get_hobby
  print "Hobby: "
  @hobby = gets.chomp
  if empty_input_check(@hobby) == true
    @hobby = "Unknown"
  end
end

def get_food
  print "Favourite food: "
  @food = gets.chomp
  if empty_input_check(@food) == true
    @food = "Unknown"
  end
end


def empty_input_check(input)
  if input.empty?
    return true
  else
    return false
  end
end

def get_student
  get_name
  if @name == "d"
    use_default
  elsif @name != "q"
    get_cohort
    get_hobby
    get_food
  else
    @name
  end
end

def student_count
  if @students.count == 1
    return "we have #{@students.count} student"
  else
    return "we have #{@students.count} students"
  end
end

def use_default
  @students = @students_default
  puts "Default list used"
end

def input_students
  intro_text
  get_student
  until @name == "q"
    unless @name == "d"
      #add the student hash to the array
      @students << {name: @name, cohort: :"#{@cohort}", hobby: @hobby, food: @food}
      puts "Now " + student_count
    end
    # get another input from the user
    get_student
  end
  return @students
end

#print list of students
def print_header
  header_1 = "The students of Villains Academy"
  header_2 = "-------------"
  puts header_1.center(header_1.length + 5)
  puts header_2.center(header_2.length + 5)
end

def print_full_list
  counter = 0
  until counter == @students.count
  ## if "#{@students[counter][:name]}".length < 12
    text = "#{counter + 1}. #{@students[counter][:name]}, Cohort: #{@students[counter][:cohort]}, Hobby: #{@students[counter][:hobby]}, Food: #{@students[counter][:food]}"
    puts text.center(text.length + 5)
  ## end
    counter += 1
  end
end

def print_initial
  @students.each_with_index do |student, index|
    if student[:name][0] == @choice.upcase
      puts "#{index + 1}. #{student[:name]}, Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]}, Food: #{student[:food]}"
    end
  end
end


def print_students
  if @choice.empty?
    print_full_list
  elsif @choice == "cohort"
    print_cohort
  else
    print_initial
  end
end

def sort_cohort
  @sorted = []
  @students.each do |student|
    @cohort_sort = student[:cohort].to_s
    if !@sorted.include? @cohort_sort
      @sorted.push(@cohort_sort)
    end
  end
end

def print_cohort
  sort_cohort
  @sorted.each do |month|
    index = 1
    puts "Month: " + month.upcase
    @students.each do |student|
      if student[:cohort].to_s == month
      puts "#{@index}. #{student[:name]}, Hobby: #{student[:hobby]}, Food: #{student[:food]}"
      index += 1
      end
    end
  end
end

def print_footer
  puts "Overall, " + student_count
end

@students = input_students
puts "Search by initial, sort by cohort or press return for full list"
@choice = gets.chomp
print_header
if @choice == "cohort"
  print_cohort
else
  print_students
end
print_footer
