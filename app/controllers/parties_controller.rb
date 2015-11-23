class PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def create
    @party = current_user.parties.build(party_params)
     if @party.save
       flash[:notice] = "Your party was created."
       redirect_to welcome_path
     else
       flash[:error] = "There was an error. Please try again."
       render :new
     end
  end  

  def edit

  end  

  def update

  end

  def destroy

  end

  def show
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :date)
  end

end