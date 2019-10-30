class WelcomeController < ApplicationController
  def show
  	@gossips=Gossip.all
  end
  def index
  	@gossips=Gossip.all
  end
end
