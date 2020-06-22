class HomeController < ApplicationController
  def index
    render json: { opa: 'hey' }
  end
end
