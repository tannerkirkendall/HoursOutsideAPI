class OutsideTrackerController < ApplicationController
  before_action :authenticate_user!
  def index
    activity = OutsideTracker.where("user_id = ?", current_user.id)
    render json: { id: activity }
  end

  def create
    activity = OutsideTracker.new(
      user_id: current_user.id
      )

      if params[:start_time]
        activity.update_attribute(:start_time, params[:start_time])
      else
        local_time = Time.new
        activity.update_attribute(:start_time, local_time)
      end

    if params[:end_time]
      activity.update_attribute(:end_time, params[:end_time])
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

    if params[:start_time]
      activity.update_attribute(:start_time, params[:start_time])
    end

    if params[:end_time]
      activity.update_attribute(:end_time, params[:end_time])
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

  def delete
    activity = OutsideTracker.find_by(id: params[:id], user_id: current_user.id).delete
    if activity.delete
      render json: activity, status: 200
    else
      render json: { error: "did not delete" }
    end

  end
end
