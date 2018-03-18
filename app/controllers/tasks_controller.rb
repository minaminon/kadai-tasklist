class TasksController < ApplicationController
  before_action :task_param, only: [:show,:edit,:update,:destroy]
  
  
  def index
    @tasks=Task.all
  end
  
  def create
    @task=Task.new(strong_param)
    
    if @task.save
      flash[:success]='タスクが正常に登録されました。'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク登録ができません。'
      render :new
    end
  end
  
  def new
    @task=Task.new
  end
  
  def edit
  end

  def show
  end
  
  def update
    if @task.update(strong_param)
      flash[:id]='更新されました'
      redirect_to @task
    else
      flash.now[:danger]='更新に失敗しました'
      render :edit
    end    
  end
  
  def destroy
    @task.destroy
    
    flash[:seccess] = '削除に成功しました'
    redirect_to tasks_url
  end
  
  private
  
  def task_param
    @task=Task.find(params[:id])
  end
  
  def strong_param
    params.require(:task).permit(:content,:status)
  end
end
