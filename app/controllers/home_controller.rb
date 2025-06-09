class HomeController < ApplicationController
  def index
    render json: { message: 'O nosso App Rails está no ar!'}
  end
end
