class DashboardController < ApplicationController
include Accessible
  before_action :authenticate_user!, :except => [:index]

  def index
  	binding.pry
  end

  def request_cab
  end

end
