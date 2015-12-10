class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!
   
   def index
   #   @projects = Project.all 
        if current_user != nil
         @projects = current_user.projects
         @bookmark = current_user.bookmarklets.build
         @user = current_user
         @bookmarks = @user.bookmarklets
         
         
        else
        redirect_to new_user_registration_path
        end
   #   @projects = current_user.projects.find(id: params[:id])
   end
    
   def show
    @bookmark = current_user.bookmarklets.build
    @bookmarks = current_user.bookmarklets
   end
 
 
    def new
     @project = current_user.projects.build
    @bookmarks = current_user.bookmarklets
    @bookmark = current_user.bookmarklets.build          
    end

    def create
 #    @project = Project.new(project_params)
      @project = current_user.projects.build(project_params)
        if @project.save
        redirect_to projects_path
        else
            render 'new'
        end
    end











    def edit
    @bookmarks = current_user.bookmarklets
    @bookmark = current_user.bookmarklets.build    
    end

    def update
        if @project.update(project_params)
            redirect_to projects_path
        else
            render 'edit'
        end
    end

    def destroy
    @project.destroy
    redirect_to projects_path
    end

    
    private
    
    def project_params
        params[:project].permit(:title)
    end
    
    def set_project
    @project = Project.find(params[:id])     
    end
    
end
