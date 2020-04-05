class TracksController < ApplicationController
  def index
    @tracks = Track.page(params[:page]).per(10)
  end

  def show
    @track = Track.find params[:id]
    @laps = @track.laps.fastest.order(:time => 'ASC').page(params[:page]).per(30)
  end
end
