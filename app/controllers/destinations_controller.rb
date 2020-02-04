class DestinationsController < ApplicationController
  
  def show
    @destination = Destination.find(params[:id])
    @most_recent = @destination.most_recent
    @most_likes = @destination.most_likes
    @avg_age = @destination.avg_age
  end

end
