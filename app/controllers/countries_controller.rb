class CountriesController < ApplicationController
        #include Memorable

        
        def index
          @countries = Country.all 
        end
        def new
          @country = Country.new
        end
        
        def search
          countries = find_country(params[:country])
          @country = countries.first
          @weather = find_weather(@country['capital'], @country['alpha2Code'])
          render :show
        end
        def create
          @country = Country.create(name:@country['name'], capital:@country['capital'], currency:@country['currencies'], timezone:@country['timezones'])
        end
  
   def show
      @country = Country.find(params[:id])
    end 
  
    def edit
      @country = Country.find(params[:id])
    end
  
    def update
      @country = Country.find(params[:id])
      @country.update(country_params)
      redirect_to country_path(@country)
    end
      
      
  
    def find_weather(city, country_code)
      query = URI.encode("#{city},#{country_code}")
  
      request_api("https://community-open-weather-map.p.rapidapi.com/forecast?q=#{query}")
    end
  
  private
  
  def request_api(url)
    response = Excon.get( url,headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPID_API_KEY')} )
  
    return nil if response.status != 200
  
    JSON.parse(response.body)
  end
  
  def find_country(name)
    request_api("https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}")
  end
 
end