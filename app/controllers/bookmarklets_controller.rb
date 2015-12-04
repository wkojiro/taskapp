class BookmarkletsController < ApplicationController
#        before_action :logged_in_user
#         before_action :set_project, only: [:destroy]    
#####
  # 保存する前にTitleを取得
  # 失敗したら、リダイレクトされる
 # before_action :title_get!

    def index
    end

    def new
    end

    def show

    end

    def create
    @user = current_user
    @bookmark = @user.bookmarklets.build(bookmarklet_params)
        if @bookmark.save
            flash[:success] = "bookmark created!"
            redirect_to request.referrer 
        else
            flash[:alert] = "ご登録できませんでした。正しいURLをhttpからご入力下さい。"            
            redirect_to request.referrer 
        end
    end


    
    def destroy
        @bookmark = Bookmarklet.find(params[:id])   
        @bookmark.destroy

            redirect_to request.referrer 
    end
    private
    
    def bookmarklet_params
        params[:bookmarklet].permit(:title,:bookmarkurl)
    end
        

#    def set_project
#    @bookmark = Bookmarklet.find(params[:id])     
#    end    
    
end
