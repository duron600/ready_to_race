class RacingSessionsController < ApplicationController
  def index
    @racing_sessions = RacingSession.order(:created_at => 'DESC').page(params[:page]).per(10)
  end
end
