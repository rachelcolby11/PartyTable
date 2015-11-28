class PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def create
    @party = current_user.parties.build(party_params)
     if @party.save
       flash[:notice] = "Your party was created."
       redirect_to @party
     else
       flash[:error] = "There was an error. Please try again."
       render :new
     end
  end  

  def edit
    @party = Party.find(params[:id])
  end  

  def update
    @party = Party.find(params[:id])
   if @party.update_attributes(party_params)
     flash[:notice] = "Your party has been updated."
     redirect_to @party
   else
     flash[:error] = "There was an error. Please try again."
     render :edit
   end
  end

  def destroy

  end

  def show
    @party = Party.find(params[:id])
  end

  def timeline
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :date)
  end

end