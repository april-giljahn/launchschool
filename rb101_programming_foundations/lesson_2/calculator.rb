def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i() !=0
end
 
def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end


def operation_to_message(answer)
  word = case answer
  when '1'
    "adding"
  when '2'
    "subtracting"
  when '3'
    "multiplying"
  when '4'
    "dividing"
  end
end

prompt("Whats your name?")
name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt("make sure to use a valid name.")
  else
    break
  end
end

prompt("hi, #{name}!")

loop do
num1 = ''
loop do
  prompt("pick a number")
  num1 = gets.chomp.to_i

  if valid_number?(num1)
    break
  else
    prompt("Hmm...that doesnt look like a valid number")
  end
end
num2 = ''
loop do
  prompt("pick a second number")
  num2 = gets.chomp.to_i

  if valid_number?(num2)
    break
  else
    prompt("Hmm...that doesnt look like a valid number")
  end
end
operator_prompt = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

prompt(operator_prompt)
answer = ''
loop do
answer = gets.chomp
if  %w(1 2 3 4).include?(answer)
  break
else
  prompt("must choose 1,2,3 or 4")
end
end

prompt("#{operation_to_message(answer)} the two numbers..")


result = case answer
when '1'
  result = num1  + num2
when '2'
  result = num1  - num2
when '3'
  result = num1  * num2
when '4'
  result = num1.to_f / num2.to_f
else
 puts "enter a valid number please"
end


prompt("The result is #{result}")
prompt("do you want to perform another calculation?(type 'y' for again")
obtain = gets.chomp
break unless obtain.downcase().start_with?('y')
end

prompt("goodbye!")