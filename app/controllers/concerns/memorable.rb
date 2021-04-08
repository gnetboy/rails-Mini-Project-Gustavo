module Memorable

    def country_params
      params.require(:country).permit(:name, :capital, :currency, :timezone)
    end
end