# Step 1: add .size check to make sure size of resulting array is correct
# Step 2: change validation to .each method and iterate through array
# Step 3: condition should return false unless is_an_ip_number? returns true; if
#     all numbers are valid, final evaluation of line sets return value as true

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.to_s.split(".")

  return false unless dot_separated_words.size == 4

  dot_separated_words.each do |string|
    return false unless is_an_ip_number?(string)
  end
  true
end
