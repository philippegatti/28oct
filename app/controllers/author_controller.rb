class AuthorController < ApplicationController
    def new
  	User.new
  end
  def create
  	User.create
  end

  def show
    @user=User.find(params[:id])
    @gossips=Gossip.where(user_id:params[:id])
  end

  def index
    @users=User.all
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
  end
end
