class ForecastsController < ApplicationController
  def index

    @city = params[:city] || "Chicago"
    @state = params[:state] || "IL"

    forecast = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{@city}%2C%20#{@state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @image  = forecast["query"]["results"]["channel"]["item"]["description"][11..47]
    @date = forecast["query"]["results"]["channel"]["item"]["forecast"][0]["date"]
    @city_time = forecast["query"]["results"]["channel"]["item"]["title"]
    @high_temp = forecast["query"]["results"]["channel"]["item"]["forecast"][0]["high"]
    @low_temp = forecast["query"]["results"]["channel"]["item"]["forecast"][0]["low"]
    @conditions = forecast["query"]["results"]["channel"]["item"]["forecast"][0]["text"]
    @forecasts = forecast["query"]["results"]["channel"]["item"]["forecast"]
  end

  def show

  end
end
