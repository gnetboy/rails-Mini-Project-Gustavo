class CountriesController < ApplicationController
        include Memorable 

        
        def index
          @countries = Country.all 
        end
      def new
        @country = Country.new
      end
        
        def search
          nation = find_country(params[:country]) #if nation.nil? render :index
          @country = nation.first
          @country = Country.create(name:@country['name'], capital:@country['capital'], currency:@country['currencies'], timezone:@country['timezones'])
        
          @weather = find_weather(@country['capital'], @country['alpha2Code'])
          render :show
        end
        
  
     def show
      @country = Country.find(params[:id])
     end 
     
    def edit
      @country = Country.find(params[:id])
    end
  
    def destroy
      @country = Country.find(params[:id]).destroy
      redirect_to countries_url
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
  
    JSON.parse(response.body)
  end
  
  def find_country(name)
    request_api("https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}")
  end
  # def country_params
  #   params.require(:country).permit(:name, :capital, :currency, :timezone)
  # end
 
end