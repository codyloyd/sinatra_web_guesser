require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand 100
@@guesses_remaining = 5

get '/' do
  guess = params["guess"].to_i
  guess_response = check_guess(guess)
  guesses
  erb :index, :locals => {:number => @@secret_number, 
                          :guess => guess, 
                          :message => guess_response[0], 
                          :color => guess_response[1],
                          :guesses_remaining => @@guesses_remaining }
end

get '/loser' do
  erb :loser, :locals => {:number => @@secret_number}
end

def guesses
  if @@guesses_remaining > 0
    @@guesses_remaining -= 1
  else
    @@secret_number = rand 100
    @@guesses_remaining = 5
    redirect "/loser"
  end
end

def check_guess(guess)
  message = ""
  color = "yellow"
  eval = guess <=> Secret_number
  diff = guess - Secret_number 

  if diff.abs >= 5
    message += "<em>a lot</em>"
    color = "red"
  elsif diff == 0
  end

  case eval
  when 1
    message += " bigger than"
  when 0 
    message += " the same as"
    color = "blue"
  when -1
    message += " smaller than"
  end
  
  [message,color]
end