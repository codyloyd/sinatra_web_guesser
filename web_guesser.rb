require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @number = rand 100
  "The secret NUMBER is #{@number}!"
end