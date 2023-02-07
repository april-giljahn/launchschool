# frozen_string_literal: true

VALID_CHOICES = %w[rock paper scissors lizard spock].freeze

require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

def prompt(key)
  message = messages(key)
  puts("=> #{message}")
end

def messages(message)
  MESSAGES[message]
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') || (first == 'rock' && second == 'lizard') || (first == 'lizard' && second == 'spock') || (first == 'spock' && second == 'scissors') || (first == 'scissors' && second == 'lizard') || (first == 'lizard' && second == 'paper') || (first == 'paper' && second == 'spock') || (first == 'spock' && second == 'rock') || (first == 'rock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('win')
  elsif win?(computer, player)
    prompt('comp_won')
  else
    prompt('tie')
  end
end

loop do
  choice = ''
  loop do
    puts("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  puts("You chose: #{choice}; computer chose #{computer_choice}")

  prompt('again')
  again = gets.chomp
  if again.downcase.start_with?('y')
    puts "Ok, let's go!"
  else
    puts 'ok, bye now!'
    break
  end
end
