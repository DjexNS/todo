class UsersController < ApplicationController
  before_filter :authenticate_user!  
  before_action :set_user, only: [:show, :edit, :update, :destroy, :assign]
  after_action :verify_authorized, except: [:show, :assign]
  respond_to :html, :js, :json

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.all
  end

  def update
    authorize user
    if user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize user
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def assign
    user = User.find(params[:id]) 
    User.assign_task_for user
    
    respond_to do |format|
			if request.xhr?    
    		format.html { redirect_to @user, notice: 'Task was successfully assigned.' }
        format.json { render action: 'show', status: :created, location: @user }
        format.js   { render action: 'show', status: :created, location: @user }
			else
        format.html { render action: 'show' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js   { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    #redirect_to user_path, notice: "Tasks assigned!"
  end
    

    private

    def set_user
        user = User.find(params[:id])
        User.count_tasks_for (user)
    end

    def secure_params
      params.require(:user).permit(:role, :email, :completed_tasks)
    end

end
