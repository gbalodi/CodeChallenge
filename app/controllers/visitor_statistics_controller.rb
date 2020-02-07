class VisitorStatisticsController < ApplicationController
  def index
  	render json: File.read(Rails.root.join('public/samples/api_response.json'))
  end
end
