class ProjectsController < ApplicationController
  before_action :set_user    
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!
   
   def index
   #   @projects = Project.all 
   # 戻り値が true ならサインイン済み。
#   http://qiita.com/Salinger/items/873e3c667462746ae707
#user_signed_in?
# サインインしている全ユーザー取得
#current_user
# ユーザーのセッション情報
#user_session


        if user_signed_in? 

         @projects = @user.projects
         @bookmark = @user.bookmarklets.build
         @bookmarks = @user.bookmarklets

        else
        redirect_to new_user_registration_path
        end
   #   @projects = current_user.projects.find(id: params[:id])
   end
    
   def show
        if @project.present? &&  @project.user_id == @user.id 
           @bookmark = current_user.bookmarklets.build
           @bookmarks = current_user.bookmarklets
        else
        redirect_to new_user_registration_path
        end
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
      begin
       @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        redirect_to new_user_registration_path
      end
    end
    
    def set_user
        @user = current_user
#             @current_user ||= User.find_by(id: session[:user_id])
 # @user ||= User.find_by(id: user_session[:user_id])
 #   @user = User.find(user_session[:id])
    end
end
