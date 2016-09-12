require 'sinatra'
# require 'sinatra/reloader'

@@secret_number = 99
@@guesses_remaining = 6

get '/' do
  guess = params["guess"].to_i
  if params["guess"]
    guesses guess
  end
  guess_response = check_guess(guess)
  erb :index, :locals => {:number => @@secret_number, 
                          :guess => guess, 
                          :message => guess_response[0], 
                          :color => guess_response[1],
                          :guesses_remaining => @@guesses_remaining }
end

get '/loser' do
  erb :loser, :locals => {:number => @@secret_number}
end

get '/reset' do
  reset_game
  redirect "/"
end

def guesses guess
    @@guesses_remaining -= 1
  if @@guesses_remaining < 1 && guess != @@secret_number
    redirect "/loser"
  end
end

def reset_game
  @@secret_number = 99
  @@guesses_remaining = 6
end

def check_guess(guess)
  message = ""
  color = "yellow"
  eval = guess <=> @@secret_number
  diff = guess - @@secret_number 

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