class FinantialController < ApplicationController

  # before_action :authenticate_establishment!
  def index
    render 'finantial/index'
  end
end
