class TasksController < ApplicationController
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
    @task=Task.find(params[:id])
  end

  def show
    @task=Task.find(params[:id])
  end
  
  def update
    @task=Task.find(params[:id])
    if @task.update(strong_param)
      flash[:id]='更新されました'
      redirect_to @task
    else
      flash.now[:danger]='更新に失敗しました'
      render :edit
    end    
  end
  
  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    
    flash[:seccess] = '削除に成功しました'
    redirect_to tasks_url
  end
  
  private
  
  def strong_param
    params.require(:task).permit(:content)
  end
end
