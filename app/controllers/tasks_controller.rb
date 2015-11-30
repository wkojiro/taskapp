class TasksController < ApplicationController
    
    def create
     @project = Project.find(params[:project_id])
     @task = @project.tasks.create(task_params)
     redirect_to project_path(@project.id)
    end

    def show
     @project = Project.find(params[:project_id])
     @task = Task.find(params[:id])
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
    
end
