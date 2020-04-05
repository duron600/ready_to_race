class RacingSessionsController < ApplicationController
  def index
    @racing_sessions = RacingSession.participated.order(:created_at => 'DESC').page(params[:page]).per(10)
  end
end
