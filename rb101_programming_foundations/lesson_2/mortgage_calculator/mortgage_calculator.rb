# frozen_string_literal: true

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator.yml')

def prompt(key)
  message = messages(key)
  puts("=> #{message}")
end

def messages(message)
  MESSAGES[message]
end

def integer?(input)
  input.to_i.to_s == input && input.to_i.positive?
end

def float?(input)
  input.to_f.to_s == input && input.to_f > 0.0
end

def valid_num?(input)
  integer?(input) || float?(input)
end

def monthly_interest_rate(num)
  (num / 100) / 12
end

def duration_months(num)
  num * 12
end

def monthly_payment(num1, num2, num3)
  (num1 / num2) * num3
end

prompt('welcome')

loop do
  prompt('name')
  name = gets.chomp
  if name.empty?
    prompt('valid_name')
  else
    puts("Nice to meet you, #{name}!")
    break
  end
end

loop do
  loan_amount = ''
  loop do
    prompt('loan_am')
    loan_amount = gets.chomp
    if valid_num?(loan_amount)
      puts("OK, perfect! I have your loan amount as $#{loan_amount} USD")
      break
    else
      prompt('valid_num')
    end
  end
  apr = ''
  loop do
    prompt('enter_apr')
    apr = gets.chomp
    if valid_num?(apr)
      puts("Alright, I have your APR as #{apr}%. Now on to the last thing...")
      break
    else
      prompt('valid_num')
    end
  end

  loan_duration = ''
  loop do
    prompt('loan_dur')
    loan_duration = gets.chomp
    if valid_num?(loan_duration)
      puts("Perfect! your loan duration is #{loan_duration} years.")
      break
    else
      prompt('valid_num')
    end
  end

  prompt('pert_info')

  monthly_interest_rate = monthly_interest_rate(apr.to_f)
  monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-duration_months(loan_duration.to_i)))
  monthly_interest_payment = monthly_payment - (loan_amount.to_f / duration_months(loan_duration.to_i))

  puts "Your loan duration is #{duration_months(loan_duration.to_i)} months."
  puts "Your monthly interest rate is #{monthly_interest_rate.round(5)}%"
  puts "Your monthly interest payment is $#{monthly_interest_payment.round(2)} USD."
  puts "Your monthly payment is $#{monthly_payment.round(2)} USD."

  prompt('again')
  answer = gets.chomp.to_i
  if answer != 1
    prompt('bye')
    break
  else
    prompt('another_round')
  end
end
