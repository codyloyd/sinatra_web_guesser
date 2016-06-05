require 'sinatra'
require 'sinatra/reloader'

secret_number = rand 100

get '/' do
  guess = params['guess'].to_i
  eval = guess <=> secret_number
  diff = guess - secret_number
  erb :index, :locals => {:number => secret_number, :guess => guess, :eval => eval, :diff => diff}
end

