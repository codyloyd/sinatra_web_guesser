require 'sinatra'
require 'sinatra/reloader'

Secret_number = rand 100

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => Secret_number, :guess => guess, :message => message}
end

def check_guess(guess)
  message = ""
  eval = guess <=> Secret_number
  diff = guess - Secret_number 

  if diff.abs >= 5
    message += "<em>a lot</em>"
  elsif diff == 0
  end

  case eval
  when 1
    message += " bigger than"
  when 0 
    message += " the same as"
  when -1
    message += " smaller than"
  end
  
  message
end