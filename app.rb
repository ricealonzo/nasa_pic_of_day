require "sinatra"
require "sinatra/reloader"
require "http"
get("/") do

  
  
  erb(:nasa)
end

get("/nasa_response") do


  nasa_api = "https://api.nasa.gov/planetary/apod?api_key=vhp7EIWktYUlJ8i3VSwyVhLbZiCQM23iif3q6GdB"
  @raw_response = HTTP.get(nasa_api).to_s
  @parsed_response =JSON.parse(@raw_response)

  @date = @parsed_response.fetch("date")
  @explanation = @parsed_response.fetch("explanation")
  @url = @parsed_response.fetch("url")

  erb(:nasa_response)

end
