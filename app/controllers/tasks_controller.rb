class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Taskが投稿されません'
    　render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
