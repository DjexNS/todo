class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :romanize_for,  only: [:index, :show, :edit, :update, :destroy]
  respond_to :html, :json, :js
  

  def index
    respond_with(@tasks = Task.all)

  end


  def show    
  end


  def new
    @task = Task.new
  end


  def edit
  end

  def shuffle
    task = Task.find(params[:id]) 
    Task.shuffle_task_for task

    redirect_to task_path, notice: "Task shuffled!"
  end


  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_task
      @task = Task.find(params[:id])
    end

    def romanize_for
      tasks = Task.all
      Task.romanize_for tasks
    end

    def task_params
      params.require(:task).permit(:name, :description, :completed, :roman, :deadline)
    end
end
