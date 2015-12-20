class TasksController < ApplicationController

  def new
   @party = Party.find(params[:party_id])
   @task = Task.new
  end

  def create
    @party = Party.find(params[:party_id])
    @task = @party.tasks

    @task = current_user.tasks.build(task_params )
    @task.party = @party
    @new_task = Task.new

     if @task.save
       flash[:notice] = "Your task was created."
       redirect_to welcome_path
     else
       flash[:error] = "There was an error. Please try again."
       render :new
     end
  end 

  def edit
    @party = Party.find(params[:party_id])
    @task = Task.find(params[:id])
  end  

  def update
    @party = Party.find(params[:party_id])
    @task = Task.find(params[:id])
   if @task.update_attributes(task_params)
     flash[:notice] = "Your task has been updated."
     redirect_to @party
   else
     flash[:error] = "There was an error. Please try again."
     render :edit
   end
  end

  def destroy

  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :category, :duration, :start_time, :end_time)
  end

end