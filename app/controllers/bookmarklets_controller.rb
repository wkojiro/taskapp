class BookmarkletsController < ApplicationController
#        before_action :logged_in_user
#         before_action :set_project, only: [:destroy]            
 

    def index
       @bookmark = Bookmarklet.all
    end


   
    def new
        @project = Project.find(param[:id])
        @bookmark = @project.bookmarklets.build   
    end

    def show
        @bookmark = Bookmarklet.all
    end

    def create
        @project = Project.find(param[:id])
        @bookmark = @project.bookmarklets.build(bookmarklet_params)
        if @bookmark.save
        redirect_to set_request_from
        else
        redirect_to set_request_from
        end
    end

    
    def destroy
        @bookmark.destroy
        redirect_to set_request_from
    end
    private
    
    def bookmarklet_params
        params[:bookmarklet].permit(:title,:url)
    end
        
#    def set_project
#    @bookmark = Bookmarklet.find(params[:id])     
#    end    
    
end
