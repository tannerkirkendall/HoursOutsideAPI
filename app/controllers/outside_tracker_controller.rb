class OutsideTrackerController < ApplicationController
  before_action :authenticate_user!
  def index
    activity = OutsideTracker.where("user_id = ?", current_user.id)
    render json: { id: activity }
  end

  def create
    local_time = Time.new
    activity = OutsideTracker.new(
      user_id: current_user.id
    )

    if params[:startTime]
      activity.update_attribute(:start_time, params[:startTime])
    else
      activity.update_attribute(:start_time, local_time)
    end

    if params[:endTime]
      activity.update_attribute(:end_time, params[:endTime])
    end

    if params[:description]
      activity.update_attribute(:description, params[:description])
    end

    if activity.save
      render json: activity, status: 200
    else
      render json: { error: "did not save" }
    end
  end

  def update
    activity = OutsideTracker.find_by(id: params[:id], user_id: current_user.id)

    if !activity
      render json: { error: "record not found for user" }, status: 404
      return
    end

    if params[:startTime]
      activity.update_attribute(:start_time, params[:startTime])
    end

    if params[:endTime]
      activity.update_attribute(:end_time, params[:endTime])
    end

    if params[:description]
      activity.update_attribute(:description, params[:description])
    end

    if activity.save
      render json: activity, status: 200
    else
      render json: { error: "did not save" }
    end
  end
end
