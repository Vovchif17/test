def isbn13_check(number)
  number = number.scan(/\d/).join
  return nil unless number.size == 12

  sum = number.each_char.with_index.sum { |digit, index| digit.to_i * (index.even? ? 1 : 3) }
  (10 - (sum % 10)) % 10
end

number = "478014300723"
result = isbn13_check(number)

if result
  puts "The complete ISBN is: #{number}#{result}"
else
  puts "Invalid input. The ISBN should be 12 digits long."
end