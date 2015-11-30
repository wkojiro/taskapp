class SubtasksController < ApplicationController
    
    def create
    @porject = Project.find(params[:project_id])    
     @task = Task.find(params[:task_id])
     @subtask = @task.subtasks.create(subtask_params)
  #  redirect_to project_task_path(id: @project.task)
    redirect_to project_task_path(id: @task) 
   #  redirect_to project_task_path(@project.id,@task.id)
   #  redirect_to project_task_path(@project.id)   
#   redirect_to project_task_path(@project.task_id,@task.id) 
#   redirect_to  :controller => 'tasks',:action => "show", :project_id => "@project" ,:task_id => "@task" 





    end



    def destroy
    @porject = Project.find(params[:project_id])    
    @task = Task.find(params[:task_id])        
    @subtask  = Subtask.find(params[:id])
    @subtask.destroy
    
 #   redirect_to project_task_path(id: @project.task)
    redirect_to project_task_path(id: @task)    
    
    end

         

     
    def toggle
        render nothing: true
        @subtask = Subtask.find(params[:id])
        @subtask.done = !@subtask.done
        @subtask.save
    end
    
    def edit
     @project = Project.find(params[:project_id])
     @task = Task.find(params[:task_id])     
     @subtask = Subtask.find(params[:id])
    @bookmarks = current_user.bookmarklets
    @bookmark = current_user.bookmarklets.build     
    end

    def update
     @project = Project.find(params[:project_id])
     @task = Task.find(params[:task_id]) 
     @subtask = Subtask.find(params[:id])     
        if @subtask.update(subtask_params)
        redirect_to project_task_path(id: @task) 
        else
            render 'show'
        end
    end
         
    
    
    private
    
    def subtask_params
        params[:subtask].permit(:memo,:description)
    end   
        
end
