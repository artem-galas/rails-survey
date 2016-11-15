class HomeController < ApplicationController


  def api
    render json: {
        api: 'Api for angular2-survey'
    }
  end

end