class CityController < ApplicationController
  def show
  	@city=City.find(params[:id])
  	@gossips=Gossip.where(user_id:@city.users.ids)
  end
end
