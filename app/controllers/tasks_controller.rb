class TasksController < ApplicationController
  before_action :find, only: [:edit, :update, :show, :delete]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save!
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update!(tasks_params)
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
