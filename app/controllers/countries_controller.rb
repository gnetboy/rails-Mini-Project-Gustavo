class CountriesController < HomeController
      include Memorable
   
    def index
      @countries = Country.all 
    end
  
    def show
      @country =country.find(params[:id])
    end
  
    def new
      @country = Country.new
    end
  
    def create
      @country = Country.create(country_params)
      redirect_to country_path(@country)
    end
  
    def edit
      @country = country.find(params[:id])
    end
  
    def update
      @country = country.find(params[:id])
      @country.update(country_params)
      redirect_to country_path(@country)
    end
  
    # private
    # def country_params
    #   params.require(:country).permit(:name, :capital, :currency, :timezone)
    # end
  end