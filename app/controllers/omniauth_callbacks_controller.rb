class OmniauthCallbacksController < ApplicationController
#    def twitter
#        @user = User.from_omniauth(request.env["omniauth.auth"])
##        #.except("extra")部分を削除してみた。
#
#        if @user.persisted?
#            flash.notice = "ログインしました！"
#            sign_in_and_redirect @user
#        else
#            session["devise.user_attributes"] = @user.attributes
#            redirect_to new_user_registration_url
#        end
#    end
#     
#    def facebook
#         @user = User.from_omniauth(request.env['omniauth.auth'].to_yaml)
#         
#        if @user.persisted?
#            flash.notice = "ログインしました！"
#            sign_in_and_redirect @user
#        else
#            session["devise.user_attributes"] = @user.attributes
#            redirect_to new_user_registration_url
#        end         
#    end
     
     
  def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end

  private
    def callback_from(provider)
      provider = provider.to_s
      @user = User.find_for_oauth(request.env['omniauth.auth'])
      if @user.persisted?
        cookies.permanent[:xxx_logined] = { value: @user.created_at }
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
        sign_in_and_redirect @user, event: :authentication
      else
        if provider == 'twitter'
          session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
        end
        redirect_to new_user_registration_url
      end
    end     
     
     
end
