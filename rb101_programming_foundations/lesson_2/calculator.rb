=begin
1.) ask user for two numbers
2.) ask for type of operation(add, subtract, multiply, and divide)
3.) perform operation
4.) display results
=end

puts "pick a number"
num1 = gets.chomp.to_i
puts "pick a second number"
num2 = gets.chomp.to_i
puts "what operation would you like to use? 1.) add 2.) subtract 3.) multiply 4.) divide"
answer = gets.chomp.to_i

if answer == 1
  puts num1 + num2
elsif answer == 2
  puts num1 - num2
elsif answer == 3
  puts num1 * num2
elsif answer == 4
  puts num1.to_f / num2.to_f
else 
  puts "enter a valid number please"
end
