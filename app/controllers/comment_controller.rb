class CommentController < ApplicationController
	def new
	  	Comment.new
	end
  def create
    anonymous=User.new(first_name:"Anonymous", last_name:"unknown",age: 99,description: "unknown",email:"unknown#{rand(1000)}@mail.com",city_id:City.all.sample.id)
    anonymous.save
  	@comment=Comment.new(content: params[:comment_content], user_id: anonymous.id, gossip_id: params[:gossip_id])
  	@gossip=Gossip.find(params[:gossip_id])
  	@user=User.find(@gossip.user_id)
  	if @comment.save
      render 'gossip/show'
    else
      anonymous.destroy
      render 'gossip/show'
    end
  end

  def show
    @comment=Comment.where(gossip_id: :gossip_id, id: params[:id])
  end

  def index
    @comments=Comment.where(gossip_id: :gossip_id)
  end

  def edit
    @gossip=Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
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
    render 'index'
  end

end
