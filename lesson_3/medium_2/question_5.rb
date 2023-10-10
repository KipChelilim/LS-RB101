# Medium 3: Question 5

# Step 1 use concatenation
# Step 2: return both variables after update
def tricky_method_two(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param = ['pumpkins', 'rutabaga']
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

# Step 3: Use multiple assignment for return values
my_string, my_array = tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"