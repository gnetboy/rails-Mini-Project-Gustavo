class CountriesController < ApplicationController


        
        def index
          @countries = Country.all 
        end
      
        def new
        @country = Country.new
        end

      def trip
        if !current_user.country_ids.include?  params[:id].to_i
          trip = current_user.country_users.build(country_id: params[:id], start_date: params[:start_date] , end_date: params[:end_date])
          if trip.save
            flash[:notice] = "Trip created" 
          else
            flash[:notice] =  trip.errors.full_messages.to_sentence
          end
        else
          @country = CountryUser.find_by(country_id: params[:id], user_id: current_user.id)
          
           CountryUser.delete(@country.id)
        
              end
          redirect_to countries_path
      end
        
        def search
          nation = Restcountry::Country.find_by_name(params[:country])
          @country = Country.create(name:nation.name, capital:nation.capital, currency:nation.currencies, timezone:nation.timezones) 
          @weather = find_weather(@country['capital'])
          #@weather = find_weather(@country['capital'], @country['alpha2Code'])
          render :show
        end

        def create
          @country = Country.new(country_params)
          @country.save
        end
  
     def show
      @country = Country.find(params[:id])
     end 
     

    def destroy
      @country = Country.find(params[:id]).destroy
      redirect_to countries_url
    end
      
    def find_weather(city)
      query = URI.encode("#{city}")
      request_api("https://community-open-weather-map.p.rapidapi.com/weather?q=#{query}")
    end
  
    # def find_weather(city, country_code)
    #   query = URI.encode("#{city},#{country_code}")
    #  # request_api("https://community-open-weather-map.p.rapidapi.com/forecast?q=#{query}")
    # end
     
  
  private
  
  def request_api(url)
    response = Excon.get( url,headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPID_API_KEY')} )
  
    JSON.parse(response.body)
  end
  
  def country_params
    params.require(:country).permit(:name, :capital, :currency, :timezone)
  end
 
end