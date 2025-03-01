class OutsideTrackerController < ApplicationController
  before_action :authenticate_user!
  def index
    activity = OutsideTracker.all
    render json: { id: activity }
    # render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    t = Time.new
    activity = OutsideTracker.new(
      start_time: t,
      user_id: current_user.id
    )
    if activity.save
      render json: activity, status: 200
    else
      render json: { error: "did not save" }
    end
  end
end
