class VisitsController < ApplicationController
  before_action :set_visit, only: %w(show update destroy)

  def index
  	render json: Visit.all
  end

  def create
  	visit = Visit.new(permit_params)
    if visit.save
      render json: visit.to_json, status: :created
    else
      render json: { errors: visit.errors }, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def permit_params
    params.require(:visit).permit(:evid, :vendor_site_id, :vendor_visit_id, :visit_ip, :vendor_visitor_id, pageviews_attributes: [:id, :visit_id, :title, :position, :url, :time_spent, :timestamp, :_destroy])
  end
end
