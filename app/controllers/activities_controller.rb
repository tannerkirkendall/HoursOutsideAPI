class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    render json: UserSerialzier.new(current_user).serializeable_hash[:data][:attributes], status: :ok
  end
end
