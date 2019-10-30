class GossipController < ApplicationController
  def new
  	Gossip.new
  end
  def create
    anonymous=User.new(first_name:"Anonymous", last_name:"unknown",age: 99,description: "unknown",email:"unknown#{rand(1000)}@mail.com",city_id:City.all.sample.id)
    anonymous.save
  	@gossip=Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: anonymous.id)
    if @gossip.save
      @gossips=Gossip.all
      render 'index'
    else
      anonymous.destroy
      render 'new'
    end
  end

  def show
    @gossip=Gossip.find(params[:id])
    @user=User.find(@gossip.user_id)
    @comments=@gossip.comments
  end

  def index
    @gossips=Gossip.all
  end

  def edit
    @gossip=Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip_title], content: params[:gossip_content])
      redirect_to @gossip
    else
      render :edit
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    @gossips=Gossip.all
    render 'gossip/index'
  end
end
