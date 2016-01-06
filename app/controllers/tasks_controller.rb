class TasksController < ApplicationController
    before_action :set_user     
    before_action :set_project, only: [:show,:edit,:update,:destroy]    
    before_action :authenticate_user!
    
    def create
#     @project = Project.find(params[:project_id])
     @task = @project.tasks.create(task_params)
     redirect_to project_path(@project.id)
    end

    def show
#この書き方だと他の人のプロジェクトにもアクセスできてしまう。  
#UserがProjectと紐づき、taskとProjectが紐づいていることを前提とする必要がある。

        if user_signed_in? && @project.user_id == @user.id
       #      @task = @oroject.tasks.find(params[:id])

             @task = Task.find_by_id(params[:id])
             if @task == nil or @task.project_id != @project.id
              redirect_to new_user_registration_path
             end
        else  
         redirect_to new_user_registration_path    
        end
 #    @subtask = Subtask.find(params[:id])  
    @bookmarks = current_user.bookmarklets
    @bookmark = current_user.bookmarklets.build    
    end




    def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to project_path(params[:project_id])
    end
     
    def toggle
        render nothing: true
        @task = Task.find(params[:id])
        @task.done = !@task.done
        @task.save
    end
    
    def edit
     @project = Project.find(params[:project_id])
     @task = Task.find(params[:id])
 #   @subtask = Subtask.find(params[:id])       
    @bookmarks = current_user.bookmarklets
    @bookmark = current_user.bookmarklets.build
    end

    def update
     @project = Project.find(params[:project_id])
     @task = Task.find(params[:id])
        if @task.update(task_params)
           redirect_to project_path(params[:project_id])
        else
            render 'show'
        end
    end
     
     
    private
    
    def task_params
        params[:task].permit(:title)
    end   
    def set_project
      begin
       @project = Project.find(params[:project_id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to new_user_registration_path
      end
    end
    def set_user

    @user = current_user

    end    
    
end
