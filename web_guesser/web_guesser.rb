require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(101)
@@counter = 5
correct = false
cheat_mode = ""

get '/' do
  message = check_guess(params["guess"])
  color = color(message)

  if params['cheat'] == "true"
    cheat_mode = "Here you go, the number is #{NUMBER}"
end

  if @@counter == 5
    message = "Guess a number!"
    @@counter -= 1
  elsif @@counter == 1 && !correct
    message = "Out of Guesses! Guess again for a new number!"
    color = "blue"
    @@counter = 5
    NUMBER = rand(101)
  elsif correct
    NUMBER = rand(101)
    @@counter = 5
    correct = false
  else
    @@counter -= 1
  end

  erb :index, :locals => { :cheat_mode => cheat_mode, :counter => @@counter, :message => message, :color => color }
  
end
 
def check_guess(guess)
 if guess.nil?
  return "Pick a number 1-100"
else
  if guess.to_i > NUMBER
    return "Too high!"  
  elsif guess.to_i < NUMBER
    return "Too low!"
  else guess.to_i == NUMBER
    return "You Win!"
  end
 end
end

def color(message)
  if message  == "Too low!" || message == "Too high!"
    return "red"
  elsif message == "You Win!"
    return "green"
  else
    return "#ffe5e5"
  end
end
