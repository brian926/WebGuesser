require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(101)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = color(message)

  erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
  
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
